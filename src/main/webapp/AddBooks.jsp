<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>添加图书</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript">
	var flag;

	 function validateBName() {

		var bname = document.add.bname;

		var xmlhttp = getXMLHttpRequest();
		
		xmlhttp.open("POST", "yanzheng", true);

		xmlhttp.setRequestHeader("Content-type",
				"application/x-www-form-urlencoded");

		xmlhttp.send("bname="+bname.value);

		var nameReg = /^[\u0391-\uFFE5_A-z0-9]{1,15}$/;

		var bNameMsg = document.getElementById("bNameMsg");

		if (nameReg.test(bname.value)) {

			xmlhttp.onreadystatechange = function() {

				if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {

					var content = xmlhttp.responseText;
					
					//alert(content);

					var span = document.getElementById("bNameMsg");

					if (content == "1") {//图书名称已经存在

						span.style.color = "red";

						span.innerHTML = "此图书名称已经存在";

						span.focus();

						flag = false;

					} else {//图书名称不存在

						span.style.color = "darkcyan";

						span.innerHTML = "此图书名称可以添加";

						flag = true;

					}

				}

			}

		} else {

			bNameMsg.style.color = "red";

			bNameMsg.innerHTML = "必须是长度为1-15的汉字字母数字下划线";

			flag = false;
			
		}

	} 

	//2.校验价格
	function validatePrice() {

		var price = document.add.price;

		var reg = /(^[1-9]\d*(\.\d{1,2})?$)|(^0(\.\d{1,2})?$)/;

		var priceMsg = document.getElementById("priceMsg");

		if (reg.test(price.value)) {

			priceMsg.style.color = "darkcyan";

			priceMsg.innerHTML = "价格格式合法";

			flag = true;
		} else {

			priceMsg.style.color = "red";

			priceMsg.innerHTML = "价格格式不合法，正确格式为  52.11 或   52 或0.99";

			flag = false;
			
		}

	}

	//2.校验出版社
	function validatechubanshe() {

		var chubanshe = document.add.chubanshe;

		var reg = /^[\u4E00-\u9FA5\uf900-\ufa2d·s]{2,20}$/;

		var chubansheMsg = document.getElementById("chubansheMsg");

		if (reg.test(chubanshe.value)) {

			chubansheMsg.style.color = "darkcyan";

			chubansheMsg.innerHTML = "出版社格式合法";

			flag = true;
			
		} else {

			chubansheMsg.style.color = "red";

			chubansheMsg.innerHTML = "出版社格式不合法";

			flag = false;
			
		}

	}
	
	//2.校验人名
	function validatejieshuren() {

		var jieshuren = document.add.jieshuren;

		var reg = /^[\u4E00-\u9FA5A-Za-z]+$/;

		var jieshurenMsg = document.getElementById("jieshurenMsg");

		if (reg.test(jieshuren.value)) {

			jieshurenMsg.style.color = "darkcyan";

			jieshurenMsg.innerHTML = "姓名格式合法";

			flag = true;
		} else {

			jieshurenMsg.style.color = "red";

			jieshurenMsg.innerHTML = "姓名格式不合法";

			flag = false;
			
		}

	}

	
	function addb() {

		//alert(flag);
		return (flag);
	}
</script>
</head>
<body background="./imgs">
	<center>
		<p>
			<font color="black" size="6">添加图书</font>
		</p>
	</center>
	<hr width="700px">
	</br>
	<form action="book" method="post"
		enctype="application/x-www-form-urlencoded" name="add"
		onsubmit="return addb()">
		<table align="center" width="600px" height="400px" border="1px"
			cellspacing="0" bordercolor="silver" bgcolor="white">
			<tr align="center">
				<td>请选择分类:</td>
				<td><select name="fId">
						<c:forEach items="${flist }" var="f">
							<option value="${f.fId }">${f.fname }</option>
						</c:forEach>
				</select></td>
				<td><span></span></td>
			</tr>

			<tr align="center">
				<td width="100px">图&nbsp;书&nbsp;名&nbsp;称:</td>
				<td width="290px"><input type="text" name="bname" onblur="validateBName()"
					 /></td>
				<td><span id="bNameMsg"></span></td>
			</tr>

			<tr align="center">
				<td width="100px">图&nbsp;书&nbsp;价&nbsp;格:</td>
				<td width="250px"><input type="text" name="price"
					onblur="validatePrice()" /></td>
				<td><span id="priceMsg"></span></td>
			</tr>

			<tr align="center">
				<td width="100px">出&nbsp;&nbsp;&nbsp;版&nbsp;&nbsp;&nbsp;社:</td>
				<td><input type="text" name="chubanshe" onblur="validatechubanshe()" /></td>
				<td><span id= "chubansheMsg"></span></td>
			</tr>

			<tr align="center">
				<td width="100px">状&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;态:</td>
				<td><input type="radio" name="zhuangtai" checked value="未借出" />未借出&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
					type="radio" name="zhuangtai" value="借出" />借出</td>
				<td><span></span></td>
			</tr>
			<tr align="center">
				<td width="100px">借&nbsp;&nbsp;&nbsp;书&nbsp;&nbsp;&nbsp;人:</td>
				<td><input type="text" name="jieshuren" value="无" onblur="validatejieshuren()" /></td>
				<td><span id="jieshurenMsg"></span></td>
			</tr>
			<tr align="center">
				<td colspan="3"><input type="submit" value="添加" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
					type="reset" value="重填" /></td>
			</tr>
		</table>
	</form>
</body>
</html>