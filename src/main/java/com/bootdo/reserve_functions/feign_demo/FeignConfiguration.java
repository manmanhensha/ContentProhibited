//package com.bootdo.reserve_functions.feign_demo;
//
//import feign.Logger;
//import org.springframework.beans.factory.ObjectFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.autoconfigure.http.HttpMessageConverters;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//
///**
// * @Author: wushiqiang
// * @Date: Created in 20:17 2019/5/13
// * @Description:  涉及到失败熔断处理
// * @Modified By:
// */
//@Configuration
//public class FeignConfiguration {
//
//	@Autowired
//	private ObjectFactory<HttpMessageConverters> messageConverters;
//
//	/**
//	 * 日志级别
//	 * @return
//	 */
//	@Bean
//	Logger.Level feignLoggerLevel() {
//		return Logger.Level.FULL;
//	}
//}
