package com.bootdo.contentProhibited.dto;

import java.util.List;

/**
 * @description: 分页输出
 * @auther: CoffeeN
 * @date: 2018/12/10 21:12
 */
public final class PartitionOutDTO<T> {

	//当前页
	private int pageNum;
	//每页的数量
	private int pageSize;
	//当前页的数量
	private int size;

	//当前页面第一个元素在数据库中的行号
	private int startRow;
	//当前页面最后一个元素在数据库中的行号
	private int endRow;
	//总记录数
	private long total;
	//总页数
	private int pages;
	//结果集
	private List<T> list;

	//前一页
	private int prePage;
	//下一页
	private int nextPage;

	//是否为第一页
	private boolean isFirstPage = false;
	//是否为最后一页
	private boolean isLastPage = false;
	//是否有前一页
	private boolean hasPreviousPage = false;
	//是否有下一页
	private boolean hasNextPage = false;

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	public long getTotal() {
		return total;
	}

	public void setTotal(long total) {
		this.total = total;
	}

	public int getPages() {
		return pages;
	}

	public void setPages(int pages) {
		this.pages = pages;
	}

	public List<T> getList() {
		return list;
	}

	public void setList(List<T> list) {
		this.list = list;
	}

	public int getPrePage() {
		return prePage;
	}

	public void setPrePage(int prePage) {
		this.prePage = prePage;
	}

	public int getNextPage() {
		return nextPage;
	}

	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}

	public boolean getFirstPage() {
		return isFirstPage;
	}

	public void setFirstPage(boolean firstPage) {
		isFirstPage = firstPage;
	}

	public boolean getLastPage() {
		return isLastPage;
	}

	public void setLastPage(boolean lastPage) {
		isLastPage = lastPage;
	}

	public boolean getHasPreviousPage() {
		return hasPreviousPage;
	}

	public void setHasPreviousPage(boolean hasPreviousPage) {
		this.hasPreviousPage = hasPreviousPage;
	}

	public boolean getHasNextPage() {
		return hasNextPage;
	}

	public void setHasNextPage(boolean hasNextPage) {
		this.hasNextPage = hasNextPage;
	}

}
