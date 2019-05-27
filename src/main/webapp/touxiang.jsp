<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<% String path="D:\\JAVA_WEB\\upload"; %>
<body>
<form action="UserServlet?action=touxiang" method="post" enctype="multipart/form-data">

头像:<img src="<%=path %>${u.touxiang }"/>

</form>

</body>
</html>