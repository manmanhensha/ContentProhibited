package com.bootdo.contentprohibited.service;


import com.bootdo.contentprohibited.domain.ProhibitedEntity;
import com.bootdo.contentprohibited.dto.PartitionInDTO;
import com.bootdo.contentprohibited.dto.PartitionOutDTO;
import com.bootdo.contentprohibited.dto.ProhibitedOutDTO;

import java.util.List;
import java.util.Map;

/**
 * @description: 违禁词
 */
public interface ProhibitedService {

	/**
	 * 批量添加违禁词
	 *
	 * @param prohibitedList 违禁词集合
	 * @return {@code true} 操作成功 {@code false} 操作失败
	 * @throws RuntimeException 社区异常
	 */
	boolean insertProhibitedList(List<String> prohibitedList) throws RuntimeException;

	/**
	 * 批量删除违禁词
	 *
	 * @param prohibitedIdList 违禁词ID集合
	 * @return {@code true} 操作成功 {@code false} 操作失败
	 * @throws RuntimeException 社区异常
	 */
	boolean deleteProhibitedList(List<String> prohibitedIdList) throws RuntimeException;

	/**
	 * 删除一个
	 */
	int deleteProhibitedOne(String prohibitedId);

	/**
	 * 分页查询-违禁词列表
	 *
	 * @param inDTO 输入数据
	 * @return 分页查询结果集
	 * @throws RuntimeException 社区异常
	 */
	PartitionOutDTO<ProhibitedOutDTO> selectProhibitedList(PartitionInDTO<String> inDTO) throws RuntimeException;

	/**
	 * 查询列表
	 *
	 * @param map
	 * @return
	 */
	List<ProhibitedEntity> list(Map<String, Object> map);

	/**
	 * 查询单条
	 *
	 * @param prohibitedId
	 * @return
	 */
	ProhibitedEntity get(String prohibitedId);

	/**
	 * 修改违禁词
	 */
	boolean editProhibited(ProhibitedEntity entity);

	/**
	 * 刷新违禁词列表
	 *
	 * @return
	 * @throws RuntimeException
	 */
	void refreshProhibitedList() throws RuntimeException;

	/**
	 * 违禁词匹配
	 *
	 * @param content 内容
	 * @return 匹配到的敏感词集合
	 * @throws RuntimeException
	 */
	List<String> matchWords(String content) throws RuntimeException;

}