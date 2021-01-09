package com.bootdo.reserve_functions.DataSourceMS;

import org.springframework.stereotype.Service;

/**
 * @author wushiqiang
 * @date Created in 10:57 2021/1/4
 * @description
 * @modified By
 */
@Service
public class TestMSOrderService {

//	@Resource
//	private OrderMapper orderMapper;
//
//
//	/**
//	 * 读操作
//	 *
//	 * @param orderId
//	 * @return
//	 */
//	@DataSourceSwitcher(DataSourceEnum.SLAVE)
//	public List<Order> getOrder(String orderId) {
//		return orderMapper.listOrders(orderId);
//
//	}
//
//	/**
//	 * 写操作
//	 *
//	 * @param orderId
//	 * @return
//	 */
//	@DataSourceSwitcher(DataSourceEnum.MASTER)
//	public List<Order> insertOrder(Long orderId) {
//		Order order = new Order();
//		order.setOrderId(orderId);
//		return orderMapper.saveOrder(order);
//	}
}
