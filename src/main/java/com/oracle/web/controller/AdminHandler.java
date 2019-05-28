package com.oracle.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.oracle.web.bean.Admin;
import com.oracle.web.service.AdminService;

@Controller
@Scope(value="prototype")
public class AdminHandler {
	
	private static final String NONE = null;
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping(value = "/register",method = RequestMethod.POST)
	public String register(Admin admin){         //注册
		
		int i = adminService.save(admin);
		
		if(i > 0){
			
			return "redirect:/Login.jsp";
			
		}else{
			
			return "redirect:/Register.jsp";
			
		
			
		}
		
	}
	
	@RequestMapping(value="login",method=RequestMethod.GET)
	public String login(Admin admin){  //登录
		
		Admin admin1=adminService.login(admin);
		
		if(admin1==null){
			
			return "redirect:/Login.jsp";
		}
		
		if(!admin1.getPassword().equals(admin.getPassword())){
			
			return "redirect:/Login.jsp";
		}
		
		return "redirecr:/Index.jsp";
	}
	
}

