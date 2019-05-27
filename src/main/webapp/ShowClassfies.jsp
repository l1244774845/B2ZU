<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
  String path=request.getContextPath();

  String base=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/"+path+"/";
%>
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


<style>
a {
	text-decoration: none;
}
</style>
<script type="text/javascript">
	window.onload = function() {

		var selectAll = document.getElementById("selectAll");

		selectAll.onclick = function() {

			var check = document.getElementsByName("ids");

			for (var i = 0; i < check.length; i++) {

				check[i].checked = true;

			}
		};

		var unselect = document.getElementById("unselect");

		unselect.onclick = function() {

			var check = document.getElementsByName("ids");

			for (var i = 0; i < check.length; i++) {

				check[i].checked = false;
			}
		}

		var resetall = document.getElementById("resetall");

		resetall.onclick = function() {

			var check = document.getElementsByName("ids");

			for (var i = 0; i < check.length; i++) {

				if (check[i].checked == true) {

					check[i].checked = false;
				} else {

					check[i].checked = true;
				}
			}
		}

		var deletestudent = document.getElementById("deletestudent");

		deletestudent.onclick = function() {

			var check = document.getElementsByName("ids");

			var flag = false;

			for (var i = 0; i < check.length; i++) {

				if (check[i].checked == true) {

					flag = true;

					break;
				}
			}

			if (flag == false) {

				alert("请至少勾选一个进行删除!!");

				return;
			}

			var str = "";

			for (var i = 0; i < check.length; i++) {

				if (check[i].checked == true) {

					str += check[i].value + ",";
				}
			}

			str = str.slice(0, str.length - 1);

			var queren = confirm("请确认你想要删除的编号:");

			if (queren == true) {

				location.href = "FenLeiServlet?action=delete&ids=" + str;
			} else {

				location.reload();
			}
		}
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
</head>
<body background="<%=base %>/imgs/11.jpg">
	<table align="center" width="200px" height="100px" border="1px"
		cellspacing="0" bordercolor="silver">
		<caption align="top">
			<h1>
				<font color="red">查看所有分类</font>
			</h1>
			<hr size="2px" color="red" width="600px" />
		</caption>

		<button id="selectAll" class="btn btn-success btn-xs">全选</button>
		<button id="unselect" class="btn btn-info btn-xs">全不选</button>
		<button id="resetall" class="btn btn-primary btn-xs">反选</button>

		<tr align="center">
			<td>选择</td>
			<td>编号</td>
			<td>id</td>
			<td>分类名称</td>
			<td>删除</td>
			<td>修改</td>

		</tr>
		<c:forEach items="${pb.beanList }" var="f" varStatus="s">
			<tr align="center">
				<td><input type="checkbox" name="ids" value="${f.id  }" /></td>
				<td>${s.index+1 }</td>
				<td>${f.id }</td>
				<td>${f.name }</td>
			</tr>
		</c:forEach>

		<tr>
			<td colspan="3" align="center"><button id="deletestudent"class="btn btn-default btn-xs">删除</button></td>

           <td colspan="3" align="center"><button id="updatestudent"class="btn btn-success btn-xs">修改</button></td>
		</tr>
	</table>
	<table align="center">
		<tr align="center">
			<td>没有您想要的分类？您可以点击这里<a href="<%=base %>AddClassfies.jsp">添加分类</a></td>
		</tr>
	</table>

	<p>
	<p>
	<center>
	<ul class="pagination">
		第${pb.pageNow }页/共${pb.pages }页 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <li><a
			href="<%=base %>FenLeiServlet?action=ShowClassfiespage&pageNow=1">首页</a></li>
		&nbsp;&nbsp;
		<c:if test="${pb.pageNow>1 }">
			<li><a href="<%=base %>FenLeiServlet?action=ShowClassfiespage&pageNow=${pb.pageNow-1 }">上一页</a></li>
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

				<c:when test="${pb.pageNow==i }">
		       
		      (${i })
		       
		       </c:when>
				<c:otherwise>

					<li><a href="<%=base %>FenLeiServlet?action=ShowClassfiespage&pageNow=${i }"><span>${i }</span></a></li>

				</c:otherwise>

			</c:choose>

		</c:forEach>
		&nbsp;
		<c:if test="${pb.pageNow<pb.pages }">
			<li><a href="<%=base %>FenLeiServlet?action=ShowClassfiespage&pageNow=${pb.pageNow+1 }">下一页</a></li>
		</c:if>
		&nbsp;&nbsp; <li><a	href="<%=base %>FenLeiServlet?action=ShowClassfiespage&pageNow=${pb.pages }">尾页</a></li>
	</center>
	<p>
	</ul>
</body>
</html>