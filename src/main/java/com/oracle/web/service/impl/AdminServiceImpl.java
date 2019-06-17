package com.oracle.web.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.mapper.AdminMapper;
import com.oracle.web.bean.Admin;
import com.oracle.web.service.AdminService;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminMapper adminMapper;

	@Override
	@Transactional
	public int save(Admin admin) {
		// TODO Auto-generated method stub
		return this.adminMapper.save(admin);
	}

	@Override
	@Transactional
	public Admin login(String username) {
		// TODO Auto-generated method stub
		return this.adminMapper.login(username);
	}

	@Override
	@Transactional
	public Admin queryOne(String username) {
		// TODO Auto-generated method stub
		return this.adminMapper.queryOne(username);
	}

	@Override
	@Transactional
	public Admin selectByPrimaryKey(String uname) {
		// TODO Auto-generated method stub
		return this.adminMapper.selectByPrimaryKey(uname);
	}

	@Override
	public Admin queryByPassword(Admin admin) {
		// TODO Auto-generated method stub
		return this.adminMapper.queryByPassword(admin);
	}

	@Override
	public Admin changePassword(String uname, String newpassword) {
		// TODO Auto-generated method stub
		return this.adminMapper.changePassword(uname,newpassword);
	}


}
