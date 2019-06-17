<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改分类</title>
</head>
<body background="images/03.jpg">
	<form action=FenleiServlet?action=update method="post">
		<table align="center" width="400px" height="200px" border="1px"
			cellspacing="0" bordercolor="silver">
			<caption align="top">
				<h2>
					<font size="7"face="幼圆" >修改分类页面</font>
				</h2>
			</caption>
			<tr align="center">


				<td>选择你要修改的分类名称:</td>
				<td>
				<select name="fname">
				<c:forEach items="${updateList }" var="fenlei">
							<option>${fenlei.fname }</option>
						</c:forEach>
				</select>
				</td>
			</tr>
			<tr>
				<td>请输入新的分类名称:</td>
				<td><input type="text" name="newname"/></td>
			</tr>
			<tr align="center">
				<td colspan="2"><input type="submit" value="修改" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
					type="submit" value="清空" /></td>
			</tr>
		</table>
	</form>
</body>
</html>