package com.bootdo.reserve_functions.easy_poi;

import cn.afterturn.easypoi.excel.annotation.Excel;

/**
 * @Author: wushiqiang
 * @Date: Created in 20:56 2020/8/31
 * @Description:
 * @Modified By:
 */
public class MsgClientGroup {
	@Excel(name = "组名")
	private String groupName;

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
}
