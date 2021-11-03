package com.bootdo.reserve_functions.策略模式2;

import org.springframework.stereotype.Component;

/**
 * @author wushiqiang
 * @date Created in 14:41 2021/11/3
 * @description
 * @modified By
 */
@Component
@OrderTypeHandlerAnno(OrderTypeEnum.Normal)
public class NormalOrderHandler extends AOrderTypeHandler {
	@Override
	public String handler(OrderDTO dto) {
		return "处理普通订单";
	}
}
