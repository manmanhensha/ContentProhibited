package com.bootdo.reserve_functions.web_log;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
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
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Parameter;
import java.util.*;

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

	private static String getParamValue(JoinPoint joinPoint) {
		StringBuilder sb = new StringBuilder();
		//获取所有的参数
		Object[] args = joinPoint.getArgs();
		for (Object arg : args) {
//          2 通过反射获取实体类属性
			sb.append(getFieldsValue(arg));
		}
		return String.valueOf(sb);
	}

	private static String getFieldsValue(Object obj) {
		//通过反射获取所有的字段，getFileds()获取public的修饰的字段
		Field[] fields = obj.getClass().getDeclaredFields();
		StringBuilder sb = new StringBuilder();
		sb.append("{");
		for (Field f : fields) {
			//在反射时能访问私有变量
			f.setAccessible(true);
			try {
				sb.append("\"").append(f.getName()).append("\"").append(":");
				if (ObjectUtil.isNotNull(f.get(obj))) {
					sb.append("\"").append(f.get(obj)).append("\"").append(",");
				} else {
					sb.append(f.get(obj)).append(",");
				}
			} catch (IllegalArgumentException | IllegalAccessException e) {
				e.printStackTrace();
			}
		}
		return sb.toString();
	}

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

	@Pointcut("execution(* com.faw.jetta.manage.controller..*.*(..))")
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
		String paramValue = getParamValue(joinPoint);
		String[] realFieldsName = getFieldsName(joinPoint);
		if (StrUtil.isNotBlank(paramValue) && !"{".equals(paramValue)) {
			try {
				String s = StrUtil.subWithLength(paramValue, 0, paramValue.length() - 1) + "}";
				Map<String, Object> objectMap = BeanUtil.beanToMap(JSONUtil.parseObj(s), false, true);
				StringBuilder fieldsName = new StringBuilder();
				for (Class<?> parameterType : method.getParameterTypes()) {
					fieldsName.append(parameterType.getName());
				}
				log.info("请求参数: " + fieldsName + ": " + Arrays.toString(realFieldsName) + "  " + JSONUtil.toJsonStr(objectMap));
			} catch (Exception e) {
				log.info("请求参数: " + paramValue);
			}
		} else {
			log.info("请求参数为空");
		}
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
