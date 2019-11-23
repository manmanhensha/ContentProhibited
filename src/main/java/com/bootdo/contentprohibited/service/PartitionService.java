package com.bootdo.contentprohibited.service;


import com.bootdo.contentprohibited.dto.PartitionInDTO;
import com.bootdo.contentprohibited.dto.PartitionOutDTO;

import java.util.List;

/**
 * @description: 分页
 */
public interface PartitionService {

	/**
	 * 分页
	 *
	 * @param partitionInDTO 分页输入
	 * @param callback       分页回调
	 * @param <R>
	 * @return
	 */
	<R> PartitionOutDTO<R> partition(final PartitionInDTO partitionInDTO, final PartitionSupplier<R> callback);

	/**
	 * 分页处理
	 *
	 * @param <T>
	 * @param <R>
	 * @param partitionInDTO 分页输入
	 * @param callback       分页回调
	 * @return
	 */
	<T, R> PartitionOutDTO<R> partition(final PartitionInDTO<T> partitionInDTO, final PartitionFunction<T, R> callback);

	/**
	 * 分页回调
	 *
	 * @param <R>
	 */
	interface PartitionSupplier<R> {
		List<R> accept();
	}

	/**
	 * 分页回调
	 *
	 * @param <T>
	 * @param <R>
	 */
	interface PartitionFunction<T, R> {
		List<R> apply(T t);
	}

}
