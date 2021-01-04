package com.bootdo.reserve_functions.DataSourceMS;

/**
 * @author wushiqiang
 * @date Created in 10:50 2021/1/4
 * @description
 * @modified By
 */
public enum DataSourceEnum {
	MASTER("master"),
	SLAVE("slave");

	private String dataSourceName;

	DataSourceEnum(String dataSourceName) {
		this.dataSourceName = dataSourceName;
	}

	public String getDataSourceName() {
		return dataSourceName;
	}
}
