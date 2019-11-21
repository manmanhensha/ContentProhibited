package com.bootdo.contentProhibited.config;

import com.bootdo.contentProhibited.service.ProhibitedService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

/**
 * 违禁词缓存初始化
 */
@Component
@Order(value = 1)
public class ProhibitedRunner implements ApplicationRunner {

	@Autowired
	private ProhibitedService prohibitedService;

	@Override
	public void run(ApplicationArguments applicationArguments) throws Exception {
		prohibitedService.refreshProhibitedList();
	}

}
