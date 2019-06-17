<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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


<title>查看用户</title>
<script>
	window.onload = function() {
		var selectAll = document.getElementById("selectAll");
		selectAll.onclick = function() {
			var chek = document.getElementsByName("ids");
			for (var i = 0; i < chek.length; i++) {
				chek[i].checked = true;
			}
		};
		var noSelectAll = document.getElementById("noSelectAll");
		noSelectAll.onclick = function() {
			var chek = document.getElementsByTagName("input");
			for (var i = 0; i < chek.length; i++) {
				chek[i].checked = false;
			}
		};
		var fanxuan = document.getElementById("fanxuan");
		fanxuan.onclick = function() {
			var chek = document.getElementsByName("ids");
			for (var i = 0; i < chek.length; i++) {
				if (chek[i].checked == true) {
					chek[i].checked = false;
				} else {
					chek[i].checked = true;
				}
			}
		};
		var deleteUser = document.getElementById("deleteUser");
		deleteUser.onclick = function() {
			var chek = document.getElementsByName("ids");
			alert(chek.length);
			var flag = false;
			for (var i = 0; i < chek.length; i++) {
				if (chek[i].checked == true) {
					flag = true;
					break;
				}
			}
			if (flag == false) {
				alert("请至少选择一项进行删除！")
				return;
			}

			var str = "";
			for (var i = 0; i < chek.length; i++) {
				if (chek[i].checked == true) {
					str += chek[i].value + ",";
				}
			}

			str = str.slice(0, str.length - 1);
			//alert(str);
			var queren = confirm("您确认要删除这些用户吗");
			if (queren == true) {
				location.href = "UserServlet?action=delete&ids=" + str;
			} else {
				location.reload();
			}
		};
		
		var outAll = document.getElementById("outAll");
		var chek = document.getElementsByName("ids");
		outAll.onclick = function() {

			var flage = confirm("你确定导出所有用户的信息？");

			if (flage) {

				window.location.href = "OutPutUserServlet?action=all";
			}
		};

		var outSelect=document.getElementById("outSelect");
		var chek = document.getElementsByName("ids");
		outSelect.onclick=function(){
			
			
			var flag = false;
			for (i = 0; i < chek.length; i++) {
				if (chek[i].checked == true) {
					flag = true;
					break;
				}
			}
			if (flag == false) {
				alert("请至少选择一项")
				return;
				
			}else{
			var str = "";
			for (var i = 0; i < chek.length; i++) {
				if (chek[i].checked == true) {
					str += chek[i].value + ",";
				}
			}

			str = str.slice(0, str.length - 1);
			//alert(str);
			var flage = confirm("您确定导出选中的用户信息？");
			if (flage) {
				location.href = "OutPutUserServlet?action=outSelect&ids=" + str;
			} 
		  }			
	    };
	};
</script>
</head>
<body background='images/03.jpg'>
<br>
<br>
<p align="center"><font size="7" face="幼圆">查看用户</font></p>
	<table align="center" width="800px" height="600px" cellspacing="0">
		<br>
		<td colspan=2 valign="top">
				<table class="table table-striped table-hover table-bordered"   width="800" height="350"
					align="center" cellspacing="0">
		<tr align="center">
			<td>编号</td>
			<td>姓名</td>
			<td>用户名</td>
			<td>头像</td>
			<td>密码</td>
			<td>手机号码</td>
			<td>注册时间</td>
			<td>删除</td>
			<td>修改</td>
		</tr>
		<c:forEach items="${pb.beanList}" var="u" varStatus="s">
			<tr align="center">
				<td>${s.index+1 }</td>
				<td>${u.name}</td>
				<td>${u.username}</td>
				<td><img src="/img${u.touxiang }" style="width:60px;height:50px"/></td>
				<td>${u.password}</td>
				<td>${u.phone}</td>
				<td>${u.time}</td>
				<td><input type="checkbox" name="ids" value="${u.id}" /></td>
				<td><a href="UserServlet?action=showOne&id=${u.id}" />修改</a></td>
			</tr>
		</c:forEach>
		<tr align="center">

			<td colspan="9"><button id="selectAll"class="btn btn-success btn-sm">全选</button>
				<button id="noSelectAll"class="btn btn-success btn-sm">全不选</button>
				<button id="fanxuan"class="btn btn-success btn-sm">反选</button>
				<button id="deleteUser"class="btn btn-success btn-sm">删除</button>
				<button id="outSelect" class="btn btn-success btn-sm">导出选中</button>
				<button id="outAll" class="btn btn-success btn-sm">导出全部</button></td>
		</tr>
		
		
	</table>
	<br>
	<br>
	<center>
		第${pb.pageNow}页/共${pb.pages}页 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
		<ul class="pagination">
		<li><a href="UserServlet?action=showUserByPage&pageNow=1">首页</a></li> &nbsp;
		&nbsp;
		<c:if test="${pb.pageNow>1 }">
			<li><a href="UserServlet?action=showUserByPage&pageNow=${pb.pageNow-1 }">上一页</a></li>
		</c:if>
		&nbsp; &nbsp;
		<!-- 分两种情况：
		         如果页数小于10：
		         如果页数大于10：         
		        -->
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
		<!-- 循环十个数 -->
		<c:forEach begin="${begin }" end="${end }" var="i">
			<c:choose>
				<c:when test="${pb.pageNow==i }">
		                <li class="active"><span>${i}</span></li>
		                </c:when>
				<c:otherwise>
					<li><a href="UserServlet?action=showUserByPage&pageNow=${i }">${i }</a></li>
				</c:otherwise>
			</c:choose>

		</c:forEach>
		&nbsp;

		<c:if test="${pb.pageNow<pb.pages }">
			<li><a href="UserServlet?action=showUserByPage&pageNow=${pb.pageNow+1 }">下一页</a></li>
		</c:if>
		&nbsp; &nbsp;
		 <li><a href="UserServlet?action=showUserByPage&pageNow=${pb.pages}">尾页</a></li>
		 </ul>
	</center>
	<p>
	<table align="center">
		<tr align="center">
			<br>
			<td><font size="4" color="#4682B4"">没有您查看的用户？您可以点击这里</font><a
				href="addUser.jsp" class="btn btn-primary btn-sm">添加用户</a></td>
		</tr>
		</table>
	</table>
</body>
</html>