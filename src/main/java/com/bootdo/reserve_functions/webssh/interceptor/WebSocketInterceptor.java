package com.bootdo.reserve_functions.webssh.interceptor;

import cn.hutool.core.util.IdUtil;
import com.bootdo.reserve_functions.webssh.constant.ConstantPool;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.HandshakeInterceptor;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

public class WebSocketInterceptor implements HandshakeInterceptor {
	/**
	 * @Description: Handler处理前调用
	 * @Param: [serverHttpRequest, serverHttpResponse, webSocketHandler, map]
	 * @return: boolean
	 * @Author: NoCortY
	 * @Date: 2020/3/1
	 */
	@Override
	public boolean beforeHandshake(ServerHttpRequest serverHttpRequest, ServerHttpResponse serverHttpResponse,
								   WebSocketHandler webSocketHandler, Map<String, Object> map) {
		if (serverHttpRequest instanceof ServletServerHttpRequest) {
			ServletServerHttpRequest request = (ServletServerHttpRequest) serverHttpRequest;
			HttpServletRequest servletRequest = request.getServletRequest();
//			String cityId = servletRequest.getParameter(Constants.CITY_ID);
			long cityId = IdUtil.getSnowflake(1, 1).nextId();
			//将 cityId 放到websocketsession中
			map.put(ConstantPool.USER_UUID_KEY, cityId);
			return true;
		} else {
			return false;
		}
	}

	@Override
	public void afterHandshake(ServerHttpRequest serverHttpRequest, ServerHttpResponse serverHttpResponse, WebSocketHandler webSocketHandler, Exception e) {

	}
}
