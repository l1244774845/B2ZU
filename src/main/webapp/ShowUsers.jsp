<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<!--移动设备优先 -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.css">
<!--导入核心css文件 -->
<script type="text/javascript" src="bootstrap/js/jquery.js"></script>
<script type="text/javascript"src="bootstrap/js/bootstrap.js"></script>
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<script type="text/javascript">
	window.onload = function() {
		var chek = document.getElementsByName("ids");

		var selectAll = document.getElementById("selectAll");

		selectAll.onclick = function() {

			var check = document.getElementsByName("ids2");

			for (var i = 0; i < check.length; i++) {

				check[i].checked = true;
			}
		};

		var unselectAll = document.getElementById("unselectAll");

		unselectAll.onclick = function() {

			var check = document.getElementsByName("ids2");

			for (var i = 0; i < check.length; i++) {

				check[i].checked = false;
			}

		};

		var fanxuan = document.getElementById("fanxuan");

		fanxuan.onclick = function() {

			var check = document.getElementsByName("ids2");

			for (var i = 0; i < check.length; i++) {

				if (check[i].checked == true) {

					check[i].checked = false;

				} else {

					check[i].checked = true;
				}

			}

		};

		var deleteStudent = document.getElementById("deleteStudent");

		deleteStudent.onclick = function() {

			var check = document.getElementsByName("ids2");

			//判断一下,他选了没有
			var flag = false;

			for (var i = 0; i < check.length; i++) {

				if (check[i].checked == true) {

					flag = true;

					break;

				}
			}

			if (flag == false) {

				alert("请至少勾选一项进行删除！");

				location.href = "UserServlet?action=ShowUsers";

				return;
			}

			//如果选择了

			var str = "";

			for (var i = 0; i < check.length; i++) {

				if (check[i].checked == true) {

					str = str + check[i].value + ",";

				}
			}

			//去除最后一个逗号
			str = str.slice(0, str.length - 1);

			//发送给服务器
			var queren = confirm("您确定要删除这些用户吗？");

			if (queren == true) {

				location.href = "UserServlet?action=delete&ids2=" + str;

			} else {

				location.reload();
			}
		};

		var choosetall = document.getElementById("choosetall");

		choosetall.onclick = function() {

			var flag = confirm("您确定导出全部信息？");

			if (flag) {

				window.location.href = "ChooseUserServlet?action=all";
			}

		};

		var choosetone = document.getElementById("choosetone");

		choosetone.onclick = function() {

			var flag = false;

			var chek = document.getElementsByName("ids2");

			for (i = 0; i < chek.length; i++) {

				if (chek[i].checked == true) {
					flag = true;
					break;
				}
			}
			;

			if (flag == false) {
				alert("请至少选一项");
				return;

			}

			var str = "";

			for (var i = 0; i < chek.length; i++) {

				if (chek[i].checked == true) {

					str += chek[i].value + ",";

				}
			}
			str = str.slice(0, str.length - 1);

			var flag = confirm("你确定导出选中的用户信息？");

			if (flag) {//确定
				window.location.href = "ChooseUserServlet?action=choosetone&ids2="
						+ str;

			} else {
				location.reload();
			}
		};
	};

	$(function() {

		$("tr:even").css("background-color", "transparent");

		$("tr:odd").css("background-color", "transparent");

		$("tr").mouseover(function() {

			$(this).css("background-color", "silver");

		});

		$("tr").mouseout(function() {

			$("tr:even").css("background-color", "transparent");

			$("tr:odd").css("background-color", "transparent");

		});
	});
</script>
<style type="text/css">
  #img{
     width: 50px;
     height: 50px;
  }
</style>
</head>
<body background="./imgs/11.jpg">

	<table align="center" width="600px" height="200px" border="1px"
		cellspacing="0" bordercolor="silver">
		<caption align="top">
			<h1>
				<font color="red">查看用户信息</font>
			</h1>
			<hr size="2px" color="red" width="600px" />
		</caption>
		<tr>
			<td>编号</td>
			<td>姓名</td>
			<td>用户名</td>
			<td>头像</td>
			<td>密码</td>
			<td>手机</td>
			<td>注册时间</td>
			<td>删除</td>
			<td>修改</td>
		</tr>
		<c:forEach items="${list }" var="s" varStatus="u">
			<tr align="center">
				<td><input type="checkbox" name="ids2" value="${s.id }" /></td>
				<td>${u.index+1 }</td>
				<td>${s.id }</td>
				<td><img src="/img${s.touxiang }" id="img"></td>
				<td>${s.realname }</td>
				<td>${s.username }</td>
				<td>${s.password }</td>
				<td>${s.phone }</td>
				<td>${s.registime }</td>
				<td><a href="UserServlet?action=showone&id=${s.id }"><input
						type="submit" value="修改" /></a></td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="8" align="center"><button id="selectAll" class="btn btn-default btn-xs" >全选</button>
				<button id="unselectAll" class="btn btn-success btn-xs">全不选</button>
				<button id="fanxuan" class="btn btn-info btn-xs">反选</button>
				<button id="choosetone" class="btn btn-primary btn-xs">选中当前</button>
				<button id="choosetall" class="btn btn-warning btn-xs">全部选中</button>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button id="deleteStudent" class="btn btn-warning btn-xs">删除</button></td>
		</tr>
	</table>
	<p>
	<p>
	<center>
		第${pb.pageNow }页/共${pb.pages }页 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a
			href="UserServlet?action=ShowUserpage&pageNow=1">首页</a> &nbsp;&nbsp;
		<c:if test="${pb.pageNow>1 }">
			<a href="UserServlet?action=ShowUserpage&pageNow=${pb.pageNow-1 }">上一页</a>
		</c:if>
		&nbsp;&nbsp;

		<c:choose>
			<c:when test="${pb.pages<=10 }">

				<c:set var="begin" value="1"></c:set>

				<c:set var="end" value="${pb.pages }"></c:set>

			</c:when>

			<c:otherwise>

				<c:set var="begin" value="${pb.pageNow-5 }"></c:set>

				<c:set var="end" value="${pb.pageNow+4 }"></c:set>

				<c:if test="${begin<=1 }">
					<c:set var="begin" value="1"></c:set>
					<c:set var="end" value="10"></c:set>
				</c:if>
				<c:if test="${end>=pb.pages }">
					<c:set var="begin" value="${pb.pages-9 }"></c:set>
					<c:set var="end" value="${pb.pages }"></c:set>
				</c:if>
			</c:otherwise>
		</c:choose>

		<c:forEach begin="${begin }" end="${end }" var="i">

			<c:choose>

				<c:when test="${pb.pageNow==i }">[${i }]</c:when>
				<c:otherwise>

					<a href="UserServlet?action=ShowUserpage&pageNow=${i }">[${i }]</a>

				</c:otherwise>

			</c:choose>

		</c:forEach>
		&nbsp;
		<c:if test="${pb.pageNow<pb.pages }">
			<a href="UserServlet?action=ShowUserpage&pageNow=${pb.pageNow+1 }">下一页</a>
		</c:if>
		&nbsp;&nbsp; <a
			href="UserServlet?action=ShowUserpage&pageNow=${pb.pages }">尾页</a>
	</center>
	<p>
	<table align="center">
		<tr align="center">
			<td>没有找到指定用户？您可以点击这里<a href="AddUsers.jsp">添加用户</a></td>
		</tr>
	</table>

</body>
</html>