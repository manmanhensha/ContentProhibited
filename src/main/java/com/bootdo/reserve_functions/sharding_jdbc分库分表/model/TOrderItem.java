package com.bootdo.reserve_functions.sharding_jdbc分库分表.model;

import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

import java.math.BigDecimal;

@Data
public class TOrderItem {

	@TableId(value = "item_id")
	private Long itemId;

	private Long orderId;

	private String orderNo;

	private String itemName;

	private BigDecimal price;
}