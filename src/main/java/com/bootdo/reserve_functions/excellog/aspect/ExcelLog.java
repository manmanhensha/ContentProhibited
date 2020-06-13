package com.bootdo.reserve_functions.excellog.aspect;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * @author wushiqiang
 * @date Created in 10:17 2019/10/29
 * @description
 * @modified By
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface ExcelLog {
	/**
	 * 导出Excel名称，内容
	 *
	 * @return
	 */
	String excelName() default "";

	/**
	 * 请求的导出接口
	 *
	 * @return
	 */
	String requestURL() default "";

}