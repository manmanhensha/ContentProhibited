package com.bootdo.contentProhibited.util;

import cn.hutool.core.lang.func.Func1;

/**
 * @author wushiqiang
 * @date Created in 11:33 2019/11/22
 * @description
 * @modified By
 */
public class ReplaceFun implements Func1<String, String> {

	@Override
	public String call(String parameter) throws Exception {
		return "< span  class='highlight'>+" + parameter + "</span>'";
	}
}
