<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrapValidator.css">
<script type="text/javascript" src="bootstrap/js/jquery.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrapValidator.js"></script>

<c:if test="${!(empty usernameisTrue) }">

	<script type="text/javascript">
		alert("${usernameisTrue}");
	</script>
	<c:remove var="usernameisTrue" scope="session" />
</c:if>
<title>注册</title>
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript">
	//window.onload=function(){
    var flage1=false;
	var flage2=false;
	var flage3=false;
	var flage4=false;
	var flage5=false;
	var flage6=false;
		
	function validatename() {

		var name = document.register.name;

		nameReg = /^[\u0391-\uFFE5]+$/;

		var flag1 = nameReg.test(name.value);

		var nameMsg = document.getElementById("nameMsg");

		if (flag1) {

			nameMsg.style.color = "green";

			nameMsg.innerHTML = "姓名合法";

			flage1= true;

		} else {

			nameMsg.style.color = "red";

			nameMsg.innerHTML = "姓名不合法";

			flage1= false;
		}
	}

	function validateaccount() {

		var account = document.register.account;
		
		var xmlhttp = getXMLHttpRequest();

		xmlhttp.open("POST", "AdminServlet", true);

		xmlhttp.setRequestHeader("Content-type",
				"application/x-www-form-urlencoded");

		xmlhttp.send("action=validateaccount&account=" + account.value);


		Reg = /^[a-zA-Z0-9_-]{4,16}$/;

		var accountMsg = document.getElementById("accountMsg");

		if (Reg.test(account.value)) {

			xmlhttp.onreadystatechange = function() {

				if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {

					var content = xmlhttp.responseText;

					//alert(content);

					var span = document.getElementById("accountMsg");

					if (content == "0") {//用户名没有注册，提示先注册

						span.style.color = "green";

						span.innerHTML = "用户名不存在,可以注册";

						span.focus();

						flage2 = true;

					} else {//用户名存在，可以登录

						span.style.color = "red";

						span.innerHTML = "用户名已存在";

						flage2 = false;

					}

				}

			}

		} else {

			accountMsg.style.color = "red";

			accountMsg.innerHTML = "账户不合法";

		    flage2= false;
		}
	}

	function validatePassword() {

		var password = document.register.password;

		var reg = /^(\w|\W){6,15}$/;

		var passwordMsg = document.getElementById("passwordMsg");

		if (reg.test(password.value)) {

			passwordMsg.style.color = "green";

			passwordMsg.innerHTML = "密码合法";

			flage3= true;

		} else {

			passwordMsg.style.color = "red";

			passwordMsg.innerHTML = "密码不合法";

			flage3= false;
		}

	}

	function validaterepassword(){
		
		var password=document.register.password;
		
	    var repassword=document.register.repassword;
		
		var passwordMsg=document.getElementById("passwordMsg");
		
		if(repassword.value==password.value){
			
			repasswordMsg.style.color="green";
			
			repasswordMsg.innerHTML="两次密码一致";
			
			flage4= true;
		}else{
			
			repasswordMsg.style.color="red";
			
			repasswordMsg.innerHTML="两次密码不一致";
			
			repassword.focus();
			
			flage4= false;
		}
		
		
	}
	function validatephone() {

		var phone = document.register.phone;

     	var reg = /^1[3-9][0-9]{9}$/;

		var phoneMsg = document.getElementById("phoneMsg");

		if (reg.test(phone.value)) {

			phoneMsg.style.color = "green";

			phoneMsg.innerHTML = "电话号码正确";

			flage5= true;

		} else {

			phoneMsg.style.color = "red";

			phoneMsg.innerHTML = "电话号码格式不对";

			flage5= false;
		}
	}
	
	 function validatetouxiang() {

			var touxiang = document.register.touxiang;

			var flag = false; //状态

			var arr = [ "jpg", "png", "gif" ];

			var index = touxiang.value.lastIndexOf(".");

			var ext = touxiang.value.substr(index + 1);
			//循环比较
			for (var i = 0; i < arr.length; i++) {

				if (ext == arr[i]) {

					flag = true; //一旦找到合适的，立即退出循环
					
					break;
				}
			}
			//条件判断
			if (flag) {
				
				touxiangMsg.style.color = "green";

				touxiangMsg.innerHTML = "头像格式合法";
				
				flage6=true;
				
			} else {
				
				touxiangMsg.style.color = "red";

				touxiangMsg.innerHTML = "头像格式不合法";
				
				flage6=false;
	}
};

	function jiaoyan() {

		return flage1 && flage2 && flage3 && flage4 && flage5 && flage6;
	}
</script>
</head>
<body>
<table>
		<tr background="imgs/11.jpg">
			<td width="50%"></td>
			<td align="center">
				<form action="AdminServlet?action=register" method="post"
					name="register" enctype="multipart/form-data"
					onsubmit="return jiaoyan()">
					<table frame="box" width="600px" height="280px" bordercolor="white">
						<tr>
							<td colspan="2">&nbsp;&nbsp;&nbsp;<font color="black"
								size="4"><b>注册账号</b></font></td>
						</tr>
						
						<tr>
							<td align="center"><font color="black"><b>头&nbsp;&nbsp;&nbsp;&nbsp;像:</b></font></td>
							<td><input type="file" name="touxiang" onblur="validatetouxiang()" /></td>
							<td width="300px"><span id="touxiangMsg"></span></td>
						</tr>
						
						<tr>
							<td align="center"><font color="black"><b>姓&nbsp;&nbsp;&nbsp;&nbsp;名:</b></font></td>
							<td><input type="text" name="name" onblur="validatename()" /></td>
							<td width="300px"><span id="nameMsg"></span></td>
						</tr>
						<tr>
							<td align="center"><font color="black"><b>帐&nbsp;&nbsp;&nbsp;&nbsp;号:</b></font></td>
							<td><input type="text" name="account" onblur="validateaccount()" /></td>
								<td width="300px"><span id="accountMsg"></span></td>
						</tr>
						<tr>
							<td align="center"><font color="black"><b>密&nbsp;&nbsp;&nbsp;&nbsp;码:</b></font></td>
							<td><input type="password" name="password" onblur="validatePassword()" /></td>
								<td width="300px"><span id="passwordMsg"></span></td>
						</tr>
						<tr>
							<td align="center"><font color="black"><b>确认密码:</b></font></td>
							<td><input type="password" name="repassword" onblur="validaterepassword()"/></td>
								<td width="300px"><span id="repasswordMsg"></span></td>
								
						</tr>
						<tr>
							<td align="center"><font color="black"><b>手机号码:</b></font></td>
							<td><input type="text" name="phone" onblur="validatephone()" /></td>
							<td width="300px"><span id="phoneMsg"></span></td>
						</tr>
						<tr>
				
							<td><a href="Login.jsp"><input type="submit" value="立即注册"/></a></td>
						</tr>
					</table>
				</form>
			</td>
		</tr>
		</table>
</body>
</html>