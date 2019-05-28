package com.oracle.web.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.mapper.AdminMapper;
import com.oracle.web.bean.Admin;
import com.oracle.web.service.AdminService;

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
	public Admin login(Admin admin) {
		// TODO Auto-generated method stub
		return this.adminMapper.login(admin);
	}

}
