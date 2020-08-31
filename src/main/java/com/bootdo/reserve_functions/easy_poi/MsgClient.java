package com.bootdo.reserve_functions.easy_poi;

import cn.afterturn.easypoi.excel.annotation.Excel;

import java.util.Date;

/**
 * @Author: wushiqiang
 * @Date: Created in 20:54 2020/8/31
 * @Description:
 * @Modified By:
 */
public class MsgClient {
	@Excel(name = "生日", databaseFormat = "yyyy-MM-dd")
	private Date birthday;
	@Excel(name = "名字")
	private String clientName;
	@Excel(name = "电话")
	private String clientPhone;
	@Excel(name = "创建人")
	private String createBy;
	@Excel(name = "id")
	private String id;
	@Excel(name = "备注")
	private String remark;
	@Excel(name = "组")
	private MsgClientGroup group;

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getClientName() {
		return clientName;
	}

	public void setClientName(String clientName) {
		this.clientName = clientName;
	}

	public String getClientPhone() {
		return clientPhone;
	}

	public void setClientPhone(String clientPhone) {
		this.clientPhone = clientPhone;
	}

	public String getCreateBy() {
		return createBy;
	}

	public void setCreateBy(String createBy) {
		this.createBy = createBy;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public MsgClientGroup getGroup() {
		return group;
	}

	public void setGroup(MsgClientGroup group) {
		this.group = group;
	}
}
