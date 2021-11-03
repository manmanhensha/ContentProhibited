package com.bootdo.reserve_functions.策略模式2;


import org.springframework.stereotype.Component;

/**
 * 团队订单处理
 */
@Component
@OrderTypeHandlerAnno(OrderTypeEnum.Group)
public class GroupOrderHandler extends AOrderTypeHandler {
	@Override
	public String handler(OrderDTO dto) {
		return "处理团队订单";
	}
}
