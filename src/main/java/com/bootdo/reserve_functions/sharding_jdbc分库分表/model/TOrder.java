package com.bootdo.reserve_functions.sharding_jdbc分库分表.model;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class TOrder {

	//@TableId(value = "order_id")
	private Long orderId;

	private Long userId;

	private String orderNo;

	private String createName;

	private BigDecimal price;
}