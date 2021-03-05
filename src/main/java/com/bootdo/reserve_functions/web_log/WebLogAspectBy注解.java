package com.bootdo.reserve_functions.web_log;

import com.alibaba.fastjson.JSON;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.*;
import org.aspectj.lang.reflect.MethodSignature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.lang.reflect.Parameter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Order(1)
@Aspect
@Component
public class WebLogAspectBy注解 {

	private static final Logger log = LoggerFactory.getLogger(WebLogAspect.class);

	@Pointcut("execution(* com.scfl.vwebo.voicenewyear.controller..*.*(..))")
	public void logPointCut() {
	}

	@Before("logPointCut()")
	public void doBefore(JoinPoint joinPoint) {
		// 接收到请求，记录请求内容
		ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
		HttpServletRequest request = attributes.getRequest();
		Signature signature = joinPoint.getSignature();
		MethodSignature methodSignature = (MethodSignature) signature;
		Method method = methodSignature.getMethod();

		// 记录下请求内容
		log.info("请求地址 : " + request.getRequestURL().toString());
		log.info("HTTP 请求方式 : " + request.getMethod());
		log.info("CLASS 方法 : " + joinPoint.getSignature().getDeclaringTypeName() + "."
				+ joinPoint.getSignature().getName());
		log.info("请求参数: " + getParameter(method, joinPoint.getArgs()));
	}

	/**
	 * returning的值和doAfterReturning的参数名一致
	 */
	@AfterReturning(returning = "ret", pointcut = "logPointCut()")
	public void doAfterReturning(Object ret) {
		// 处理完请求，返回内容(返回值太复杂时，打印的是物理存储空间的地址)
		log.info("返回值 : " + JSON.toJSONString(ret));
	}

	@Around("logPointCut()")
	public Object doAround(ProceedingJoinPoint pjp) throws Throwable {
		long startTime = System.currentTimeMillis();
		// ob 为方法的返回值
		Object ob = pjp.proceed();
		log.info("耗时 : " + (System.currentTimeMillis() - startTime));
		return ob;
	}

	/**
	 * 根据方法和传入的参数获取请求参数,依靠RequestBody和RequestParam注解实现
	 */
	private Object getParameter(Method method, Object[] args) {
		List<Object> argList = new ArrayList<>();
		Parameter[] parameters = method.getParameters();
		for (int i = 0; i < parameters.length; i++) {
			//将RequestBody注解修饰的参数作为请求参数
			RequestBody requestBody = parameters[i].getAnnotation(RequestBody.class);
			if (requestBody != null) {
				argList.add(args[i]);
			}
			//将RequestParam注解修饰的参数作为请求参数
			RequestParam requestParam = parameters[i].getAnnotation(RequestParam.class);
			if (requestParam != null) {
				Map<String, Object> map = new HashMap<>();
				String key = parameters[i].getName();
				if (!StringUtils.isEmpty(requestParam.value())) {
					key = requestParam.value();
				}
				map.put(key, args[i]);
				argList.add(map);
			}
			if (requestBody == null && requestParam == null) {
				argList.add(parameters[i].toString());
			}
		}
		if (argList.size() == 0) {
			return null;
		} else if (argList.size() == 1) {
			return argList.get(0);
		} else {
			return argList;
		}
	}
}
