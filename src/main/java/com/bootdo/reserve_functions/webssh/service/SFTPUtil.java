package com.bootdo.reserve_functions.webssh.service;

import cn.hutool.core.util.StrUtil;
import cn.hutool.json.JSONUtil;
import com.hxyd.itms.common.agent.model.out.FileLsDto;
import com.hxyd.itms.common.constant.Constants;
import com.hxyd.itms.utils.security.ThreadLocalUtil;
import com.hxyd.itms.webssh.pojo.SFTP;
import com.hxyd.itms.webssh.pojo.WebSSHData;
import com.jcraft.jsch.*;
import lombok.extern.slf4j.Slf4j;

import java.io.*;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Properties;
import java.util.Vector;

/**
 * @author wushiqiang
 * @date Created in 20:32 2022/11/5
 */
@Slf4j
public class SFTPUtil {

	/**
	 * 连接ftp/sftp服务器
	 */
	public static SFTP getConnect(WebSSHData data) throws Exception {
		String host = data.getHost();

		String s1 = ThreadLocalUtil.get(Constants.CITY_ID + ":" + host);
		if (StrUtil.isNotBlank(s1)) {
			return JSONUtil.toBean(s1, SFTP.class);
		}

		// 密钥的密码
// String privateKey ="key";
//  密钥文件路径
// String passphrase ="path";
		int port = data.getPort();
		String username = data.getUsername();
		String password = data.getPassword();

		SFTP s = new SFTP();
		Session session = null;
		Channel channel = null;
		ChannelSftp sftp = null;// sftp操作类
		ChannelShell shell = null;// shell操作类
		ChannelExec channelExec = null;
		JSch jsch = new JSch();

		//设置密钥和密码
		//支持密钥的方式登陆，只需在jsch.getSession之前设置一下密钥的相关信息就可以了
// if (privateKey != null && !"".equals(privateKey)) {
// if (passphrase != null && "".equals(passphrase)) {
// //设置带口令的密钥
//  jsch.addIdentity(privateKey, passphrase);
// } else {
// //设置不带口令的密钥
//  jsch.addIdentity(privateKey);
// }
// }
		session = jsch.getSession(username, host, port);
		session.setPassword(password);
		Properties config = new Properties();
		config.put("StrictHostKeyChecking", "no"); // 不验证 HostKey
		session.setConfig(config);
		try {
			session.connect();
		} catch (Exception e) {
			if (session.isConnected()) {
				session.disconnect();
			}
			log.error("连接服务器失败,请检查主机[" + host + "],端口[" + port
					+ "],用户名[" + username + "],端口[" + port
					+ "]是否正确,以上信息正确的情况下请检查网络连接是否正常或者请求被防火墙拒绝.");
		}
		channel = session.openChannel("sftp");
		//开启shell通道
		shell = (ChannelShell) session.openChannel("shell");
		channelExec = (ChannelExec) session.openChannel("exec");
		try {
			channel.connect();
		} catch (Exception e) {
			if (channel.isConnected()) {
				channel.disconnect();
			}
			log.error("连接服务器失败,请检查主机[" + host + "],端口[" + port
					+ "],用户名[" + username + "],密码是否正确,以上信息正确的情况下请检查网络连接是否正常或者请求被防火墙拒绝.");
		}
		sftp = (ChannelSftp) channel;

		s.setChannel(channel);
		s.setSession(session);
		s.setSftp(sftp);
		s.setShell(shell);
		s.setChannelExec(channelExec);
//		存储
		ThreadLocalUtil.set(Constants.CITY_ID + ":" + host, JSONUtil.toJsonStr(s));
		return s;
	}

	/**
	 * 断开连接
	 */
	public static void disConn(Session session, Channel channel, ChannelSftp sftp, ChannelExec channelExec) {
		if (null != sftp) {
			sftp.disconnect();
			sftp.exit();
		}
		if (null != channelExec) {
			channelExec.disconnect();
		}
		if (null != channel) {
			channel.disconnect();
		}
		if (null != session) {
			session.disconnect();
		}
	}

	/**
	 * 执行命令
	 */
	public static String execCommand(SFTP data, String cmd) {
		ChannelExec channelExec = data.getChannelExec();
		BufferedReader inputStreamReader = null;
//		BufferedReader errInputStreamReader = null;
		StringBuilder runLog = new StringBuilder("");
//		StringBuilder errLog = new StringBuilder("");
		try {
			// 2. 通过 exec 方式执行 shell 命令
			channelExec.setCommand(cmd);
			channelExec.connect();  // 执行命令

			// 3. 获取标准输入流
			inputStreamReader = new BufferedReader(new InputStreamReader(channelExec.getInputStream()));
			// 4. 获取标准错误输入流
//			errInputStreamReader = new BufferedReader(new InputStreamReader(channelExec.getErrStream()));

			// 5. 记录命令执行 log
			String line = null;
			while ((line = inputStreamReader.readLine()) != null) {
				runLog.append(line).append("\n");
			}

			// 6. 记录命令执行错误 log
//			String errLine = null;
//			while ((errLine = errInputStreamReader.readLine()) != null) {
//				errLog.append(errLine).append("\n");
//			}

			// 7. 输出 shell 命令执行日志
			log.info("exitStatus=" + channelExec.getExitStatus() + ", openChannel.isClosed="
					+ channelExec.isClosed());
			log.info("命令执行完成，执行日志如下: {}", runLog);
		} catch (Exception e) {
			log.error("执行命令失败：{}", e.getMessage());
		}

		return runLog.toString();
	}


