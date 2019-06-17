package com.oracle.web.bean;

public class Admin {
    
    private Integer id;
    
    private String touxiang;

    private String name;

    
    private String phone;

    
    private String username;

    
    private String password;


	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public String getTouxiang() {
		return touxiang;
	}


	public void setTouxiang(String touxiang) {
		this.touxiang = touxiang;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public Admin(Integer id, String touxiang, String name, String phone, String username, String password) {
		super();
		this.id = id;
		this.touxiang = touxiang;
		this.name = name;
		this.phone = phone;
		this.username = username;
		this.password = password;
	}


	public Admin() {
		super();
		// TODO Auto-generated constructor stub
	}


	@Override
	public String toString() {
		return "Admin [id=" + id + ", touxiang=" + touxiang + ", name=" + name + ", phone=" + phone + ", username="
				+ username + ", password=" + password + "]";
	}
    
    

    }    