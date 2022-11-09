package com.bootdo.reserve_functions.webssh.service.impl;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.hxyd.itms.common.exception.ErrMsgException;
import com.hxyd.itms.common.exception.ErrorCode;
import com.hxyd.itms.core.spring.SpringUtils;
import com.hxyd.itms.webssh.constant.ConstantPool;
import com.hxyd.itms.webssh.pojo.SSHConnectInfo;
import com.hxyd.itms.webssh.pojo.WebSSHData;
import com.hxyd.itms.webssh.service.WebSSHService;
import com.jcraft.jsch.Channel;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.JSchException;
import com.jcraft.jsch.Session;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Arrays;
import java.util.Map;
import java.util.Properties;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ScheduledExecutorService;

/**
 * @Description: WebSSH业务逻辑实现
 */
@Service
@Slf4j
public class WebSSHServiceImpl implements WebSSHService {
	//存放ssh连接信息的map
	private static Map<String, Object> sshMap = new ConcurrentHashMap<>();

	/**
	 * 异步操作任务调度线程池
	 */
	private ScheduledExecutorService executorService = SpringUtils.getBean("scheduledExecutorService");

	/**
	 * @Description: 初始化连接
	 * @Param: [session]
	 * @return: void
	 */
	@Override
	public void initConnection(WebSocketSession session) {
		JSch jSch = new JSch();
		SSHConnectInfo sshConnectInfo = new SSHConnectInfo();
		sshConnectInfo.setJSch(jSch);
		sshConnectInfo.setWebSocketSession(session);
		String uuid = String.valueOf(session.getAttributes().get(ConstantPool.USER_UUID_KEY));
		//将这个ssh连接信息放入map中
		sshMap.put(uuid, sshConnectInfo);
	}

	/**
	 * @Description: 处理客户端发送的数据
	 * @Param: [buffer, session]
	 * @return: void
	 */
	@Override
	public void recvHandle(String buffer, WebSocketSession session) {
		ObjectMapper objectMapper = new ObjectMapper();
		WebSSHData webSSHData;
		try {
			webSSHData = objectMapper.readValue(buffer, WebSSHData.class);
		} catch (IOException e) {
			log.error("Json转换异常");
			log.error("异常信息:{}", e.getMessage());
			return;
		}
		String userId = String.valueOf(session.getAttributes().get(ConstantPool.USER_UUID_KEY));
		if (ConstantPool.WEBSSH_OPERATE_CONNECT.equals(webSSHData.getOperate())) {
			//找到刚才存储的ssh连接对象
			SSHConnectInfo sshConnectInfo = (SSHConnectInfo) sshMap.get(userId);
			//启动线程异步处理
			executorService.execute(() -> {
				try {
					connectToSSH(sshConnectInfo, webSSHData, session);
				} catch (JSchException | IOException e) {
					log.error("webssh连接异常");
					log.error("异常信息:{}", e.getMessage());
					close(session);
					throw new ErrMsgException(ErrorCode.RES_PON, "连接失败：用户名或密码错误！");
				}
			});
		} else if (ConstantPool.WEBSSH_OPERATE_COMMAND.equals(webSSHData.getOperate())) {
			String command = webSSHData.getCommand();
			SSHConnectInfo sshConnectInfo = (SSHConnectInfo) sshMap.get(userId);
			if (sshConnectInfo != null) {
				try {
					log.info("用户: {},发送命令: {}", userId, command);
					transToSSH(sshConnectInfo.getChannel(), command);
				} catch (IOException e) {
					log.error("webssh连接异常");
					log.error("异常信息:{}", e.getMessage());
//					执行命令错误后不关闭session
//                    close(session);
				}
			}
		} else {
			log.error("不支持的操作");
			close(session);
		}
	}

	@Override
	public void sendMessage(WebSocketSession session, byte[] buffer) throws IOException {
		session.sendMessage(new TextMessage(buffer));
	}

	@Override
	public void close(WebSocketSession session) {
		String userId = String.valueOf(session.getAttributes().get(ConstantPool.USER_UUID_KEY));
		SSHConnectInfo sshConnectInfo = (SSHConnectInfo) sshMap.get(userId);
		if (sshConnectInfo != null) {
			//断开连接
			if (sshConnectInfo.getChannel() != null) sshConnectInfo.getChannel().disconnect();
			//map中移除
			sshMap.remove(userId);
		}
	}

	/**
	 * @Description: 使用jsch连接终端
	 * @Param: [cloudSSH, webSSHData, webSocketSession]
	 * @return: void
	 * @Author: NoCortY
	 * @Date: 2020/3/7
	 */
	private void connectToSSH(SSHConnectInfo sshConnectInfo, WebSSHData webSSHData, WebSocketSession webSocketSession) throws JSchException, IOException {
		Session session = null;
		Properties config = new Properties();
		config.put("StrictHostKeyChecking", "no");
		//获取jsch的会话
		session = sshConnectInfo.getJSch().getSession(webSSHData.getUsername(), webSSHData.getHost(), webSSHData.getPort());
		session.setConfig(config);
		//设置密码
		session.setPassword(webSSHData.getPassword());
		//连接  超时时间30s
		session.connect(30000);

		//开启shell通道
		Channel channel = session.openChannel("shell");

		//通道连接 超时时间3s
		channel.connect(3000);

		//设置channel
		sshConnectInfo.setChannel(channel);

		//转发消息
		transToSSH(channel, "\r");

		//读取终端返回的信息流
		try (InputStream inputStream = channel.getInputStream()) {
			//循环读取
			byte[] buffer = new byte[1024];
			int i = 0;
			//如果没有数据来，线程会一直阻塞在这个地方等待数据。
			while ((i = inputStream.read(buffer)) != -1) {
				sendMessage(webSocketSession, Arrays.copyOfRange(buffer, 0, i));
			}

		} finally {
			//断开连接后关闭会话
			session.disconnect();
			channel.disconnect();
		}

	}

	/**
	 * @Description: 将消息转发到终端
	 * @Param: [channel, data]
	 * @return: void
	 * @Author: NoCortY
	 * @Date: 2020/3/7
	 */
	private void transToSSH(Channel channel, String command) throws IOException {
		if (channel != null) {
			OutputStream outputStream = channel.getOutputStream();
			outputStream.write(command.getBytes());
			outputStream.flush();
		}
	}
}
