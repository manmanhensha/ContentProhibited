package com.bootdo.contentprohibited.util;


import com.bootdo.common.utils.PageUtils;
import com.bootdo.contentprohibited.dto.BaseOutDTO;
import com.bootdo.contentprohibited.dto.PartitionOutDTO;

import java.util.LinkedHashMap;
import java.util.Map;

public class CommunityPage extends LinkedHashMap<String, Object> {
	private static final long serialVersionUID = 1L;
	//
	private int offset;
	// 每页条数
	private int limit;
	private int pageNum;

	private CommunityPage(Map<String, Object> params) {
		this.putAll(params);
		// 分页参数
		this.offset = Integer.parseInt(params.get("offset").toString());
		this.limit = Integer.parseInt(params.get("limit").toString());
		this.put("offset", offset);
		this.put("page", offset / limit + 1);
		this.put("limit", limit);

		// 2018-12-19 新增
		this.pageNum = this.get("page") != null ? Integer.parseInt(String.valueOf(this.get("page"))) : 1;
	}

	public static CommunityPage newInstance(Map<String, Object> params) {
		return new CommunityPage(params);
	}

	public static <T> PageUtils getPageUtils(BaseOutDTO<PartitionOutDTO<T>> outDTO) {
		PageUtils pageUtils = new PageUtils(null, 0);
		if (outDTO != null && outDTO.getData() != null && outDTO.getData().getList() != null) {
			pageUtils.setRows(outDTO.getData().getList());
			pageUtils.setTotal(Long.valueOf(outDTO.getData().getTotal()).intValue());
		}
		return pageUtils;
	}

	public static <T> PageUtils getPageUtils(PartitionOutDTO<T> outDTO) {
		PageUtils pageUtils = new PageUtils(null, 0);
		pageUtils.setRows(outDTO.getList());
		pageUtils.setTotal(Long.valueOf(outDTO.getTotal()).intValue());
		return pageUtils;
	}

	public int getOffset() {
		return offset;
	}

	public void setOffset(int offset) {
		this.put("offset", offset);
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

	public int getPageNum() {
		return this.pageNum;
	}

}