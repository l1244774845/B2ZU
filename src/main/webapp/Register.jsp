<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrapValidator.css">
<script type="text/javascript" src="bootstrap/js/jquery.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrapValidator.js"></script>
<title>注册</title>
<script type="text/javascript" src="js/ajax.js"></script>
 <script type="text/javascript">
	$(function() {
		$(".form-horizontal").bootstrapValidator({


					feedbackIcons : {


						valid : "glyphicon glyphicon-ok",
						invalid : "glyphicon glyphicon-remove",
						validating : "glyphicon glyphicon-refresh"
					},


					fields : {


						username : {


							validators : {


								notEmpty : {


									message : '用户名不能为空'


								},


								regexp : {


									regexp : /^[A-z0-9_]{3,25}$/,
									message : '用户名必须由3-25个英文字母、数字和下划线组成'


								},


								remote : {
									
									
									message : '该用户已被注册，请重新输入',


									url : "validate.action",


									type : 'post',


									data : function(validator) {


										return {


											username : $("input[name=username]").val()
										}
									}
								}


							}
						}
					}
					
					
				});
	}); 
</script> 
</head>
<body background="imgs/08.jpg">

	<div class = "container">
		<h1 align = "center">图书管理系统----管理员注册</h1>
		<hr width="1000px">
		<form name="register" action="register" class="form-horizontal" method="post" 
			enctype="multipart/form-data">
		
			<!-- 头像 -->
			<div class="form-group">
				<label for="touxiang" class="col-sm-4 control-label">头&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;像</label>
				<div class="col-sm-4">
					<input type="file" class="form-control" id="touxaing"
						name="touxiang" />
				</div>	
			</div>
		
			<!-- 姓名 -->
			<div class="form-group">
				<label for="name" class="col-sm-4 control-label">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="name"
						name="name"/>
				</div>	
			</div>
			
			<!-- 手机 -->
			<div class="form-group">
				<label for="phone" class="col-sm-4 control-label">手&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;机</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="phone"
						name="phone"/>
				</div>	
			</div>
			
			
			<!-- 用户名 -->
			<div class="form-group">
				<label for="username" class="col-sm-4 control-label">用&nbsp;&nbsp;户&nbsp;&nbsp;名</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="username"
						name="username"/>
				</div>	
			</div>
			
			<!-- 密码 -->
			<div class="form-group">
				<label for="password" class="col-sm-4 control-label">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码</label>
				<div class="col-sm-4">
					<input type="password" class="form-control" id="password"
						name="password"/>
				</div>	
			</div>
			
			<div class="form-group">
				<div class="col-sm-offset-5 col-sm-4">
					<button type="submit" class="btn btn-info">点击注册</button>
				</div>
			</div>
		
		</form>
		
		<div class="col-sm-offset-5 col-sm-4">
			<a href="Login.jsp">已经是管理员？直接登录</a>
		</div>
	
	</div>
		
</body>
</html>