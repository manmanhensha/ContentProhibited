package com.bootdo.reserve_functions.webssh.pojo;

import com.jcraft.jsch.*;
import lombok.Data;

/**
 * @author wushiqiang
 * @date Created in 20:33 2022/11/5
 */
@Data
public class SFTP {

	private Session session;//会话
	private Channel channel;//连接通道
	private ChannelSftp sftp;// sftp操作类
	private ChannelShell shell;// shell实时操作类
	private ChannelExec channelExec;// shell单次操作类
}
