<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改分类</title>
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript">
	window.onload = function() {

		var http = getXMLHttpRequest();

		var select = document.getElementById("fenleiList");

		http.open("POST", "FenLeiServlet", true);

		http.setRequestHeader("Content-type",
				"application/x-www-form-urlencoded");

		http.send("action=updateShowClassfies");

		http.onreadystatechange = function() {

			if (http.readyState == 4 && http.status == 200) {

				var content = http.responseXML;

				var names = content.getElementsByTagName("name");

				for (var i = 0; i < names.length; i++) {

					var name = names[i];

					var opt = document.createElement("option");

					var value;

					if (window.addEventListener) {

						value = name.textContentl
					} else {

						value = text;
					}

					opt.innerHTML = value;

					opt.value = value;

					select.appendChild(opt);

				}
			}

		}

	}
</script>
</head>
<body background="./imgs/11.jpg">
	<form action="FenLeiServlet?action=updateShowClassfies" method="post">
		<table align="center" width="400px" height="200px" border="1px"
			cellspacing="0" bordercolor="silver">
			<caption align="top">

				<font color="red">修改分类页面</font>

			</caption>
			<tr align="center">
				<td>请选择您要修改的分类</td>
				<td><select name="name" id="fenleiList">
						<option>---请选择要修改的分类---</option>
				</select>
				</td>
			</tr>
			<tr align="center">
				<td>请输入新的分类名称:</td>
				<td><input type="text" name="newname" /></td>
			</tr>
			<tr align="center">
				<td colspan="2"><input type="reset" value="修改" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
					type="reset" value="清空" /></td>
			</tr>
		</table>
	</form>
</body>
</html>