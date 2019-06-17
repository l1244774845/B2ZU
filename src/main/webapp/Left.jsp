<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//Dli HTML 4.01 ulansitional//EN" "http://www.w3.org/ul/html4/loose.dli">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>
<link type="text/css" href="jquery-ui.css" rel="stylesheet" />
<style type="text/css">
li {
	list-style-type: none;
	padding-top: 5px;
}

a {
	text-decoration: none;
}
</style>

<script type="text/javascript">
	$(function() {

		/* $("#accordion").accordion(); */

		$("#btn1").button({

			showLabel : true
		});

		$("#btn2").button({

			showLabel : true
		});

		$("#btn3").button({

			showLabel : true
		});

		$("#btn4").button({

			showLabel : true
		});

		$("#btn5").button({

			showLabel : true
		});

		$("#btn6").button({

			showLabel : true
		});

		$("#btn7").button({

			showLabel : true
		});

		$("#btn8").button({

			showLabel : true
		});

		$("#btn9").button({

			showLabel : true
		});

		$("#btn10").button({

			showLabel : true
		});

	});
</script>
</head>
<body>
<body>
	<h2 class="demoHeaders">Menu</h2>
	<div id="accordion">
		<h3>分类管理</h3>

		<div id="Fenlei">
			<div frame="void" height="80px" align="center" cellspacing="0"
				width="100px">
				<ul align="center">
					<li><span class="ui-icon ui-icon-plusthick"></span><a
						href="AddFenLei.jsp" target="right"><input type="button"
							value="添加分类" id="btn1" /></a></li>
				</ul>
				<ul align="center">
					<li><span class="ui-icon ui-icon-zoomin"></span><a
						href="ShowFenLei" target="right"><input
							type="button" value="查看分类" id="btn2"></a></li>
				</ul>
				<ul align="center">
					<li><span class="ui-icon ui-icon-pencil"></span><a
						href="updateFenlei.jsp" target="right"><input type="button"
							value="修改分类" id="btn3"></a></li>
				</ul>
			</div>
		</div>
		<h3>图书管理</h3>


		<div id="booksmanage">
			<div frame="void" height="80px" align="center" cellspacing="0"
				width="100px">
				<ul align="center">
					<li><span class="ui-icon ui-icon-seek-next"></span><a
						href="addBooksUI" target="right"><input type="button"
							value="添加图书" id="btn4" /></a></li>
				</ul>
				<ul align="center">
					<li><span class="ui-icon ui-icon-arrow-1-se"></span><a
						href="books/1" target="right"><input
							type="button" value="查看图书" id="btn5" /></a></li>
				</ul>
			</div>
		</div>

		<h3>用户管理</h3>


		<div id="usermanage">
			<div frame="void" height="80px" align="center" cellspacing="0"
				width="100px">
				<ul align="center">
					<li><span class="ui-icon ui-icon-arrowreturn-1-e"></span><a
						href="AddUsers.jsp" target="right"><input type="button"
							value="添加用户" id="btn6" /></a></li>
				</ul>
				<ul align="center">
					<li><span class="ui-icon ui-icon-battery-3"></span><a
						href="User" target="right"><input
							type="button" value="查看用户" id="btn7" /></a></li>
				</ul>
			</div>
		</div>

		<h3>管理员信息管理</h3>

		<div id="guailiyuan">
			<div frame="void" height="100px" align="center" cellspacing="0"
				width="100px">
				<ul align="center">
					<li><span class="ui-icon ui-icon-lightbulb"></span><a
						href="showAdmin" target="right"><input type="button"
							value="查看管理员" id="btn8" /></a></li>
				</ul>
				<ul align="center">
					<li><span class="ui-icon ui-icon-flag"></span><a
						href="ChangePassword.jsp" target="right"><input type="button"
							value="修改密码" id="btn9" /></a></li>
				</ul>
				<ul align="center">
					<li>
						<span class="ui-icon ui-icon-power"></span>
						<a href="exit" target="_parent">
							<input type="button" value="退出登录" id="btn10" />
						</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>