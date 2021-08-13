package com.bootdo.reserve_functions.sharding_jdbc分库分表.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.bootdo.reserve_functions.sharding_jdbc分库分表.model.TOrder;
import com.bootdo.reserve_functions.sharding_jdbc分库分表.model.TOrderDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;


@Mapper
public interface OrderRepository extends BaseMapper<TOrder> {


    List<TOrderDto> selectOrderAndItemByOrderId(TOrderDto tOrder);

    List<TOrderDto> selectOrderListPage(@Param("pageNo") Integer pageNo, @Param("pageSize") Integer pageSize, @Param("orderId") Long orderId);

    List<TOrderDto> selectOrderListPage();
}

