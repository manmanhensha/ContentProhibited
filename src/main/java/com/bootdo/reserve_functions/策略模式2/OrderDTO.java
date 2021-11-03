package com.bootdo.reserve_functions.策略模式2;

import lombok.Data;

import java.math.BigDecimal;

/**
 * @author wushiqiang
 * @date Created in 14:35 2021/11/3
 * @description
 * @modified By
 */
@Data
public class OrderDTO {

	private String code;
	private BigDecimal price;

	/**
	 * 订单类型：
	 * 1：普通订单
	 * 2：团购订单
	 * 3：促销订单
	 */
	private String type;
}
