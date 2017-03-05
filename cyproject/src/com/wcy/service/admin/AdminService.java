package com.wcy.service.admin;

import java.util.List;

import com.wcy.pojo.Admin;

public interface AdminService {
	public Admin login(Admin admin);
	
	public Admin register(Admin admin);
	/**
	 * 获取所有的用户信息	
	 * @return
	 */
	public List<Admin> getAllUsers();

	public Integer deleteAdmin(Admin admin);
}
