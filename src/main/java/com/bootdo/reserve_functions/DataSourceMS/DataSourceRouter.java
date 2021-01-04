package com.bootdo.reserve_functions.DataSourceMS;

import com.bootdo.reserve_functions.mysql_proxy.dynamicdatasource.DataSourceContextHolder;
import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource;

/**
 * @author wushiqiang
 * @date Created in 10:49 2021/1/4
 * @description
 * @modified By
 */
public class DataSourceRouter extends AbstractRoutingDataSource {

	/**
	 * 最终的determineCurrentLookupKey返回的是从DataSourceContextHolder中拿到的,因此在动态切换数据源的时候注解
	 * 应该给DataSourceContextHolder设值
	 */
	@Override
	protected Object determineCurrentLookupKey() {
		return DataSourceContextHolder.get();
	}


}
