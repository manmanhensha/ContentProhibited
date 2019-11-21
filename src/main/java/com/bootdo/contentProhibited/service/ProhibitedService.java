package com.bootdo.contentProhibited.service;


import com.bootdo.contentProhibited.dto.PartitionInDTO;
import com.bootdo.contentProhibited.dto.PartitionOutDTO;
import com.bootdo.contentProhibited.dto.ProhibitedOutDTO;

import java.util.List;

/**
 * @description: 违禁词
 */
public interface ProhibitedService {

	/**
	 * 批量添加违禁词
	 *
	 * @param userId         用户ID
	 * @param prohibitedList 违禁词集合
	 * @return {@code true} 操作成功 {@code false} 操作失败
	 * @throws RuntimeException 社区异常
	 */
	boolean insertProhibitedList(String userId, List<String> prohibitedList) throws RuntimeException;

	/**
	 * 批量删除违禁词
	 *
	 * @param userId           用户ID
	 * @param prohibitedIdList 违禁词ID集合
	 * @return {@code true} 操作成功 {@code false} 操作失败
	 * @throws RuntimeException 社区异常
	 */
	boolean deleteProhibitedList(String userId, List<String> prohibitedIdList) throws RuntimeException;

	/**
	 * 分页查询-违禁词列表
	 *
	 * @param inDTO 输入数据
	 * @return 分页查询结果集
	 * @throws RuntimeException 社区异常
	 */
	PartitionOutDTO<ProhibitedOutDTO> selectProhibitedList(PartitionInDTO<String> inDTO) throws RuntimeException;

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