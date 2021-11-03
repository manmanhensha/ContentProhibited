package com.bootdo.reserve_functions.策略模式2;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * @author wushiqiang
 * @date Created in 14:36 2021/11/3
 * @description
 * @modified By
 */
@Component
public class OrderServiceImpl implements IOrderService {
	//使用策略模式实现
	@Autowired
	private HandlerContext handlerContext;

	@Override
	public String orderHandler(OrderDTO dto) {
		/*
		 * 1：使用if..else实现
		 * 2：使用策略模式实现
		 */
		AOrderTypeHandler instance = handlerContext.getInstance(dto.getType());
		return instance.handler(dto);
	}
}
