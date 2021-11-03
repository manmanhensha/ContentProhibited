package com.bootdo.reserve_functions.策略模式2;

import java.util.Map;

/**
 * @author wushiqiang
 * @date Created in 14:37 2021/11/3
 * @description
 * @modified By
 */
public class HandlerContext {
	private final Map<String, AOrderTypeHandler> handlerMap;

	/**
	 * 构造传参不能直接使用注解扫入
	 */
	public HandlerContext(Map<String, AOrderTypeHandler> handlerMap) {
		this.handlerMap = handlerMap;
	}

	/**
	 * 获得实例
	 *
	 * @param type
	 * @return
	 */
	public AOrderTypeHandler getInstance(String type) {
		if (type == null) {
			throw new IllegalArgumentException("type参数不能为空");
		}
		AOrderTypeHandler clazz = handlerMap.get(type);
		if (clazz == null) {
			throw new IllegalArgumentException("该类型没有在枚举OrderTypeHandlerAnno中定义，请定义：" + type);
		}
		return clazz;
	}
}
