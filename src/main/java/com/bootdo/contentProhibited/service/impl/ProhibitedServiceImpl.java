package com.bootdo.contentProhibited.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.IdUtil;
import com.bootdo.contentProhibited.dao.ExtProhibitedDao;
import com.bootdo.contentProhibited.dao.ProhibitedDao;
import com.bootdo.contentProhibited.dto.PartitionInDTO;
import com.bootdo.contentProhibited.dto.PartitionOutDTO;
import com.bootdo.contentProhibited.dto.ProhibitedOutDTO;
import com.bootdo.contentProhibited.domain.ErrorCode;
import com.bootdo.contentProhibited.domain.ProhibitedEntity;
import com.bootdo.contentProhibited.service.PartitionService;
import com.bootdo.contentProhibited.service.ProhibitedService;
import com.google.common.collect.Lists;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;

import java.util.Date;
import java.util.List;
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
	private ExtProhibitedDao extProhibitedDao;

	@Autowired
	private PartitionService partitionService;

	/**
	 * 批量添加违禁词
	 *
	 * @param userId         用户ID
	 * @param prohibitedList 违禁词集合
	 * @return {@code true} 操作成功 {@code false} 操作失败
	 * @throws RuntimeException 社区异常
	 */

	@Transactional(rollbackFor = Exception.class)
	@Override
	public boolean insertProhibitedList(String userId, List<String> prohibitedList) throws RuntimeException {
		// 判断违禁词是否已存在
		Example example = new Example(ProhibitedEntity.class);
		example.selectProperties("code");
		example.createCriteria().andIn("code", prohibitedList);
		List<ProhibitedEntity> existCodes = prohibitedDao.selectByExample(example);
		if (CollectionUtil.isNotEmpty(existCodes)) {
			log.error("违禁词已存在:{} {}", ErrorCode.PROHIBITED_0003,
					existCodes.stream().map(it -> it.getCode()).collect(Collectors.joining(",")));
			// 违禁词已存在
			throw new RuntimeException();
		}

		final List<ProhibitedEntity> list = Lists.newArrayListWithCapacity(prohibitedList.size());
		prohibitedList.forEach(it -> {
			final ProhibitedEntity insertEntity = new ProhibitedEntity();
			insertEntity.setProhibitedId(IdUtil.simpleUUID());
			insertEntity.setCode(it);
			insertEntity.setCreatedBy(userId);
			insertEntity.setCreatedTime(new Date());
			list.add(insertEntity);
		});
		if (extProhibitedDao.batchInsert(list) == prohibitedList.size()) {
			// 添加违禁词列表
			ProhibitedHelper.getInstance().addWords(prohibitedList);
			return true;
		}
		return false;
	}

	/**
	 * 批量删除违禁词
	 *
	 * @param userId           用户ID
	 * @param prohibitedIdList 违禁词ID集合
	 * @return {@code true} 操作成功 {@code false} 操作失败
	 * @throws RuntimeException 社区异常
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public boolean deleteProhibitedList(String userId, List<String> prohibitedIdList) throws RuntimeException {
		// 查询
		Example selectExample = new Example(ProhibitedEntity.class);
		selectExample.createCriteria().andIn("prohibitedId", prohibitedIdList);
		List<ProhibitedEntity> selectList = prohibitedDao.selectByExample(selectExample);
		// 删除
		Example deleteExample = new Example(ProhibitedEntity.class);
		deleteExample.createCriteria().andIn("prohibitedId", prohibitedIdList);
		if (prohibitedDao.deleteByExample(deleteExample) > 0) {
			// 删除违禁词
			ProhibitedHelper.getInstance().removeWordList(selectList.stream().map(it -> it.getCode()).collect(Collectors.toList()));
			return true;
		}
		return false;
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

	/**
	 * 刷新违禁词列表
	 *
	 * @return
	 * @throws RuntimeException
	 */
	@Override
	public void refreshProhibitedList() throws RuntimeException {
		ProhibitedHelper.getInstance().addWords(prohibitedDao.selectAll().stream().map(it -> it.getCode()).collect(Collectors.toList()));
		log.error("违禁词列表:{}", ProhibitedHelper.getInstance().getAll());
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
