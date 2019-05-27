<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type="text/css">
a {
	text-decoration: none;
}
</style>
<title>查看管理员信息</title>
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<script type="text/javascript">
	window.onload = function() {

		var opt = {

			method : "POST",
			url : "AdminServlet",
			params : "action=ShowAdmin",
			type : "json",
			success : function(data) {

				var admin = data;

				var id = document.getElementById("id");

				id.innerHTML = admin.id;
				
				var touxiang = document.getElementById("touxiang");

				var img = document.createElement("img");

				img.src = "/img" + admin.touxiang;

				touxiang.appendChild(img);

				var name = document.getElementById("name");

				name.innerHTML = admin.name;

				var account = document.getElementById("account");

				account.innerHTML = admin.account;

				var password = document.getElementById("password");

				password.value = admin.password;

				var phone = document.getElementById("phone");

				phone.innerHTML = admin.phone;
			}
		};

		ajax(opt);

	};

	$(function() {

		$("tr:even").css("background-color", "transparent");

		$("tr:odd").css("background-color", "transparent");

		$("tr").mouseover(function() {

			$(this).css("background-color", "silver");

		});

		$("tr").mouseout(function() {

			$("tr:even").css("background-color", "transparent");

			$("tr:odd").css("background-color", "transparent");

		});
	});
</script>
</head>
<body background="./imgs/11.jpg">
	<center>
		<table width="300px" height="280px" border="1px" bordercolor="pink"
			cellspacing="0">
			<caption align="top">
				<h1>
					<font color="red">查看管理员信息</font>
				</h1>
				<hr size="2px" color="red" width="600px" />
			</caption>
			<tr align="center">
				<td>编号</td>
				<td id="id"></td>
			</tr>
			<tr align="center">
				<td>头像</td>
				<td id="touxiang"></td>
			</tr>
			<tr align="center">
				<td>姓名</td>
				<td id="name"></td>
			</tr>
			<tr align="center">
				<td>账号</td>
				<td id="account"></td>
			</tr>
			<tr align="center">
				<td>密码</td>
				<td><input type="password" id="password" disabled="disabled" /></td>
			</tr>
			<tr align="center">
				<td>手机</td>
				<td id="phone"></td>
			</tr>
		</table>
	</center>
</body>
</html>