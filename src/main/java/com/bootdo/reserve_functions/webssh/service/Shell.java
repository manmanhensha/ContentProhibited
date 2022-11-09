package com.bootdo.reserve_functions.webssh.service;

import com.jcraft.jsch.ChannelExec;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.Session;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

/**
 * @author wushiqiang
 * @date Created in 21:26 2022/11/5
 */
public class Shell {
	private String host;
	private String username;
	private String password;
	private int port = 22;
	private int timeout = 60 * 60 * 1000;

	public Shell(String host, String username, String password, int port, int timeout) {
		this.host = host;
		this.username = username;
		this.password = password;
		this.port = port;
		this.timeout = timeout;
	}

	public Shell(String host, String username, String password) {
		this.host = host;
		this.username = username;
		this.password = password;
	}

	public String execCommand(String cmd) {
		JSch jSch = new JSch();
		Session session = null;
		ChannelExec channelExec = null;
		BufferedReader inputStreamReader = null;
		BufferedReader errInputStreamReader = null;
		StringBuilder runLog = new StringBuilder("");
		StringBuilder errLog = new StringBuilder("");
		try {
			// 1. 获取 ssh session
			session = jSch.getSession(username, host, port);
			session.setPassword(password);
			session.setTimeout(timeout);
			session.setConfig("StrictHostKeyChecking", "no");
			session.connect();  // 获取到 ssh session

			// 2. 通过 exec 方式执行 shell 命令
			channelExec = (ChannelExec) session.openChannel("exec");
			channelExec.setCommand(cmd);
			channelExec.connect();  // 执行命令

			// 3. 获取标准输入流
			inputStreamReader = new BufferedReader(new InputStreamReader(channelExec.getInputStream()));
			// 4. 获取标准错误输入流
			errInputStreamReader = new BufferedReader(new InputStreamReader(channelExec.getErrStream()));

			// 5. 记录命令执行 log
			String line = null;
			while ((line = inputStreamReader.readLine()) != null) {
				runLog.append(line).append("\n");
			}

			// 6. 记录命令执行错误 log
			String errLine = null;
			while ((errLine = errInputStreamReader.readLine()) != null) {
				errLog.append(errLine).append("\n");
			}

			// 7. 输出 shell 命令执行日志
			System.out.println("exitStatus=" + channelExec.getExitStatus() + ", openChannel.isClosed="
					+ channelExec.isClosed());
			System.out.println("命令执行完成，执行日志如下:");
			System.out.println(runLog.toString());
			System.out.println("命令执行完成，执行错误日志如下:");
			System.out.println(errLog.toString());
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (inputStreamReader != null) {
					inputStreamReader.close();
				}
				if (errInputStreamReader != null) {
					errInputStreamReader.close();
				}

				if (channelExec != null) {
					channelExec.disconnect();
				}
				if (session != null) {
					session.disconnect();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		return runLog.toString();
	}
}
