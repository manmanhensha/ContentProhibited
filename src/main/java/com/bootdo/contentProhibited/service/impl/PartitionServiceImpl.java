package com.bootdo.contentProhibited.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.bean.copier.CopyOptions;
import cn.hutool.core.collection.CollectionUtil;
import com.alibaba.fastjson.JSON;
import com.bootdo.contentProhibited.dto.PartitionInDTO;
import com.bootdo.contentProhibited.dto.PartitionOutDTO;
import com.bootdo.contentProhibited.domain.ErrorCode;
import com.bootdo.contentProhibited.service.PartitionService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.concurrent.atomic.AtomicReference;

/**
 * @description: 基础业务实现
 */
@Service
@Slf4j
public class PartitionServiceImpl implements PartitionService {

	private <R> PartitionOutDTO<R> getPageInfo(PageInfo<R> pageInfo, List<R> callbackList) {
		if (pageInfo != null && CollectionUtil.isNotEmpty(pageInfo.getList())) {
			final PartitionOutDTO<R> outDTO = new PartitionOutDTO<R>();
			BeanUtil.copyProperties(pageInfo, outDTO, CopyOptions.create().setIgnoreProperties("list"));
			outDTO.setList(callbackList);
			return outDTO;
		}
		return null;
	}

	/**
	 * 分页
	 *
	 * @param <R>
	 * @param partitionInDTO 分页输入
	 * @param callback       分页回调
	 * @return
	 */
	@Override
	public <R> PartitionOutDTO<R> partition(final PartitionInDTO partitionInDTO, final PartitionService.PartitionSupplier<R> callback) {
		try {
			final AtomicReference<List<R>> atomicCallbackList = new AtomicReference<>();
			final PageInfo pageInfo = PageHelper.startPage(partitionInDTO.getPageNum(), partitionInDTO.getPageSize()).doSelectPageInfo(() -> {
				atomicCallbackList.set(callback.accept());
			});
			return getPageInfo(pageInfo, atomicCallbackList.get());
		} catch (Exception e) {
			log.error("code: {} message: {} partitionInDTO: {}",
					ErrorCode.PAGE_0003.name(),
					ErrorCode.PAGE_0003.getMessage(),
					JSON.toJSONString(partitionInDTO));
			throw new RuntimeException();
		}
	}

	/**
	 * 分页处理
	 *
	 * @param <T>
	 * @param <R>
	 * @param partitionInDTO 分页输入
	 * @param callback       分页回调
	 * @return
	 */
	@Override
	public <T, R> PartitionOutDTO<R> partition(final PartitionInDTO<T> partitionInDTO, final PartitionFunction<T, R> callback) {
		try {
			final AtomicReference<List<R>> atomicCallbackList = new AtomicReference<>();
			final PageInfo pageInfo = PageHelper.startPage(partitionInDTO.getPageNum(), partitionInDTO.getPageSize()).doSelectPageInfo(() -> {
				atomicCallbackList.set(callback.apply(partitionInDTO.getInDTO()));
			});
			return getPageInfo(pageInfo, atomicCallbackList.get());
		} catch (Exception e) {
			log.error("code: {} message: {} partitionInDTO: {} ",
					ErrorCode.PAGE_0003.name(),
					ErrorCode.PAGE_0003.getMessage(),
					JSON.toJSONString(partitionInDTO));
			throw new RuntimeException();
		}
	}

}
