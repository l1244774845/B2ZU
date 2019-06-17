<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:if test="${!(empty msg2 )}">
      <script>
          alert("${msg2 }");
      </script>
      <c:remove var="msg2" scope="session"/>
</c:if>

<title>登录</title>
<style >
    body{
    margin:0
    }
</style>
</head>
<body background="images/04.jpg">
<table width="100%" height="1000px" cellspacing="0">
    <tr height="10px">
	<td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size="7" color="#cc6600" face="幼圆"><b>Oracle</b></font><font size="6" color="#606060">图书管理系统</font><font size="4" color="#b2b2b2">|</font><font size="4" color="#606060"  >登录</font></td></tr>	
    <td width="100%"align="center" >
        <form  action="AdminServlet?action=login" method="post">
	    <table action="center" width="400px" height="400px" bgcolor="white">
		<tr><td colspan="3">&nbsp;&nbsp;<font color="#4169E1" size="6" face="幼圆"><b>会员登录</b></font></td></tr>
		<tr><td align="center"><font size="4" color="#DB7093"><b>登&nbsp;录&nbsp;账&nbsp;号:<b></font></td><td><input type="text"  name="username"/></td></tr>
		<tr><td align="center"><font size="4" color="#DB7093"><b>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码:</b></font></td><td><input type="password" name="password"/></td></tr>
		<tr><td></td><td><input type="checkbox" checked><font size="3" color="#DB7093">两周内自动登录</font></td></tr>				
		<tr><td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="image" src="images/06.png"></td></tr>
		<tr><td colspan="2" align="center"><font size="4" color="#DB7093">还不是会员？立即<a href="register.jsp">注册</a></font></td></tr>
		</table>
		<br>         
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
	    </form>
	</td>	
</tr>
<tr height="150px">
	<td align="center" colspan="2"><font size="4" color="#ff9900">Oracle图书馆版权所有&copy;2018-2030</font></td>
</tr>
</table>
</body>
</html>