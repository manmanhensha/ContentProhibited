package com.bootdo.contentprohibited.dao;


import com.bootdo.contentprohibited.domain.ProhibitedEntity;

import java.util.List;

/**
 * @description: 违禁词持久层
 * @auther: CoffeeN
 * @date: 2018/12/25 21:01
 */
public interface ExtProhibitedDao {

	/**
	 * 批量添加a
	 *
	 * @param lsit 违禁词对象集合
	 * @return 受影响条数
	 */
	int batchInsert(List<ProhibitedEntity> lsit);

}
