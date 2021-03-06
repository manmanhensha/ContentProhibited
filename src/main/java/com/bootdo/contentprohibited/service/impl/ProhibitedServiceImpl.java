package com.bootdo.contentprohibited.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.ObjectUtil;
import com.bootdo.common.utils.ShiroUtils;
import com.bootdo.contentprohibited.dao.ProhibitedDao;
import com.bootdo.contentprohibited.domain.ErrorCode;
import com.bootdo.contentprohibited.domain.ProhibitedEntity;
import com.bootdo.contentprohibited.dto.PartitionInDTO;
import com.bootdo.contentprohibited.dto.PartitionOutDTO;
import com.bootdo.contentprohibited.dto.ProhibitedOutDTO;
import com.bootdo.contentprohibited.service.PartitionService;
import com.bootdo.contentprohibited.service.ProhibitedService;
import com.google.common.collect.Lists;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @description: 违禁词业务实现
 */
@Service
@Slf4j
public class ProhibitedServiceImpl implements ProhibitedService {

	@Autowired
	private ProhibitedDao prohibitedDao;

	@Autowired
	private PartitionService partitionService;

	/**
	 * 批量添加违禁词
	 *
	 * @param prohibitedList 违禁词集合
	 * @return {@code true} 操作成功 {@code false} 操作失败
	 * @throws RuntimeException 社区异常
	 */

	@Transactional(rollbackFor = Exception.class)
	@Override
	public boolean insertProhibitedList(List<String> prohibitedList) throws RuntimeException {
		// 判断违禁词是否已存在
		Example example = new Example(ProhibitedEntity.class);
		example.selectProperties("code");
		example.createCriteria().andIn("code", prohibitedList);

		List<ProhibitedEntity> existCodes = prohibitedDao.selectByExample(example);
		if (CollectionUtil.isNotEmpty(existCodes)) {
			log.error("违禁词已存在:{} {}", ErrorCode.PROHIBITED_0003,
					existCodes.stream().map(ProhibitedEntity::getCode).collect(Collectors.joining(",")));
			// 违禁词已存在
			throw new RuntimeException();
		}

		final List<ProhibitedEntity> list = Lists.newArrayListWithCapacity(prohibitedList.size());
		prohibitedList.forEach(it -> {
			final ProhibitedEntity insertEntity = new ProhibitedEntity();
			insertEntity.setCode(it);
			insertEntity.setCreatedBy(ShiroUtils.getUser().getName());
			insertEntity.setCreatedTime(new Date());
			list.add(insertEntity);
		});
		if (prohibitedDao.insertList(list) == prohibitedList.size()) {
			// 添加违禁词列表
			ProhibitedHelper.getInstance().addWords(prohibitedList);
			return true;
		}
		return false;
	}

	/**
	 * 批量删除违禁词
	 *
	 * @param prohibitedIdList 违禁词ID集合
	 * @return {@code true} 操作成功 {@code false} 操作失败
	 * @throws RuntimeException 社区异常
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public boolean deleteProhibitedList(List<String> prohibitedIdList) throws RuntimeException {
		// 查询
		Example selectExample = new Example(ProhibitedEntity.class);
		selectExample.createCriteria().andIn("prohibitedId", prohibitedIdList);
		List<ProhibitedEntity> selectList = prohibitedDao.selectByExample(selectExample);
		// 删除
		Example deleteExample = new Example(ProhibitedEntity.class);
		deleteExample.createCriteria().andIn("prohibitedId", prohibitedIdList);
		if (prohibitedDao.deleteByExample(deleteExample) > 0) {
			// 删除违禁词
			ProhibitedHelper.getInstance().removeWordList(selectList.stream().map(ProhibitedEntity::getCode).collect(Collectors.toList()));
			return true;
		}
		return false;
	}

	@Override
	public int deleteProhibitedOne(String prohibitedId) {
		final Example example = new Example(ProhibitedEntity.class);
		example.createCriteria().andEqualTo("prohibitedId", prohibitedId);

		return prohibitedDao.deleteByExample(example);
	}

	/**
	 * 分页查询-违禁词列表
	 *
	 * @param inDTO 输入数据
	 * @return 分页查询结果集
	 * @throws RuntimeException 社区异常
	 */
	@Override
	public PartitionOutDTO<ProhibitedOutDTO> selectProhibitedList(PartitionInDTO<String> inDTO) throws RuntimeException {
		return partitionService.partition(inDTO, code -> {
			final Example example = new Example(ProhibitedEntity.class);
			if (StringUtils.isNotBlank(code)) {
				example.createCriteria().andEqualTo("code", code);
			}

			final List<ProhibitedEntity> selectList = prohibitedDao.selectByExample(example);
			if (CollectionUtil.isNotEmpty(selectList)) {
				final List<ProhibitedOutDTO> resultList = Lists.newArrayListWithCapacity(selectList.size());
				selectList.forEach(it -> {
					ProhibitedOutDTO resultItem = new ProhibitedOutDTO();
					BeanUtil.copyProperties(it, resultItem);
					resultList.add(resultItem);
				});
				return resultList;
			}
			return null;
		});
	}

	@Override
	public List<ProhibitedEntity> list(Map<String, Object> map) {
		final Example example = new Example(ProhibitedEntity.class);
		if (ObjectUtil.isNotEmpty(map.get("code"))) {
			example.createCriteria().andLike("code", "%" + map.get("code") + "%");
			return prohibitedDao.selectByExample(example);
		} else {
			return prohibitedDao.selectAll();
		}

	}

	@Override
	public ProhibitedEntity get(String prohibitedId) {
		final Example example = new Example(ProhibitedEntity.class);
		example.createCriteria().andEqualTo("prohibitedId", prohibitedId);

		return prohibitedDao.selectOneByExample(example);
	}

	@Override
	public boolean editProhibited(ProhibitedEntity entity) {
		Example example = new Example(ProhibitedEntity.class);
		example.createCriteria().andEqualTo("prohibitedId", entity.getProhibitedId());

		entity.setUpdatedTime(new Date());
		entity.setUpdatedBy(ShiroUtils.getUser().getName());

		return prohibitedDao.updateByExampleSelective(entity, example) == 1;
	}

	/**
	 * 刷新违禁词列表
	 *
	 * @return
	 * @throws RuntimeException
	 */
	@Override
	public void refreshProhibitedList() throws RuntimeException {
		ProhibitedHelper.getInstance()
				.addWords(prohibitedDao.selectAll().stream().distinct()
						.map(ProhibitedEntity::getCode).collect(Collectors.toList()));
		log.warn("违禁词列表:{}", ProhibitedHelper.getInstance().getAll());
	}

	/**
	 * 敏感词匹配
	 *
	 * @param content 内容
	 * @return 匹配到的敏感词集合
	 * @throws RuntimeException
	 */
	@Override
	public List<String> matchWords(String content) throws RuntimeException {
		return ProhibitedHelper.getInstance().matchAll(content);
	}

}
