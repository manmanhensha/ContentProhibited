package com.bootdo.reserve_functions.DataSourceMS;

import java.lang.annotation.*;

/**
 * @author wushiqiang
 * @date Created in 10:55 2021/1/4
 * @description
 * @modified By
 */
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
@Documented
public @interface DataSourceSwitcher {

	/**
	 * 默认数据源
	 *
	 * @return
	 */
	DataSourceEnum value() default DataSourceEnum.MASTER;

	/**
	 * 清除
	 *
	 * @return
	 */
	boolean clear() default true;
}
