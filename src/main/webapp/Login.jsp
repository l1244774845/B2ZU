<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<meta name="viewport" content="width=device-width,initial-scale=1">
<!--移动设备优先 -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.css">
<!--导入核心css文件 -->
<script type="text/javascript" src="bootstrap/js/jquery.js"></script>
<script type="text/javascript"src="bootstrap/js/bootstrap.js"></script>
<c:if test="${!(empty msg2) }">

	<script>
		alert("${msg2}");
	</script>
	<c:remove var="msg2" scope="session" />
</c:if>
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript">
/*	var flag;

	function validateaccount() {

		var account = document.login.account;

		var xmlhttp = getXMLHttpRequest();

		xmlhttp.open("POST", "AdminServlet", true);

		xmlhttp.setRequestHeader("Content-type",
				"application/x-www-form-urlencoded");

		xmlhttp.send("action=validateaccount&account=" + account.value);

		xmlhttp.onreadystatechange = function() {

			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {

				var content = xmlhttp.responseText;

				alert(content);

				var span = document.getElementById("accountMsg");

				if (content == "0") {//用户名没有注册，提示先注册

					span.style.color = "red";

					span.innerHTML = "你输入的用户名错误，或者不存在";

					span.focus();

					flag = false;

				} else {//用户名存在，可以登录

					span.style.color = "green";

					span.innerHTML = "用户名存在，可以登录";

					flag = true;

				}

			}

		}

	};
	function test() {

		//alert(validateaccount());

		//return validateaccount();
         alert(flag);
         
		return (flag);
	}   */
</script>
<title>登录</title>
</head>
<body>
	<table width="100%" height="800px" cellspacing="0">
		<tr height="80px">
			<td colspan="2">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font
				color="red" size="7" face="楷体"><b>皖越</b></font>&nbsp;<font size="6">图书管理系统</font>&nbsp;<font
				size="6" color="silver">|</font>&nbsp;<font color="silver" size="5">登录</font>
			</td>
		</tr>
		<tr background="./imgs/15.jpg">
			<td width="30%"></td>
			<td align="center">
				<form action="AdminHandler?action=login" method="post" name="login"
					enctype="application/x-www-form-urlencoded"
					onsubmit="return test()">
					 <table frame="box" width="300px" height="280px" bordercolor="white"  class="table table-hover">
						<tr>
							<td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font
								size="4"><b>会员登录</b></font></td>
						</tr>
						<tr>
							<td align="center"><b>登录账号:</b></td>
							<td><input type="text" name="account"/></td>
						</tr>
						<tr>
							<td align="center"><b>密&nbsp;&nbsp;&nbsp;&nbsp;码:</b></td>
							<td><input type="password" name="password" /></td>
						</tr>
						<tr>
							<td></td>
							<td><input type="checkbox" checked><font size="2">两周内自动登录</font></td>
						</tr>
						<tr>
							<td></td>
							<td><input type="image" src="./imgs/login.png" /></td>
						</tr>
						<tr>
							<td></td>
							<td><a href="Register.jsp"><font size="2" color="red">还不是会员？立即注册</font></a></td>
						</tr>
					</table>
				</form>
			</td>
		</tr>
		<tr height="100px">
			<td align="center" colspan="2"><font color="gray" size="4"
				face="楷体">皖越公司版权所有&copy;1998-2018</font></td>
		</tr>
	</table>
</body>
</html>