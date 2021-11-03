package com.bootdo.reserve_functions.策略模式2;


import org.springframework.stereotype.Component;

/**
 * 促销订单处理
 */
@Component
@OrderTypeHandlerAnno(OrderTypeEnum.Promotion)
public class PromotionOrderHandler extends AOrderTypeHandler {
	@Override
	public String handler(OrderDTO dto) {
		return "处理促销订单";
	}
}
