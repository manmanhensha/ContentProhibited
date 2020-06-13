//package com.bootdo.reserve_functions.feign_demo;
//
//import com.google.common.collect.Maps;
//import org.springframework.stereotype.Component;
//
///**
// * @Author: wushiqiang
// * @Date: Created in 20:55 2019/5/13
// * @Description:
// * @Modified By:
// */
//@Component
//public class UserFeignFallback implements UserLoginAPI{
//
//	@Override
//	public ApiOutDTO getWxUser(WxUserCodeInDTO wxUserCodeInDTO) {
//		ApiOutDTO apiOutDTO = new ApiOutDTO();
//		apiOutDTO.setCode(500);
//		apiOutDTO.setData(Maps.newHashMap());
//		apiOutDTO.setMsg("微信code获取openId异常");
//		return apiOutDTO;
//	}
//
//	@Override
//	public ApiOutDTO getAid(GetAidInDTO getAidInDTO) {
//		ApiOutDTO apiOutDTO = new ApiOutDTO();
//		apiOutDTO.setCode(501);
//		apiOutDTO.setData(Maps.newHashMap());
//		apiOutDTO.setMsg("openId获取aid异常");
//		return apiOutDTO;
//	}
//
//	@Override
//	public ApiOutDTO getMemberInfo(MemberInfoInDTO memberInfoInDTO) {
//		ApiOutDTO apiOutDTO = new ApiOutDTO();
//		apiOutDTO.setCode(502);
//		apiOutDTO.setData(Maps.newHashMap());
//		apiOutDTO.setMsg("aid获取会员信息异常");
//		return apiOutDTO;
//	}
//
//	@Override
//	public ApiOutDTO  sign (String url) {
//		ApiOutDTO apiOutDTO = new ApiOutDTO();
//		apiOutDTO.setCode(503);
//		apiOutDTO.setData(Maps.newHashMap());
//		apiOutDTO.setMsg("aid获取分享信息异常");
//		return apiOutDTO;
//	}
//
//	@Override
//	public ApiOutDTO getTokenByAid(MemberInfoInDTO memberInfoInDTO) {
//		ApiOutDTO apiOutDTO = new ApiOutDTO();
//		apiOutDTO.setCode(504);
//		apiOutDTO.setData(Maps.newHashMap());
//		apiOutDTO.setMsg("aid获取太马token异常");
//		return apiOutDTO;
//	}
//}
