package com.bootdo.reserve_functions.limit_customer;

import cn.hutool.core.util.StrUtil;
import com.google.common.collect.ImmutableList;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.script.DefaultRedisScript;
import org.springframework.data.redis.core.script.RedisScript;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;

/**
 * @author :MrWu
 * @date : 11:20-2019/9/1
 * @description : 限流拦截器，自定义注解
 * @Param null  param desc
 * @return :
 */
@Aspect
@Component
public class LimitAspect {
	private static final Logger logger = LoggerFactory.getLogger(LimitAspect.class);
	@Autowired
	private RedisTemplate redisTemplate;

	@Pointcut("@annotation(com.bootdo.reserve_functions.limit_customer.Limit)")
	public void pointcut() {
	}

	@Around("pointcut()")
	public Object around(ProceedingJoinPoint joinPoint) throws Throwable {
		HttpServletRequest request = RequestHolder.getHttpServletRequest();
		MethodSignature signature = (MethodSignature) joinPoint.getSignature();
		Method signatureMethod = signature.getMethod();
		Limit limit = signatureMethod.getAnnotation(Limit.class);
		LimitType limitType = limit.limitType();
		String key = limit.key();

		switch (limitType) {
			case IP:
				key = StringUtils.getIP(request);
				break;
			case CUSTOMER:
				key = limit.key();
				break;
			default:
				key = limit.name();
		}

		ImmutableList keys = ImmutableList.of(StrUtil.join(limit.prefix(), "_", key, "_", request.getRequestURI().replaceAll("/", "_")));

		String luaScript = buildLuaScript();
		RedisScript<Number> redisScript = new DefaultRedisScript<>(luaScript, Number.class);
		Number count = (Number) redisTemplate.execute(redisScript, keys, limit.count(), limit.period());
		logger.info("第{}次访问key为 {}，描述为 [{}] 的接口", count, keys, limit.name());
		if (null != count && count.intValue() <= limit.count()) {
			return joinPoint.proceed();
		} else {
			throw new RuntimeException();
		}
	}

	/**
	 * lua限流脚本
	 */
	private String buildLuaScript() {
		return "local c" +
				"\nc = redis.call('get',KEYS[1])" +
				"\nif c and tonumber(c) > tonumber(ARGV[1]) then" +
				"\nreturn c;" +
				"\nend" +
				"\nc = redis.call('incr',KEYS[1])" +
				"\nif tonumber(c) == 1 then" +
				"\nredis.call('expire',KEYS[1],ARGV[2])" +
				"\nend" +
				"\nreturn c;";
	}
}
