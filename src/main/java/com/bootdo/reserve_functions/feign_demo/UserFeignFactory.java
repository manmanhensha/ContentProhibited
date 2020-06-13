//package com.bootdo.reserve_functions.feign_demo;
//
//import lombok.extern.slf4j.Slf4j;
//import org.springframework.stereotype.Component;
//
///**
// * @Author: wushiqiang
// * @Date: Created in 20:45 2019/5/13
// * @Description:
// * @Modified By:
// */
//@Component
//@Slf4j
//public class UserFeignFactory implements FallbackFactory<UserLoginAPI> {
//
//	private final UserFeignFallback userFeignFallback;
//
//	public UserFeignFactory(UserFeignFallback userFeignFallback) {
//		this.userFeignFallback = userFeignFallback;
//	}
//
//	@Override
//	public UserLoginAPI create(Throwable throwable) {
//		//打印下异常
//		log.error("远程调用异常：{}", throwable.getMessage());
//		return userFeignFallback;
//	}
//}
