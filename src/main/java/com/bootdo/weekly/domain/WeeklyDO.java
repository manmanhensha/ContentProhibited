package com.bootdo.weekly.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;


/**
 * @author wushiqiang
 * @email 1992lcg@163.com
 * @date 2019-03-04 16:16:44
 */
@Data
public class WeeklyDO implements Serializable {
	private static final long serialVersionUID = 1L;

	//主键id
	private Integer id;
	//周报内容
	//项目名称
	private String project;
	//工作内容描述
	private String workDes;
	//遇到的问题及解决方案
	private String problem;
	//任务性质
	private String task;
	//优先级
	private String priority;
	//当前状态
	private String status;
	//提交的用户id
	private Long userId;
	//创建周报时间
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date createTime;
	//更改时间
	private Date updateTime;
	//周报摘要
	private String title;
	// 状态 0:未批阅，1:已批阅
	private Integer isRead;

}
