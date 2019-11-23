package com.bootdo.contentprohibited.dto;

import java.io.Serializable;


/**
 * 违禁词表
 *
 * @author chglee
 * @email 1992lcg@163.com
 * @date 2018-12-24 10:41:27
 */
public class ProhibitedDO implements Serializable {
	private static final long serialVersionUID = 1L;

	//
	private String prohibitedId;
	//违禁词
	private String code;

	/**
	 * 获取：
	 */
	public String getProhibitedId() {
		return prohibitedId;
	}

	/**
	 * 设置：
	 */
	public void setProhibitedId(String prohibitedId) {
		this.prohibitedId = prohibitedId;
	}

	/**
	 * 获取：违禁词
	 */
	public String getCode() {
		return code;
	}

	/**
	 * 设置：违禁词
	 */
	public void setCode(String code) {
		this.code = code;
	}
}
