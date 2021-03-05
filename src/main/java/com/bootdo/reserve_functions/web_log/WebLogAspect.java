package com.bootdo.reserve_functions.web_log;

import cn.hutool.json.JSONUtil;
import com.alibaba.fastjson.JSON;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.*;
import org.aspectj.lang.reflect.MethodSignature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.DefaultParameterNameDiscoverer;
import org.springframework.core.ParameterNameDiscoverer;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.HashMap;

@Order(1)
@Aspect
@Component
public class WebLogAspect {

	private static final Logger log = LoggerFactory.getLogger(WebLogAspect.class);
	private static HashMap<String, Class> map = new HashMap<String, Class>() {
		private static final long serialVersionUID = 8712249311070086061L;

		{
			put("java.lang.Integer", int.class);
			put("java.lang.Double", double.class);
			put("java.lang.Float", float.class);
			put("java.lang.Long", long.class);
			put("java.lang.Short", short.class);
			put("java.lang.Boolean", boolean.class);
			put("java.lang.Char", char.class);
		}
	};


	//返回方法的参数名
	private static String[] getFieldsName(JoinPoint joinPoint) {
		String classType = joinPoint.getTarget().getClass().getName();
		String methodName = joinPoint.getSignature().getName();
		Object[] args = joinPoint.getArgs();
		Class<?>[] classes = new Class[args.length];
		for (int k = 0; k < args.length; k++) {
			if (!args[k].getClass().isPrimitive()) {
				//获取的是封装类型而不是基础类型
				String result = args[k].getClass().getName();
				Class s = map.get(result);
				classes[k] = s == null ? args[k].getClass() : s;
			}
		}
		ParameterNameDiscoverer pnd = new DefaultParameterNameDiscoverer();
		//获取指定的方法，第二个参数可以不传，但是为了防止有重载的现象，还是需要传入参数的类型
		Method method = null;
		try {
			method = Class.forName(classType).getMethod(methodName, classes);
		} catch (NoSuchMethodException | ClassNotFoundException e) {
			return null;
		}
		if (method != null) {
			return pnd.getParameterNames(method);
		} else {
			return null;
		}
	}

	@Pointcut("execution(* com.faw.jetta.controller..*.*(..))")
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
		String[] realFieldsName = getFieldsName(joinPoint);
		log.info("请求参数 : " + Arrays.toString(realFieldsName) + "  " + JSONUtil.toJsonStr(joinPoint.getArgs()));
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

}
