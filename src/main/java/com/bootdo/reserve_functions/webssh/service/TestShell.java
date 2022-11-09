package com.bootdo.reserve_functions.webssh.service;


import com.hxyd.itms.webssh.pojo.SFTP;
import com.hxyd.itms.webssh.pojo.WebSSHData;

/**
 * @author wushiqiang
 * @date Created in 20:42 2022/11/5
 */
public class TestShell {
	public static void main(String[] args) throws Exception {
		WebSSHData data = new WebSSHData();
		data.setHost("106.13.232.43");
		data.setPort(22);
		data.setUsername("root");
		data.setPassword("P@ssw0rd19960910yt");

		SFTP connect = SFTPUtil.getConnect(data);

//		File file = new File("D:\\Project\\WebSSH\\readme.md");
//		SFTPUtil.upload(connect, "/root/test/test3", file);

//		String s = SFTPUtil.execCommand(connect, "cat /root/test/test3/readme.md");
		String s = SFTPUtil.execCommand(connect, "ps -ef | grep smartagent");
		System.out.println(s);

//		SFTPUtil.disConn(connect.getSession(), connect.getChannel(), connect.getSftp(), connect.getChannelExec());
	}
}
