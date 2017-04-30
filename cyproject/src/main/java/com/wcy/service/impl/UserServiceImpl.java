package com.wcy.service.impl;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wcy.common.Dict;
import com.wcy.dao.UserMapper;
import com.wcy.pojo.User;
import com.wcy.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService{
	
	@Resource
	private UserMapper userMapper;

	@Override
	public int saveUser(User user) throws Exception{
		// TODO Auto-generated method stub
		user.setRole(Dict.Role.ROLE_ADMIN);
		return userMapper.insertSelective(user);
	}

	@Override
	public User login(String username, String password) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.selectLogin(username, password);
	}

	@Override
	public List<User> getAllUser() {
		// TODO Auto-generated method stub
		return userMapper.getAllUser();	
	}
	
}
