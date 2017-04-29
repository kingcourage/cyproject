package com.wcy.service;

import java.util.List;

import com.wcy.pojo.User;

public interface UserService {
	/**
	 * 保存用户信息
	 * @author wcy
	 * @time 2017年4月20日下午6:41:52
	 */
	public int saveUser(User user) throws Exception;
	
	/**
	 * 
	 * @author wcy
	 * @time 2017年4月20日下午9:14:46
	 */
	public User login(String username,String password) throws Exception;
	
	/**
	 * 得到所有的用户信息
	 */
	public List<User> getAllUser();
	
}
