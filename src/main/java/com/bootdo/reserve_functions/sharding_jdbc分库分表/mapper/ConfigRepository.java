package com.bootdo.reserve_functions.sharding_jdbc分库分表.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.bootdo.reserve_functions.sharding_jdbc分库分表.model.TConfig;
import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface ConfigRepository extends BaseMapper<TConfig> {

}

