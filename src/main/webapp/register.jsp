<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrapValidator.css">
<script type="text/javascript" src="bootstrap/js/jquery.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrapValidator.js"></script>

<title>注册</title>
<script type="text/javascript">
	$(function() {
		$("#register")
				.bootstrapValidator(
						{
							feedbackIcons : {
								valid : "glyphicon glyphicon-ok",
								invalid : "glyphicon glyphicon-remove",
								validating : "glyphicon glyphicon-refresh"
							},
							fields : {
								name : {
									validators : {
										notEmpty : {
											message : '姓名值不能为空！'
										},
										regexp : {
											regexp : /^[\u0391-\uFFE5]{2,10}$/,
											message : '姓名必须是2-10位汉字'
										}
									}
								},

								username : {
									validators : {
										notEmpty : {
											message : '用户名不能为空'
										},
										regexp : {
											regexp : /^[A-z0-9_]{3,15}$/,
											message : '用户名必须是3-15位数字字母下划线'
										},
										remote : {
											message : '用户名已存在',
											url : 'AdminServlet',
											type : 'post',//不指定type,默认是get
											data : {
												action : 'validateUsername',
												username : $(
														'input[name=username]')
														.val()
											},
											delay : 500
										}
									}
								},
								password : {
									validators : {
										notEmpty : {
											message : '密码不能为为空'
										},
										regexp : {
											regexp : /^(\w|\w){6,15}$/,
											message : '必须是6-15位数字字母下划线或者特殊字符'
										}
									}
								},
								repassword : {
									validators : {
										notEmpty : {
											message : '确认密码不能为空'
										},
										identical : {
											field : 'password',
											message : '两次密码不一致'
										}
									}
								},
								phone : {
									validators : {
										notEmpty : {
											message : '手机号不能为空'
										},
										regexp : {
											regexp : /^(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(15[0-9]{9})$/,
											message : '手机号不合法'
										}
									}
								},
								touxiang : {
									validators : {
										notEmpty : {
											message : '头像不能为空'
										},

									}

								}
							}
						});
	});
	/*
	 //1.验证名字
	
	 function validateName() {

	 var name = document.register.name;

	 nameReg = /^[\u0391-\uFFE5]{2,10}$/;

	 var flag = nameReg.test(name.value);

	 var nameMsg = document.getElementById("nameMsg");

	 if (flag) {

	 nameMsg.style.color = "green";

	 nameMsg.innerHTML = "姓名合法";

	 return true;
	 } else {
	 nameMsg.style.color = "#FF4500";

	 nameMsg.innerHTML = "姓名必须是2-10位汉字";

	 name.focus();

	 return false;
	 }
	 }


	 //2.验证手机

	 function validatePhone() {

	 var phone = document.register.phone;

	 var reg = /^1[3-9][0-9]{9}$/;

	 var phoneMsg = document.getElementById("phoneMsg");

	 if (reg.test(phone.value)) {

	 phoneMsg.style.color = "green";

	 phoneMsg.innerHTML = "手机号码合法";

	 return true;

	 } else {

	 phoneMsg.style.color = "#FF4500";

	 phoneMsg.innerHTML = "手机号码不合法";

	 phone.focus();

	 return false;

	 }

	 }
	 //3.验证用户名
	
	 var flag;
	
	 function validateUsername() {

	 var username = document.register.username;
	
	
	 var xmlhttp=getXMLHttpRequest();
	 xmlhttp.open("POST","AdminServlet",true);
	 xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	 xmlhttp.send("action=validateUsername&Username="+username.value);
	 var reg = /^[A-z0-9_]{3,15}$/;
	 xmlhttp.onreadystatechange=function(){
	 if(xmlhttp.readyState==4 && xmlhttp.status==200){
	 var content=xmlhttp.responseText;
	 alert(content);
	 var span=document.getElementById("usernameMsg");
	 if(content=="0"){
	 if (reg.test(username.value)) {
	 usernameMsg.style.color = "green";
	 usernameMsg.innerHTML = "用户名合法";
	 flag=true;	    		   		    		 		    		   
	 } else {
	 usernameMsg.style.color = "#FF4500";
	 usernameMsg.innerHTML = "必须是3-15位的数字字母下划线";
	 username.focus();
	 flag=false;	 
	 }
	 }else{
	 usernameMsg.style.color = "#FF4500";
	 usernameMsg.innerHTML = "用户名已存在，请换一个";
	 username.focus();
	 flag=false;	 
	
	 }
	 }
	 }
	 }
	 //4.验证密码

	 function validatePassword() {

	 var password = document.register.password;

	 var reg = /^(w|\w){6,16}$/;

	 var passwordMsg = document.getElementById("passwordMsg");

	 if (reg.test(password.value)) {

	 passwordMsg.style.color = "green";

	 passwordMsg.innerHTML = "密码合法";

	 return true;

	 } else {

	 passwordMsg.style.color = "#FF4500";

	 passwordMsg.innerHTML = "必须是6-16位的数字字母下划线或者特殊字符";

	 password.focus();


	 return false;

	 }
	 }


	 //5.确认密码
	 function validateRePassword() {

	 var password = document.register.password;

	 var repassword = document.register.repassword;

	 var repasswordMsg = document.getElementById("repasswordMsg");

	 if (repassword.value == password.value) {

	 repasswordMsg.style.color = "green";

	 repasswordMsg.innerHTML = "两次密码一致";

	 return true;

	 } else {

	 repasswordMsg.style.color = "#FF4500";

	 repasswordMsg.innerHTML = "两次密码不一致";

	 repassword.focus();

	 return false;
	 }

	 }


	 function jiaoyan() {

	 return validateName() && validatePhone() && validateUsername() && validatePassword() && validateRePassword();

	 }*/
</script>
</head>
<body background='images/04.jpg'>
	<!-- <form action="AdminServlet?action=register" method="post"
		name="register" onsubmit="return jiaoyan()"
		enctype="multipart/form-data"> -->
		<br>
	<p align="center">
		<font size="6" face="幼圆">注册</font>
	</p>
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<form id="register" action="AdminServlet?action=register"enctype="multipart/form-data"
					method="post">
					<div class="form-group">
						<label>姓名:</label> <input type="text" name="name"
							class="form-control"/>
					</div>
					<div class="form-group">
						<label>头像:</label> <input type="file" name="touxiang"
							class="form-control"/>
					</div>
					<div class="form-group">
						<label>手机</label> <input type="text" name="phone"
							class="form-control">
					</div>
					<div class="form-group">
						<label>账号:</label> <input type="text" name="username"
							class="form-control"/>
					</div>
					<div class="form-group">
						<label>密码</label> <input type="password" name="password"
							class="form-control">
					</div>
					<div class="form-group">
						<label>确认密码</label> <input type="password" name="repassword"
							class="form-control">
					</div>
					<div class="form-group">
						<button type="submit" class="btn btn-danger btn-block">注册</button>
					</div>
					<tr align="center">
						<br>
						<td><font size="4">您已经注册，请点击这里<a href="login.jsp">登录</a></font></td>
					</tr>
				</form>
			</div>
		</div>
	</div>
</body>
</html>



