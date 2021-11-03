package com.bootdo.reserve_functions.策略模式2;

/**
 * @author wushiqiang
 * @date Created in 14:40 2021/11/3
 * @description
 * @modified By
 */
public enum OrderTypeEnum {

	Normal("1", "普通"),
	Group("2", "团队"),
	Promotion("3", "促销");

	private String code;    //代码
	private String name;    //名称，描述

	OrderTypeEnum(String code, String name) {
		this.code = code;
		this.name = name;
	}

	/**
	 * 根据code属性获取name属性
	 *
	 * @param code
	 * @return
	 */
	public static String getNameByCode(String code) {
		for (OrderTypeEnum temp : OrderTypeEnum.values()) {
			if (temp.getCode().equals(code)) {
				return temp.getName();
			}
		}
		return null;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
