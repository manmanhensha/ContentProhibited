//package com.bootdo.reserve_functions.feign_demo;
//
//import org.springframework.http.MediaType;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.RequestParam;
//
///**
// * @Author: wushiqiang
// * @Date: Created in 11:24 2019/5/13
// * @Description:
// * @Modified By:
// */
//@FeignClient(value = "user-api", url = "${gateway.base-url}", fallbackFactory = UserFeignFactory.class)
//public interface UserLoginAPI {
//
//	/**
//	 * 用前端传递的微信code去获取openid
//	 * @param wxUserCodeInDTO
//	 * @return 返回openid和用户的昵称
//	 */
//	@PostMapping(value = "/monkey/user/getWxUser",consumes = MediaType.APPLICATION_JSON_VALUE,produces = MediaType.APPLICATION_JSON_VALUE)
//	ApiOutDTO getWxUser(@RequestBody WxUserCodeInDTO wxUserCodeInDTO);
//
//	/**
//	 * 根据openId获取aid
//	 * @param getAidInDTO
//	 * @return aid
//	 */
//	@PostMapping(value = "/monkey/user/getAid",consumes = MediaType.APPLICATION_JSON_VALUE,produces = MediaType.APPLICATION_JSON_VALUE)
//	ApiOutDTO getAid(@RequestBody GetAidInDTO getAidInDTO);
//
//	/**
//	 * 根据aid获取太马token
//	 * @param memberInfoInDTO
//	 * @return aid
//	 */
//	@PostMapping(value = "monkey/user/getTokenByAid",consumes = MediaType.APPLICATION_JSON_VALUE,produces = MediaType.APPLICATION_JSON_VALUE)
//	ApiOutDTO getTokenByAid(@RequestBody MemberInfoInDTO memberInfoInDTO);
//
//	/**
//	 * 获取用户的会员信息
//	 * @param memberInfoInDTO
//	 * @return
//	 */
//	@PostMapping(value = "/monkey/member/getMemberInfo",consumes = MediaType.APPLICATION_JSON_VALUE,produces = MediaType.APPLICATION_JSON_VALUE)
//	ApiOutDTO getMemberInfo(@RequestBody MemberInfoInDTO memberInfoInDTO);
//
//	/**
//	 * 用户分享
//	 * @param url
//	 * @return
//	 */
//	@GetMapping(value = "/monkey/wx/sign",consumes = MediaType.APPLICATION_JSON_VALUE,produces = MediaType.APPLICATION_JSON_VALUE)
//	ApiOutDTO sign(@RequestParam(value = "url", required = true) String url);
//
//}
