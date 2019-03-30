package com.bootdo.weekly.vo;

import cn.afterturn.easypoi.excel.annotation.Excel;
import lombok.Data;

import javax.persistence.Transient;
import java.io.Serializable;
import java.util.Date;

/**
 * @Author: MrWu
 * @Date: Created in 15:35 2019/3/12
 * @Description:
 * @Modified By:
 */
@Data
public class WeeklyVO implements Serializable {

	private static final long serialVersionUID = 3394118465054882540L;
	//该注解表明只是作数据储存传输，表中并么有此字段，作为表格中的创建时间
	@Transient
	private Integer order;
	@Transient//创建时间
	private String dateStr;

	//查询到的用户姓名
	@Excel(name = "用户姓名")
	private String name;

	//主键id
	private Integer id;
	//提交的用户id
	private Long userId;
	//创建周报时间
	@Excel(name = "创建时间",format = "yyyy-MM-dd",width = 20)
	private String createTime;
	//更改时间
	@Excel(name = "更新时间",width = 20)
	private Date updateTime;
	//周报摘要
	@Excel(name = "标题",width = 20)
	private String title;
	// 状态 0:未批阅，1:已批阅
	@Excel(name = "批阅状态")
	private Integer isRead;
	//项目名称
	@Excel(name = "项目名称")
	private String project;
	//工作内容描述
	@Excel(name = "工作内容描述",width = 40)
	private String workDes;
	//遇到的问题及解决方案
	@Excel(name = "遇到的问题及解决方案",width = 40)
	private String problem;
	//任务性质
	@Excel(name = "任务性质")
	private String task;
	//优先级
	@Excel(name = "优先级")
	private String priority;
	//当前状态
	@Excel(name = "当前状态")
	private String status;

}
