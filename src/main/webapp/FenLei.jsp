<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<c:if test="${!(empty msg) }">
	<script>
		alert("${msg }");
	</script>
	<c:remove var="msg" scope="session" />
</c:if>
<title>添加分类</title>
<script type="text/javascript" src="js/ajax.js"></script>

<script type="text/javascript">
	var flag;

	function validatefenlei() {

		var name = document.fenlei.name;

		var Reg = /^[\u0391-\uFFE5_A-z0-9]{2,15}$/;

		var fenleiMsg = document.getElementById("fenleiMsg");

		if (!Reg.test(name.value)) {

			fenleiMsg.style.color = "red";

			fenleiMsg.innerHTML = "分类长度必须是2-15字母数字下划线";

			flag=false;
		} else {

			var xmlhttp = getXMLHttpRequest();

			xmlhttp.open("POST", "FenLeiServlet", true);

			xmlhttp.setRequestHeader("Content-type",
					"application/x-www-form-urlencoded");

			xmlhttp.send("action=validatefenlei&name=" + name.value);

			xmlhttp.onreadystatechange = function() {

				if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {

					var content = xmlhttp.responseText;

					//alert(content);

					var span = document.getElementById("fenleiMsg");

					if (content == "0") {//用户名没有注册，提示先注册

						span.style.color = "red";

						span.innerHTML = "分类名称已存在";

						span.focus();

						flag = false;

					} else {//用户名存在，可以登录

						span.style.color = "green";

						span.innerHTML = "分类名称可以添加";

						flag = true;

					}

				}

			}
		}
	}
	function fenlei() {

		alert(flag);

		return flag;
	};
</script>
</head>
<body background="./imgs/11.jpg">
	<form action="FenLeiServlet?action=AddClassfies" method="post"
		name="fenlei" enctype="application/x-www-form-urlencoded"
		onsubmit="return fenlei()">
		<table align="center" width="200px" height="100px" border="1px"
			cellspacing="0" bordercolor="silver">
			<caption align="top">
				<h1>
					<font color="red">添加分类</font>
				</h1>
				<hr size="2px" color="red" width="600px" />
			</caption>
			<tr align="center">
				<td>请输入分类的名字:</td>
				<td><input type="text" name="name" onblur="validatefenlei()"><span
					id="fenleiMsg"></span></td>
			</tr>
			<tr align="center">
				<td colspan="2"><input type="submit" value="添加" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
					type="reset" value="重填" /></td>
			</tr>
		</table>
	</form>
</body>
</html>