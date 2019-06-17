<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<script type="text/javascript" src="js/ajax.js"></script>
<title>修改密码</title>

<script type="text/javascript">
	//1.验证原密码
	var flag;

	function validatePassword() {	
		var password = document.password.password;	
		var passwordMsg = document.getElementById("passwordMsg");		
		ajax({
		method:"POST",
		url:"AdminServlet",
		params:"action=validataPassword&password="+password.value,
		type:"text",
		success:function(data){
			
				if (data == "1") {//找到用户名

					passwordMsg.style.color = "green";

					passwordMsg.innerHTML = "密码正确";

					flag = true;

				} else {

					passwordMsg.style.color = "#FF4500";

					passwordMsg.innerHTML = "密码错误";

					password.focus();

					flag = false;

				}

			}

		});
	}

	//2.验证新密码
	function validateNewPassword() {
		
		var newpassword = document.password.newpassword;

		var reg = /^(w|\w){6,16}$/;

		var newpasswordMsg = document.getElementById("newpasswordMsg");

		if (reg.test(newpassword.value)) {

			newpasswordMsg.style.color = "green";

			newpasswordMsg.innerHTML = "密码合法";

			return true;

		} else {

			newpasswordMsg.style.color = "#FF4500";

			newpasswordMsg.innerHTML = "必须是6-16位的数字字母下划线或者特殊字符";

			newpassword.focus();

			return false;

		}
	}

	//3.确认新密码
	function validateRePassword() {

		var newpassword = document.password.newpassword;
		
		var repassword = document.password.repassword;
		
		var repasswordMsg = document.getElementById("repasswordMsg");

		if (repassword.value == newpassword.value) {

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

	function test() {

		return  flag && validateNewPassword() && validateRePassword();
	}
</script>
</head>
<body background='images/03.jpg'>
<br>
<br>
<p align="center"><font size="7" face="幼圆">修改密码</font></p>
	<form action="AdminServlet?action=update" method="post"
		name="password" onsubmit="return test()"
		enctype="application/x-www-form-urlencoded">
		<table align="center" width="500px" height="300px"
			cellspacing="0">
			<br>
			<td colspan=2 valign="top">
				<table class="table table-striped table-hover table-bordered" width="500px" height="220px"
					align="center" cellspacing="0">
			<tr>
				<td align="center"><font size="4">原密码:</font></td>
				<td><input type="text" name="password"
					onblur="validatePassword()"/><span id="passwordMsg"></span></td>
			</tr>
			<tr>
				<td align="center"><font size="4">新密码:</font></td>
				<td><input type="text" name="newpassword"
					onblur="validateNewPassword()"/><span id="newpasswordMsg"></span></td>
			</tr>
			<tr>
				<td align="center"><font size="4">确认新密码:</font></td>
				<td><input type="text" name="repassword"
					onblur="validateRePassword()"/><span id="repasswordMsg"></span></td>
			</tr>
			<tr>
				<td align="center" colspan="2"><input type="submit"class="btn btn-primary btn-sm"
					value="修&nbsp改"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="reset"class="btn btn-success btn-sm" value="重置"/></td>
			</tr>
			</table>
		</table>
	</form>
</body>
</html>