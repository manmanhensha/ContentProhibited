package com.bootdo.reserve_functions.cronutil;

import lombok.Data;

/**
 * @author wushiqiang
 * @date Created in 11:46 2021/11/13
 */
@Data
public class TaskScheduleModel {
	/**
	 * 所选作业类型:
	 * 1  -> 每天
	 * 2  -> 每月
	 * 3  -> 每周
	 * 4  ->间隔（每隔2个小时，每隔30分钟）
	 */
	Integer jobType;

	/**
	 * 一周的哪几天
	 */
	Integer[] dayOfWeeks;

	/**
	 * 一个月的哪几天
	 */
	Integer[] dayOfMonths;

	/**
	 * 秒
	 */
	Integer second;

	/**
	 * 分
	 */
	Integer minute;

	/**
	 * 时
	 */
	Integer hour;
}
