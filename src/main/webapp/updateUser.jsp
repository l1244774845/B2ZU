<%@ page language="java" import="" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>修改用户信息</title>
<style type="text/css">
  #img{
     width: 50px;
     height: 50px;
  }
</style>
</head>
<body background="./imgs/11.jpg">
	<form action="UserServlet?action=changeUsers" method="post"
	enctype="multipart/form-data" >
	<input type="hidden" name="id" value="${u.id }"/>
		<table align="center" width="600px" height="300px" border="1px" cellspacing="0" bordercolor="silver">
			<caption align="top">
				<h1>
					<font color="red">修改用户信息</font>
				</h1>
				<hr size="2px" color="red" width="600px" />
			</caption>
			
			<tr align="center">
			<td>头像:</td>
				<td><img src="/img${u.touxiang }" id="img"><input type="file" name="touxiang" value="${u.touxiang }"/></td>
			</tr>
				<td>真实姓名:</td>
				<td><input type="text" name="realname" value="${u.realname }"/></td>
			</tr>
			<tr align="center">
				<td>用&nbsp;户&nbsp;名:</td>
				<td><input type="text" name="username" value="${u.username }"/></td>
			</tr>
			<tr align="center">
				<td>密&nbsp;&nbsp;&nbsp;&nbsp;码:</td>
				<td><input type="password" name="password" value="${u.password }"/></td>
			</tr>
			<tr align="center">
				<td>手机号码:</td>
				<td><input type="text" name="phone" value="${u.phone }"/></td>
			</tr>
			<tr align="center">
				<td>注册时间:</td>
				<td><input type="text" name="registime" value="${u.registime }"/></td>
			</tr>
			<tr align="center">
				<td colspan="2"><input type="submit" value="修改" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="reset" value="重新填写" /></td>
			</tr>
		</table>
	</form>
</body>
</html>