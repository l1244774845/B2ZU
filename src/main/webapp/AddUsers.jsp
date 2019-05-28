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
<title>添加用户</title>

<script type="text/javascript" src="js/ajax.js"></script>

<script type="text/javascript" src="js/jquery-1.8.3.js"></script>

<script>

var flag;

//1.校验姓名
function validatename() {

	var name = document.adduser.name;

	var nameReg = /^[\u0391-\uFFE5]{2,10}$/;

	var flag1 = nameReg.test(name.value);

	var nameMsg = document.getElementById("nameMsg");

	if (flag1) {

		nameMsg.style.color = "darkcyan";

		nameMsg.innerHTML = "姓名合法";

		return true;

	} else {

		nameMsg.style.color = "red";

		nameMsg.innerHTML = "姓名必须是2-10位汉字";

		name.focus();

		return false;
	}

};


//2.校验用户名
function validateaccount() {

	var username = document.adduser.username;

	var nameReg = /^[A-z0-9_]{3,15}$/;//必须是数字字母下划线，长度3-15

	var accountMsg = document.getElementById("accountMsg");

	ajax({
		method : "POST",
		url : "UserServlet",
		params : "action=validateaccount&username=" + username.value,
		type : "text",
		success : function(data) {

			if (nameReg.test(accountMsg.value)) {

				if (data == "0") {//用户名已经存在

					accountMsg.style.color = "red";

					accountMsg.innerHTML = "此用户名已经存在";

					username.focus();

					flag = false;

				} else {//用户名不存在

					accountMsg.style.color = "darkcyan";

					accountMsg.innerHTML = "此用户名可以添加";

					flag = true;

				}

			} else {

				accountMsg.style.color = "red";

				accountMsg.innerHTML = "必须是数字字母下划线，长度3-15";

				username.focus();

				flag = false;
			}

		}
	})
};


//3.校验密码
function validatepassword() {

	var password = document.adduser.password;

	var reg = /^(\w|\W){6,15}$/;

	var passwordMsg = document.getElementById("passwordMsg");

	if (reg.test(password.value)) {

		passwordMsg.style.color = "darkcyan";

		passwordMsg.innerHTML = "密码合法";

		return true;

	} else {

		passwordMsg.style.color = "red";

		passwordMsg.innerHTML = "必须是长度为6-15的数字字母下划线或者特殊字符";

		password.focus();

		return false;
	}
};

//4.校验手机号
function validatePhone() {

	var phone = document.adduser.phone;

	var reg = /^1[3-9][0-9]{9}$/;

	var phoneMsg = document.getElementById("phoneMsg");

	if (reg.test(phone.value)) {

		phoneMsg.style.color = "darkcyan";

		phoneMsg.innerHTML = "手机号合法";

		return true;

	} else {

		phoneMsg.style.color = "red";

		phoneMsg.innerHTML = "手机号不合法";

		phone.focus();

		return false;
	}

}


function validateTime() {

	var time = document.adduser.time;

	var timeMsg = document.getElementById("timeMsg");

	var date = new Date;

	var year = date.getFullYear();

	var month = date.getMonth();

	var day = date.getDate();

	var today = new Date(year, month, day);

	var reg = /\d+/g;

	var temp = time.value.match(reg);

	var foday = new Date(temp[0], parseInt(temp[1]) - 1, temp[2]);

	//var foday = new Date(year, month + 1, day);

	if (foday > today) {

		timeMsg.style.color = "red";

		timeMsg.innerHTML = "日期输入错误,在今天之后";

		//alert('在今天之后 ');

		time.focus();

		return false;

	} else if (foday < today) {

		timeMsg.style.color = "red";

		timeMsg.innerHTML = "日期输入错误,在今天之前";

		//alert('在今天之前 ');

		time.focus();

		return false;

	} else {

		timeMsg.style.color = "darkcyan";

		timeMsg.innerHTML = "日期输入正确";

		return true;
	}
}
 
//6.校验头像
    function validatetouxiang() {

		var touxiang = document.adduser.touxiang;

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
			
			return true;
			
		} else {
			
			touxiangMsg.style.color = "red";

			touxiangMsg.innerHTML = "头像格式不合法";
			
			return false;
		}
	}

function yanzheng() {

	//alert(flag);
	return validatename() && (flag) && validatepasswprd()
			&& validatePhone() && validateTime() && validatetouxiang();
};
	 

$(function(){
	   
	   $("tr:even").css("background-color","transparent");
	   
	   $("tr:odd").css("background-color","transparent");
	   
	   //事件
	   $("tr").mouseover(function(){
		   
		   $(this).css("background-color","LightYellow");
	   });
	   
	   $("tr").mouseout(function(){
		   
		   $("tr:even").css("background-color","transparent");
		   
		   $("tr:odd").css("background-color","transparent");
	   });
   });   

</script>

</head>
<body background="./imgs/11.jpg">
	<form action="UserServlet?action=AddUsers" method="post"
		enctype="multipart/form-data" name="adduser"
		onsubmit="return yanzheng()">
		<table align="center" width="100px" height="300px" border="1px"
			cellspacing="0" bordercolor="silver">
			<caption align="top">
				<h1>
					<font color="red">添加用户</font>
				</h1>
				<hr size="2px" color="red" width="600px" />
			</caption>
			
			<tr align="center">
				<td>头像:</td>
				<td><input type="file" name="touxiang" onblur="validatetouxiang()" /><span
					id="touxiangMsg"></span></td>
				
			<tr align="center">
				<td>真实姓名:</td>
				<td><input type="text" name="realname" onblur="validatename()" /><span
					id="nameMsg"></span></td>
			</tr>
			<tr align="center">
				<td>用&nbsp;&nbsp;户&nbsp;&nbsp;名:</td>
				<td><input type="text" name="username"
					onblur="validateaccount()" /><span id="accountMsg"></span></td>
			</tr>
			<tr align="center">
				<td>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码:</td>
				<td><input type="text" name="password"
					onblur="validatepassword()" /><span id="passwordMsg"></span></td>
			</tr>
			<tr align="center">
				<td>手机号码:</td>
				<td><input type="text" name="phone" onblur="validatePhone()"><span
					id="phoneMsg"></span></td>
			</tr>
			<tr align="center">
				<td>注册时间:</td>
				<td><input type="text" name="registime" onblur="validateTime()"/><span id="timeMsg"></span></td>
			</tr>
			
			<tr align="center">
				<td colspan="2"><input type="submit" value="添加用户" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
					type="reset" value="重新填写" /></td>
			</tr>
		</table>
	</form>
</body>
</html>