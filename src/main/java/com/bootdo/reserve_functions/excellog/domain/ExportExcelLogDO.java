package com.bootdo.reserve_functions.excellog.domain;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;


/**
 * 运营管理系统导出Excel日志记录
 *
 * @author MrWu
 * @email 1992lcg@163.com
 * @date 2019-10-28 16:57:30
 */
@Data
public class ExportExcelLogDO implements Serializable {
	private static final long serialVersionUID = 1L;

	// 
	private Integer id;
	//用户绑定用户名
	private String userName;
	//实际展示用户名
	private String name;
	//导出Excel名称
	private String excelName;
	//请求导出URL
	private String requestURL;
	//创建时间
	private Date createTime;

}
