package com.bootdo.reserve_functions.策略模式2;

import com.baomidou.mybatisplus.core.toolkit.ObjectUtils;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.config.BeanFactoryPostProcessor;
import org.springframework.beans.factory.config.ConfigurableListableBeanFactory;
import org.springframework.stereotype.Component;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

/**
 * 策略模式，处理type与实现类的映射关系
 */
@Component
public class HandlerProccessor implements BeanFactoryPostProcessor {

	@Override
	public void postProcessBeanFactory(ConfigurableListableBeanFactory beanFactory) throws BeansException {
		Map<String, AOrderTypeHandler> handlerMap = new HashMap<>();
		for (OrderTypeEnum temp : OrderTypeEnum.values()) {
			AOrderTypeHandler beanInstacle = getBeansWithAnnotation(beanFactory, AOrderTypeHandler.class, OrderTypeHandlerAnno.class, temp.getCode());
			handlerMap.put(temp.getCode(), beanInstacle);
		}
		HandlerContext context = new HandlerContext(handlerMap);
		//单例注入
		beanFactory.registerSingleton(HandlerContext.class.getName(), context);
	}

	/*
	 * 通过父类+注解找到实体类
	 */
	private <T> T getBeansWithAnnotation(ConfigurableListableBeanFactory beanFactory, Class<T> manager, Class<? extends OrderTypeHandlerAnno> annotation, String code) throws BeansException {
		if (ObjectUtils.isEmpty(code)) {
			throw new RuntimeException("code is null ");
		}
		Collection<T> tCollection = beanFactory.getBeansOfType(manager).values();
		for (T t : tCollection) {
			OrderTypeHandlerAnno orderTypeHandlerAnno = t.getClass().getAnnotation(annotation);
			if (ObjectUtils.isEmpty(orderTypeHandlerAnno)) {
				throw new RuntimeException("该注解没有写入值 :" + code);
			}
			//注解值是否与code相等
			if (code.equals(orderTypeHandlerAnno.value().getCode())) {
				return t;
			}
		}
		throw new RuntimeException("通过code没有找到该注解对应的实体类 :" + code);
	}
}
