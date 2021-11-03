package com.bootdo.reserve_functions.策略模式2;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * 策略模式
 */
@RestController
public class StrategyController {

	@Resource(name = "orderServiceImpl")
	private IOrderService orderService;


	@GetMapping("/api/order")
	@ResponseBody
	public String orderSave(OrderDTO dto) {
		String str = orderService.orderHandler(dto);
		return "{\"status\":1,\"msg\":\"保存成功\",\"data\":\"" + str + "\"}";
	}
}
