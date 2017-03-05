package com.wcy.serviceimpl.admin;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wcy.dao.AdminDao;
import com.wcy.pojo.Admin;
import com.wcy.service.admin.AdminService;

@Service("adminService")
public class AdminServiceImpl implements AdminService {	
	@Resource
	private AdminDao adminDao;
	
	@Override
	public Admin login(Admin admin) {
		// TODO Auto-generated method stub
		return adminDao.login(admin);
	}
	@Override
	public Admin register(Admin admin) {
		// TODO Auto-generated method stub
		adminDao.register(admin);
		return adminDao.login(admin);
	}
	@Override
	public List<Admin> getAllUsers() {
		// TODO Auto-generated method stub
		return adminDao.getAllUsers();
	}
	@Override
	public Integer deleteAdmin(Admin admin) {
		// TODO Auto-generated method stub
		return adminDao.deleteAdmin(admin);
	}
	
}
