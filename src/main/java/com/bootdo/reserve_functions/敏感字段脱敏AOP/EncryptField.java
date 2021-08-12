package com.bootdo.reserve_functions.敏感字段脱敏AOP;

import java.lang.annotation.*;

/**
 * @author wushiqiang
 * @date Created in 16:08 2021/8/12
 * @description
 * @modified By
 */
@Documented
@Target({ElementType.FIELD, ElementType.PARAMETER})
@Retention(RetentionPolicy.RUNTIME)
public @interface EncryptField {

	String[] value() default "";
}
