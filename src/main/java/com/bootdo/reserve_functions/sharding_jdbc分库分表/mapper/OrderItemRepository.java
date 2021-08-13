package com.bootdo.reserve_functions.sharding_jdbc分库分表.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.bootdo.reserve_functions.sharding_jdbc分库分表.model.TOrderItem;
import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface OrderItemRepository extends BaseMapper<TOrderItem> {

}

