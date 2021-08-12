package com.bootdo.reserve_functions.敏感字段脱敏AOP.aspect;

import com.bootdo.reserve_functions.敏感字段脱敏AOP.EncryptField;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.jasypt.encryption.StringEncryptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.lang.reflect.Field;
import java.util.Objects;

import static com.bootdo.reserve_functions.敏感字段脱敏AOP.enums.EncryptConstant.DECRYPT;
import static com.bootdo.reserve_functions.敏感字段脱敏AOP.enums.EncryptConstant.ENCRYPT;


@Slf4j
@Aspect
@Component
public class EncryptHandler {

	@Autowired
	private StringEncryptor stringEncryptor;

	@Pointcut("@annotation(com.bootdo.reserve_functions.敏感字段脱敏AOP.EncryptMethod)")
	public void pointCut() {
	}

	@Around("pointCut()")
	public Object around(ProceedingJoinPoint joinPoint) {
		/**
		 * 加密
		 */
		encrypt(joinPoint);
		/**
		 * 解密
		 */
		Object decrypt = decrypt(joinPoint);
		return decrypt;
	}

	public void encrypt(ProceedingJoinPoint joinPoint) {

		try {
			Object[] objects = joinPoint.getArgs();
			if (objects.length != 0) {
				for (Object o : objects) {
					if (o instanceof String) {
						encryptValue(o);
					} else {
						handler(o, ENCRYPT);
					}
					//TODO 其余类型自己看实际情况加
				}
			}
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		}
	}

	public Object decrypt(ProceedingJoinPoint joinPoint) {
		Object result = null;
		try {
			Object obj = joinPoint.proceed();
			if (obj != null) {
				if (obj instanceof String) {
					decryptValue(obj);
				} else {
					result = handler(obj, DECRYPT);
				}
				//TODO 其余类型自己看实际情况加
			}
		} catch (Throwable e) {
			e.printStackTrace();
		}
		return result;
	}

	private Object handler(Object obj, String type) throws IllegalAccessException {

		if (Objects.isNull(obj)) {
			return null;
		}
		Field[] fields = obj.getClass().getDeclaredFields();
		for (Field field : fields) {
			boolean hasSecureField = field.isAnnotationPresent(EncryptField.class);
			if (hasSecureField) {
				field.setAccessible(true);
				String realValue = (String) field.get(obj);
				String value;
				if (DECRYPT.equals(type)) {
					value = stringEncryptor.decrypt(realValue);
				} else {
					value = stringEncryptor.encrypt(realValue);
				}
				field.set(obj, value);
			}
		}
		return obj;
	}

	public String encryptValue(Object realValue) {
		String value = null;
		try {
			value = stringEncryptor.encrypt(String.valueOf(realValue));
		} catch (Exception ex) {
			return value;
		}
		return value;
	}

	public String decryptValue(Object realValue) {
		String value = String.valueOf(realValue);
		try {
			value = stringEncryptor.decrypt(value);
		} catch (Exception ex) {
			return value;
		}
		return value;
	}
}