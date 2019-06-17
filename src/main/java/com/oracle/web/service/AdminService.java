package com.oracle.web.service;

import com.oracle.web.bean.Admin;

public interface AdminService {

	int save(Admin admin);

	Admin login(String username);

	Admin queryOne(String username);

	Admin selectByPrimaryKey(String uname);

	Admin queryByPassword(Admin admin);

	Admin changePassword(String uname, String newpassword);


}