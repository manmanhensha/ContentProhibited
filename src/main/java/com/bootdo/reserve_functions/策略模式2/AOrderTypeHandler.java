package com.bootdo.reserve_functions.策略模式2;

/**
 * @author wushiqiang
 * @date Created in 14:39 2021/11/3
 * @description
 * @modified By
 */
public abstract class AOrderTypeHandler {
	/**
	 * 一个订单类型做一件事
	 *
	 * @param dto 订单实体
	 * @return 为了简单，返回字符串
	 */
	abstract public String handler(OrderDTO dto);
}
