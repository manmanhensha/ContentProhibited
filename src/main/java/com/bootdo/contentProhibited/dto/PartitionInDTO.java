package com.bootdo.contentProhibited.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @description: 分页输入
 * @auther: CoffeeN
 * @date: 2018/12/10 21:07
 */
@ApiModel(value = "分页输入模型")
@Data
public final class PartitionInDTO<T> {

	// 当前页码
	@ApiModelProperty(value = "页码", example = "1")
	private int pageNum = 1;

	/**
	 * 每页显示数据量，默认10条
	 */
	@ApiModelProperty(value = "每页显示数量", example = "10")
	private int pageSize = 10;

	// 输入数据
	@ApiModelProperty(value = "数据")
	private T inDTO;

	public static <T> PartitionInDTO<T> newInstall(T inDTO, int pageNum, int pageSize) {
		final PartitionInDTO<T> partition = new PartitionInDTO<>();
		partition.setInDTO(inDTO);
		partition.setPageNum(pageNum);
		partition.setPageSize(pageSize);
		return partition;
	}

}
