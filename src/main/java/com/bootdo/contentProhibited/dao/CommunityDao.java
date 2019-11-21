package com.bootdo.contentProhibited.dao;

import tk.mybatis.mapper.common.IdsMapper;
import tk.mybatis.mapper.common.Mapper;
import tk.mybatis.mapper.common.MySqlMapper;

/**
 * @description: 社区统一数据持久层
 * @auther: CoffeeN
 * @date: 2018/12/11 20:47
 */
public interface CommunityDao<T> extends Mapper<T>, IdsMapper<T>, MySqlMapper<T> {
}
