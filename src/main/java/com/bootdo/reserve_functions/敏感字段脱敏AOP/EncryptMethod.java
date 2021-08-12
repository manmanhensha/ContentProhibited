package com.bootdo.reserve_functions.敏感字段脱敏AOP;

import java.lang.annotation.*;

import static com.bootdo.reserve_functions.敏感字段脱敏AOP.enums.EncryptConstant.ENCRYPT;

/**
 * @author wushiqiang
 * @date Created in 16:08 2021/8/12
 * @description
 * @modified By
 */
@Documented
@Target({ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
public @interface EncryptMethod {

	String type() default ENCRYPT;
}