	/**
	 * 上传文件
	 *
	 * @param directory 上传的目录-相对于SFPT设置的用户访问目录，
	 *                  为空则在SFTP设置的根目录进行创建文件（除设置了服务器全磁盘访问）
	 */
	public static boolean upload(SFTP data, String directory, File file) {
		//建立连接
		ChannelSftp sftp = data.getSftp();// sftp操作类
		try {
			try {
				sftp.cd(directory); //进入目录
			} catch (SftpException sException) {
				//指定上传路径不存在
				if (ChannelSftp.SSH_FX_NO_SUCH_FILE == sException.id) {
					sftp.mkdir(directory);//创建目录
					sftp.cd(directory); //进入目录
				}
			}
			InputStream in = Files.newInputStream(file.toPath());
			sftp.put(in, file.getName());
			in.close();

		} catch (Exception e) {
			log.error(e.getMessage());
			return false;
		}
		return true;
	}

	/**
	 * 上传文件
	 *
	 * @param sshData   ssh相关信息
	 * @param directory 文件目录
	 * @param file      文件
	 * @return 是否成功
	 * @throws Exception 异常信息
	 */
	public static boolean upload(WebSSHData sshData, String directory, File file) throws Exception {
		//建立连接
		SFTP data = getConnect(sshData);
		ChannelSftp sftp = data.getSftp();
		try {
			try {
				sftp.cd(directory); //进入目录
			} catch (SftpException sException) {
				//指定上传路径不存在
				if (ChannelSftp.SSH_FX_NO_SUCH_FILE == sException.id) {
					sftp.mkdir(directory);//创建目录
					sftp.cd(directory); //进入目录
				}
			}
			InputStream in = Files.newInputStream(file.toPath());
			sftp.put(in, file.getName());
			in.close();
//			关闭SSH
			disConn(data.getSession(), data.getChannel(), sftp, data.getChannelExec());
		} catch (Exception e) {
			log.error("上传文件异常：{}", e.getMessage());
			return false;
		}
		return true;
	}

	/**
	 * 下载文件
	 *
	 * @param directory    下载目录 根据SFTP设置的根目录来进行传入
	 * @param downloadFile 下载的文件
	 * @param saveFile     存在本地的路径
	 */
	public static void download(SFTP data, String directory, String downloadFile, String saveFile) throws Exception {
		// sftp操作类
		ChannelSftp sftp = data.getSftp();
		try {
			sftp.cd(directory); //进入目录
			File file = new File(saveFile);
			boolean bFile;
			bFile = file.exists();
			if (!bFile) {
				file.mkdirs();
			}
			OutputStream out = Files.newOutputStream(new File(saveFile, downloadFile).toPath());
			sftp.get(downloadFile, out);
			out.flush();
			out.close();
		} catch (Exception e) {
			throw new Exception(e.getMessage(), e);
		}
	}

	/**
	 * 列出目录下的文件
	 *
	 * @param directory 要列出的目录
	 * @return list 文件名列表
	 * @throws Exception
	 */
	public static FileLsDto listFiles(WebSSHData sshData, String directory) throws Exception {
		//建立连接
		SFTP s = getConnect(sshData);
		ChannelSftp sftp = s.getSftp();

		FileLsDto lsDto = new FileLsDto();
		lsDto.setDir(directory);
		ArrayList<FileLsDto.FilesBean> filesBeans = new ArrayList<>();

		//返回目录下所有文件名称
		Vector fileList = sftp.ls(directory);
//		断开连接
//		disConn(session,channel,sftp,s.getChannelExec());

		for (Object o : fileList) {
			ChannelSftp.LsEntry o1 = (ChannelSftp.LsEntry) o;
			String fileName = o1.getFilename();
			if (".".equals(fileName) || "..".equals(fileName)) {
				continue;
			}
			FileLsDto.FilesBean filesBean = new FileLsDto.FilesBean();

			filesBean.setName(fileName);
			filesBean.setIs_dir(false);
			if (o1.getLongname().startsWith("d")) {
				filesBean.setIs_dir(true);
			}
			filesBeans.add(filesBean);
		}

		lsDto.setFiles(filesBeans);
		return lsDto;
	}
}
