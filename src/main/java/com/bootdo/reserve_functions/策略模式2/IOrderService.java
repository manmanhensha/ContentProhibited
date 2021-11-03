package com.bootdo.reserve_functions.策略模式2;

/**
 * @author wushiqiang
 * @date Created in 14:35 2021/11/3
 * @description
 * @modified By
 */
public interface IOrderService {
	/**
	 * 根据订单的不同类型做出不同的处理
	 *
	 * @param dto 订单实体
	 * @return 为了简单，返回字符串
	 */
	String orderHandler(OrderDTO dto);
}
