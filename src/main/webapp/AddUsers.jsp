<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- 1.要使用Bootstrap的话，必须是html5文档 -->
<meta charset="UTF-8">
<!-- 2.移动设备优先 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 3.导入核心的css文件 -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.css" />
<!-- 4.需要引入JQuery文件 -->
<script type="text/javascript" src="bootstrap/js/jquery.js"></script>
<!-- 5.引入BootStrap的核心JS文件 -->
<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
<title>添加用户</title>
<script type="text/javascript" src="js/ajax.js">
	
</script>

<script type="text/javascript">
	//1.验证名字
	function validateName() {
		var name = document.addUser.name;
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
	//2.验证用户名
	var flag;
	function validateUsername() {
		var username = document.addUser.username;
		var xmlhttp = getXMLHttpRequest();
		xmlhttp.open("POST", "UserServlet", true);
		xmlhttp.setRequestHeader("Content-type",
				"application/x-www-form-urlencoded");
		xmlhttp.send("action=validateUsername&username=" + username.value);
		var reg = /^[A-z0-9_]{3,15}$/;
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				var content = xmlhttp.responseText;
				var span = document.getElementById("usernameMsg");
				if (content == "0") {
					flag = true;
					if (reg.test(username.value)) {
						usernameMsg.style.color = "green";
						usernameMsg.innerHTML = "用户名合法";
						flag = true;
					} else {
						usernameMsg.style.color = "#FF4500";
						usernameMsg.innerHTML = "必须是3-15位的数字字母下划线";
						username.focus();
						flag = false;
					}
				} else {
					usernameMsg.style.color = "#FF4500";
					usernameMsg.innerHTML = "用户名已存在，请换一个";
					username.focus();
					flag = false;

				}
			}
		}
	}
	//3.验证密码
	function validatePassword() {
		var password = document.addUser.password;
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
	//4.确认密码
	function validateRePassword() {
		var password = document.addUser.password;
		var repassword = document.addUser.repassword;
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
	//5.验证手机
	function validatePhone() {
		var reg = /^1[3-9][0-9]{9}$/;
		var phone = document.addUser.phone;
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
	function jiaoyan() {
		return validateName() && validateUsername() && validatePassword()
				&& validateRePassword() && validatePhone();
	}
</script>
</head>
<body background='images/03.jpg'>
	<form action="UserServlet?action=addUser" method="post" name="addUser"
		onsubmit="return jiaoyan()" enctype="multipart/form-data">
		<table align="center" width="500px" height="550px" cellspacing="0">
			<br>
			<tr>
				<td align="center" colspan=2><font size="7" face="幼圆">添加用户</font><br></td>
			</tr>
			<td colspan=2 valign="top">
				<table class="table table-striped table-hover table-bordered"
					width="500px" height="320px" align="center" cellspacing="0">
					<tr align="center">
						<td align="center"><font size="4">姓名：</font></td>
						<td><input type="text" name="name" onblur="validateName()" /><span
							id="nameMsg"></span></td>
					</tr>
					<tr align="center">
						<td align="center"><font size="4">用户名：</font></td>
						<td><input type="text" name="username"
							onblur="validateUsername()" /><span id="usernameMsg"></span></td>
					</tr>
					<tr align="center">
						<td align="center"><font size="4">上传头像：</font></td>
						<td colspan="2" align="center"><input type="file"
							name="touxiang" /></td>
					</tr>
					<tr align="center">
						<td align="center"><font size="4">密码：</font></td>
						<td><input type="password" name="password"
							onblur="validatePassword()" /><span id="passwordMsg"></span></td>
					</tr>
					<tr align="center">
						<td align="center"><font size="4">确认密码：</font></td>
						<td><input type="password" name="repassword"
							onblur="validateRePassword()" /><span id="repasswordMsg"></span></td>
					</tr>
					<tr align="center">
						<td align="center"><font size="4">手机号码：</font></td>
						<td><input type="text" name="phone" onblur="validatePhone()" /><span
							id="phoneMsg"></span></td>
					</tr>
					<tr align="center">
						<td align="center"><font size="4">注册时间：</font></td>
						<td><input type="date" name="time" /></td>
					</tr>
					<tr align="center">
						<td colspan="2" align="center"><input type="submit"
							class="btn btn-primary btn-sm" value="添加" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="reset" class="btn btn-success btn-sm" value="清空" /></td>
					</tr>
				</table>
			</td>
		</table>
	</form>
</body>
</html>