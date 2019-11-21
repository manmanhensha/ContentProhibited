package com.bootdo.contentProhibited.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @description:
 * @auther: CoffeeN
 * @date: 2018/12/22 13:15
 */
@ApiModel(value = "违禁词")
@Data
public class ProhibitedOutDTO {

	@ApiModelProperty(value = "违禁词ID")
	private String prohibitedId;

	@ApiModelProperty(value = "违禁词")
	private String code;

}
