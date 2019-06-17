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
<title>修改图书</title>
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript">
	window.onload = function() {//页面加载完成

		ajax({
			method : "POST",
			url : "FenleiServlet",
			params : "action=updateShowFenlei",
			type : "xml",
			success : function(data) {

				var select = document.getElementById("fenleiList");

				var fnames = data.getElementsByTagName("fname");

				for (var i = 0; i < fnames.length; i++) {

					var fname = fnames[i];

					var opt = document.createElement("option");

					var value;

					if (window.addEventListener) {

						value = fname.textContent;

					} else {

						value = text;
					}

					opt.innerHTML = value;

					opt.value = value;

					select.appendChild(opt);

				}

			}

		});

	};
</script>
</head>
<body background='images/03.jpg'>
	<form action="BookServlet?action=updateBook" method="post">
	<table width="500px" height="550px" cellspacing="0" align="center">
		<input type='hidden' name="id" value="${b.id}" />
		<br>
		<tr height="20%">
			<td colspan="2" align="center"><font size="7" face="幼圆">修改图书</font></td>
		</tr>
		<td colspan=2 valign="top">
				<table class="table table-striped table-hover table-bordered"   width="500px" height="300px"
					align="center" cellspacing="0"></td>			
			<tr align="center">
				<td>选择分类:</td>
				<td colspan="2"><select name="fname" id="fenleiList"
					value="${b.fname }">
				</select></td>
			</tr>

			<tr align="center">
				<td>图书名称:</td>
				<td colspan="2"><input type="text" name="name"
					value="${b.name }" /></td>
			</tr>

			<tr align="center">
				<td>图书价格:</td>
				<td colspan="2"><input type="text" name="price"
					value="${b.price }" /></td>
			</tr>

			<tr align="center">
				<td>出版社:</td>
				<td colspan="2"><input type="text" name="chuban"
					value="${b.chuban }" /></td>
			</tr>

			<tr align="center">
				<td>状态:</td>
				<td colspan="2"><input type="radio" checked name="zhuangtai"
					value="未借出" />未借出<input type="radio" name="zhuangtai" value="借出" />借出</td>
			</tr>

			<tr align="center">
				<td>借书人:</td>
				<td colspan="2"><input type="text" name="jieshuren"
					value="${b.jieshuren }" /></td>
			</tr>

			<tr align="center">
				<td colspan="2" align="center"><input type="submit" class="btn btn-primary btn-sm" value="修改" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
					type="reset"class="btn btn-success btn-sm"  value="清空" /></td>
			</tr>
			</table>
		</table>
	</form>
</body>
</html>