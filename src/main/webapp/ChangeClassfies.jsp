<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<!--移动设备优先 -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.css">
<!--导入核心css文件 -->
<script type="text/javascript" src="bootstrap/js/jquery.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>

<script type="text/javascript" src="js/ajax.js"></script>
<title>修改密码</title>
<script type="text/javascript">
	var flag;

	function queryByPassword() {

		var password = document.changepassword.password;

		var pwMsg = document.getElementById("pwMsg");

		ajax({

			method : "POST",
			url : "queryByPassword",
			params : "password=" + password.value,
			type : "text",
			success : function(data) {

				if (data !=null) {//找到用户名

					pwMsg.style.color = "chartreuse";

					pwMsg.innerHTML = "原密码输入正确!";

					flag = true;

				} else {//没找到用户名

					pwMsg.style.color = "red";

					pwMsg.innerHTML = "原密码输入错误，请重新输入!";

					password.focus();

					flag = false;

				}

			}

		});

	}

	//校验新密码
	function queryBynewPassword() {
		
		var password = document.changepassword.password;
		
		var newpassword = document.changepassword.newpassword;
		
		var reg = /^(\w|\w){6,15}$/;

		var npwMsg = document.getElementById("npwMsg");

		var password = document.changepassword.password;

		if (!reg.test(newpassword.value)) {//格式不匹配

			npwMsg.style.color = "red";

			npwMsg.innerHTML = "新密码必须是6位以上的数字，字母，或者_!";

			return false;

		}

		if (password.value == newpassword.value) {

			npwMsg.style.color = "red";

			npwMsg.innerHTML = "新密码不能和原密码一样";

			return false;

		}

		npwMsg.style.color = "chartreuse";

		npwMsg.innerHTML = "新密码可用!";

		return true;

	}
	
	//确认密码

	function queryByrePassword() {

		var newpassword=document.changepassword.newpassword;
		
		var repassword=document.changepassword.repassword;
		
		var rpwMsg=document.getElementById("rpwMsg");
		
		if(repassword.value==newpassword.value){
			
			rpwMsg.style.color="chartreuse";
			
			rpwMsg.innerHTML="两次密码一致";
			
			flag=true;
		}else{
			
			rpwMsg.style.color="red";
			
			rpwMsg.innerHTML="抱歉两次密码不一致！";
			
			flag=false;
			
		}

	}

	function test() {

		return flag && queryBynewPassword() && queryByrePassword();

	}
</script>
</head>
<body background="imgs/15.jpg">
	<div class="container">
		<h1 align="center">修改密码</h1>
		<hr width="1000px">
		<form name="changepassword" action="changePassword" class="form-horizontal" method="post" onsubmit="return rest()">
		
		
			<div class="form-group">
				<label for="password" class="col-sm-4 control-label">原密码</label>
				<div class="col-sm-4">
					<input name="password" type="password" onblur="queryByPassword()" class="form-control" id="password"/>
					<span id="pwMsg"></span>
				</div>	
			</div>
			
			
			<div class="form-group">
				<label for="newpassword" class="col-sm-4 control-label">新密码</label>
				<div class="col-sm-4">
					<input type="password" name="newpassword" class="form-control" id="newpassword" onblur="queryBynewPassword()"/>
					<span id="npwMsg"></span>
				</div>	
			</div>
			
			<div class="form-group">
				<label for="rePassword" class="col-sm-4 control-label">确认密码</label>
				<div class="col-sm-4">
					<input type="password" name="rePassword" class="form-control" id="rePassword" onblur="queryByrePassword()"/>
					<span id="rpwMsg"></span>
				</div>	
			</div>
			
			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-4">
					<button type="submit" class="btn btn-info">点击修改</button>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="reset" class="btn btn-info">重新填写</button>
				</div>
			</div>
			
			
		</form>
	</div>
</body>
</html>