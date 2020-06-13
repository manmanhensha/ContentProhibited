package com.bootdo.reserve_functions.limit_customer;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;

/**
 * @author :MrWu
 * @date : 11:18-2019/9/1
 * @description :  获取 HttpServletRequest
 * @Param null  param desc
 * @return :
 */
public class RequestHolder {

	public static HttpServletRequest getHttpServletRequest() {
		return ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
	}
}
