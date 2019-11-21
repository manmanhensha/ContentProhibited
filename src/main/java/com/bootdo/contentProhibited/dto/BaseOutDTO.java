package com.bootdo.contentProhibited.dto;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class BaseOutDTO<T> {

	private String status;
	private String errorCode;
	private String errorMessage;
	private String extMessage;
	private T data;
	private Long total;

	/**
	 * 错误状态
	 * 用来描述 {@link BaseOutDTO#status#name()}
	 */
	public enum BaseOutType {
		SUCCEED,
		FAILED;
	}

}
