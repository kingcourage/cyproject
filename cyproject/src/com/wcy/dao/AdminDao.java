package com.wcy.dao;

import java.util.List;

import com.wcy.pojo.Admin;

public interface AdminDao {
	public Admin login(Admin admin);

	public void register(Admin admin);

	public List<Admin> getAllUsers();

	public Integer deleteAdmin(Admin admin);
}
