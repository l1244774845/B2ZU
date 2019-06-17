package com.oracle.mapper;

import com.oracle.web.bean.Admin;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface AdminMapper {
    
//    int deleteByPrimaryKey(Integer id);
//
//    
//    int insert(Admin record);
//
//    Admin selectByPrimaryKey(Integer id);
//
//    
//    List<Admin> selectAll();
//
//   
//    int updateByPrimaryKey(Admin record);

	int save(Admin admin);

	Admin login(String username);

	Admin queryOne(String username);

	Admin selectByPrimaryKey(String uname);

	Admin queryByPassword(Admin admin);

	Admin changePassword(@Param("username") String uname, @Param("password") String newpassword);

	//Admin changePassword(@RequestParam("username") String username,@RequestParam("password") String password);

}