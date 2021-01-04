//package com.bootdo.reserve_functions.mysql_proxy.service;
//
//import com.xjt.proxy.domain.User;
//import com.xjt.proxy.dynamicdatasource.DataSourceSelector;
//import com.xjt.proxy.dynamicdatasource.DynamicDataSourceEnum;
//import com.xjt.proxy.mapper.UserMapper;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//
//import java.util.List;
//
///**
// * @author kevin
// * @date 2019-11-20 10:16
// */
//@Service
//public class UserService {
//
//	@Autowired
//	private UserMapper userMapper;
//
//	@DataSourceSelector(value = DynamicDataSourceEnum.SLAVE)
//	public List<User> listUser() {
//		List<User> users = userMapper.selectAll();
//		return users;
//	}
//
//	@DataSourceSelector(value = DynamicDataSourceEnum.MASTER)
//	public int update() {
//		User user = new User();
//		user.setUserId(Long.parseLong("1196978513958141952"));
//		user.setUserName("修改后的名字2");
//		return userMapper.updateByPrimaryKeySelective(user);
//	}
//
//	@DataSourceSelector(value = DynamicDataSourceEnum.SLAVE)
//	public User find() {
//		User user = new User();
//		user.setUserId(Long.parseLong("1196978513958141952"));
//		return userMapper.selectByPrimaryKey(user);
//	}
//}
