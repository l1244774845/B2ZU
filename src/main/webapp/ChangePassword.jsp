<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript">
	var flag;

	function validatepassword() {

		var password = document.changepassword.password;

		var pwMsg = document.getElementById("pwMsg");

		ajax({

			method : "POST",
			url : "AdminServlet",
			params : "action=ValidatePassword&password=" + password.value,
			type : "text",
			success : function(data) {

				if (data == "1") {//找到用户名

					pwMsg.style.color = "green";

					pwMsg.innerHTML = "原密码输入正确!";

					flag = true;

				} else {//没找到用户名

					pwMsg.style.color = "red";

					pwMsg.innerHTML = "原密码输入错误，请重新输入!";

					password.focus();

					flag = false;

				}

			}

		});

	}

	//校验新密码
	function validateNewPassword() {

		var reg = /^\w{6,}$/;

		var newpassword = document.changepassword.newpassword;

		var npwMsg = document.getElementById("npwMsg");

		var password = document.changepassword.password;

		if (!reg.test(newpassword.value)) {//格式不匹配

			npwMsg.style.color = "red";

			npwMsg.innerHTML = "新密码必须是6位以上的数字，字母，或者_!";

			return false;

		}

		if (password.value == newpassword.value) {

			npwMsg.style.color = "red";

			npwMsg.innerHTML = "新密码不能和原密码一样";

			return false;

		}

		npwMsg.style.color = "green";

		npwMsg.innerHTML = "新密码可用!";

		return true;

	}

	function validateRePassword() {

		var newpassword=document.changepassword.newpassword;
		
		var repassword=document.changepassword.repassword;
		
		var rpwMsg=document.getElementById("rpwMsg");
		
		if(repassword.value==newpassword.value){
			
			rpwMsg.style.color="green";
			
			rpwMsg.innerHTML="两次密码一致";
			
			flag=true;
		}else{
			
			rpwMsg.style.color="red";
			
			rpwMsg.innerHTML="抱歉两次密码不一致！";
			
			flag=false;
			
		}

	}

	function test() {

		return flag && validateNewPassword() && validateRePassword();

	}
</script>
</head>
<body background="./imgs/11.jpg">
	<br />
	<br />
	<br />
	<br />
	<center>
		<form name="changepassword" action="AdminServlet?action=ChangePassword" method="post"
			onsubmit="return test();">
			<table width="300px" height="280px" border="1px" bordercolor="pink"
				cellspacing="0">
				<caption align="top">
					<h1>
						<font color="red">修改管理员密码</font>
					</h1>
					<hr size="2px" color="red" width="600px" />
				</caption>
				<tr align="center">
					<td>原&nbsp;&nbsp;&nbsp;&nbsp;密&nbsp;&nbsp;&nbsp;&nbsp;码</td>
					<td><input name="password" type="password"
						onblur="validatepassword()" /><span id="pwMsg"></span></td>
				</tr>
				<tr align="center">
					<td>新&nbsp;&nbsp;&nbsp;&nbsp;密&nbsp;&nbsp;&nbsp;&nbsp;码</td>
					<td><input name="newpassword" type="password"
						onblur="validateNewPassword()" /><span id="npwMsg"></span></td>
				</tr>
				<tr align="center">
					<td>确认新密码</td>
					<td><input name="repassword" type="password"
						/ onblur="validateRePassword()"><span id="rpwMsg"></span></td>
				</tr>
				<tr align="center">
					<td colspan="2"><input type="submit" value="确认修改" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
						type="reset" value="重新填写" /></td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>