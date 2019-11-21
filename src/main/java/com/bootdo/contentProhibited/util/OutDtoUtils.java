package com.bootdo.contentProhibited.util;


import cn.hutool.core.util.StrUtil;
import com.bootdo.common.utils.R;
import com.bootdo.contentProhibited.dto.BaseOutDTO;

/**
 * @description:
 * @auther: jx
 * @date: 2018-12-24 19:05
 */
public class OutDtoUtils {

	/**
	 * outDto TO R
	 *
	 * @param outDTO
	 * @return
	 */
	public static R reOutDtoToR(BaseOutDTO outDTO) {
		if (StrUtil.equals(BaseOutDTO.BaseOutType.SUCCEED.toString(), outDTO.getStatus())) {
			return R.ok();
		} else {
			return R.error(outDTO.getErrorMessage());
		}
	}


}
