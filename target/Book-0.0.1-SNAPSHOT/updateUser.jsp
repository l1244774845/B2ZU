<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>修改用户信息</title>
</head>
<body background='images/03.jpg'>
<br>
<br>
<p align="center"><font size="7" face="幼圆">修改用户信息</font></p>
	<form action="UserServlet?action=updateUser" method="post" enctype="multipart/form-data">
		<input type='hidden' name='id' value="${u.id }" />
		<table width="500px" height="550px" cellspacing="0"
			align="center">
			<br>

	<td colspan=2 valign="top">
				<table class="table table-striped table-hover table-bordered"   width="500px" height="320px"
					align="center" cellspacing="0">

			<tr align="center">
				<td>姓名:</td>
				<td><input type="text" name="name" value="${u.name}" /></td>
			</tr>
			<tr align="center">
				<td>用户名:</td>
				<td><input type="text" name="username" value="${u.username}" /></td>
			</tr>

			<tr align="center">
				<td><img src="/img${u.touxiang }" style="width:60px;height:50px"/></td>
				<td><input type="file" name="touxiang" value="file" /></td>
			</tr>

			<tr align="center">
				<td>密码:</td>
				<td><input type="password" name="password"
					value="${u.password}" /></td>
			</tr>

			<tr align="center">
				<td>手机号码:</td>
				<td><input type="text" name="phone" value="${u.phone}" /></td>
			</tr>

			<tr align="center">
				<td>注册时间:</td>
				<td><input type="date" name="time" value="${u.time}" /></td>
			</tr>

			<tr height="45px" align="center">
				<td align="center" colspan="2"><input type="submit"class="btn btn-primary btn-sm"
					value="修&nbsp改"/> &nbsp; &nbsp; <input type="reset"class="btn btn-success btn-sm" value="清空" /></td>
			</tr>
			
			</table>
		</table>
	</form>
</body>
</html>