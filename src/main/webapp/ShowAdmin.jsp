<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//Dth HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dth">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<title>查看管理员信息</title>

<script type="text/javascript">

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
<body align="center" background="imgs/08.jpg"">
		<h1 align="center">查看管理员</h1>
		<h1 class="text-center text-danger"><span class="glyphicon glyphicon-user"></span></h1>


		<table  border="1" align="center" width="500px"
			height="300px" cellspacing="0">
			<tr align="center">
				<th>编号</th>
				<th>${admin.id}</th>
			</tr>
			
				<tr align="center">
			    <th>头像</th>
				<th><img src="touxiang/${sessionScope.touxiang }" style="width:60px;height:50px" class="img-circle img-responsive"/></th>
			
			<tr align="center">
				<th>姓名</th>
				<th>${admin.name}</th>
			</tr>
			
			<tr align="center">
				<th>手机</th>
				<th>${admin.phone}</th>
			</tr>
			
			
			<tr align="center">
				<th>账号</th>
				<th>${admin.username}</th>
			</tr>
			<tr align="center">
				<th>密码</th>
				<th><input type="password" value="${admin.password}" disabled="disabled"/></th>
			</tr>
			
		</table>
</body>
</html>