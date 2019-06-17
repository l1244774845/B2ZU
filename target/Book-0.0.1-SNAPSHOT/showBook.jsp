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
<script type="text/javascript" src="js/ajax.js"></script>
<title>查看图书</title>
<style type="text/css">
#h1{
 width:800px;
}

</style>
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
		var deleteFenlei = document.getElementById("deleteBook");
		deleteFenlei.onclick = function() {
			var chek = document.getElementsByName("ids");
			alert(chek.length);
			var flag = false;
			for (var i = 0; i < chek.length; i++) {
				if (chek[i].checked == true) {
					flag = true;
					break;
				}
			}

			var str = "";
			for (var i = 0; i < chek.length; i++) {
				if (chek[i].checked == true) {
					str += chek[i].value + ",";
				}
			}

			str = str.slice(0, str.length - 1);
			alert(str);
			var queren = confirm("您确认要删除这些图书吗");
			if (queren == true) {
				location.href = "BookServlet?action=delete&ids=" + str;
			} else {
				location.reload();
			}
		}
	};
</script>
</head>
<body background='images/03.jpg'>
<br/>
<p align="center">
		<font size="7" face="幼圆">查看图书</font>
	</p>
	<div class="dropdown  col-md-offset-3"><a href="#" class="dropdown-toggle"
		data-toggle="dropdown"><font size="4" face="幼圆"><span class="glyphicon glyphicon-search">高级搜索</span></font><span class="caret"></span></a>
		<div class="col-md-1 "></div>
		<br>
		<ul class="dropdown-menu dropdown-menu-left" role="menu">
			<li>
				<form action="BookServlet" class="form-horizontal">
					<!-- 隐藏域，用来传递action -->
					<input type="hidden" name="action" value="showBookByWhere">
					<div class="control-group   ">
						<br> <label class="col-md-4">分类： </label>
						<div class="col-sm-7">
							<select name="fname" class="form-control  input-sm">
								<option value="0">--请选择分类--</option>
								<c:forEach items="${list }" var="b">
									<option>${b.fname}</option>
								</c:forEach>
							</select><br>
						</div>
					</div>
					<div class="control-group  ">
						<br><label class="col-sm-4 ">书名:</label>
						<div class="col-sm-7 ">
							<input name="name" type="text" class="form-control  input-sm" /><br>
						</div>
					</div>
					<div class="control-group   ">
						<br><label class="col-sm-4"> 出版社:</label>
						<div class="col-sm-7">
							<input name="chuban" type="text" class="form-control  input-sm" /><br>
						</div>
					</div>
					<div class="control-group   ">
						<label class="col-sm-4 ">借书人:</label>
						<div class="col-sm-7">
							<input name="jieshuren" type="text" class="form-control  input-sm" /><br>
						</div>
					</div>
					<div class="control-group">
						<label class="col-sm-4"> 状态:</label>
						<div class="col-sm-7">
							<input name="zhuangtai" type="text" class="form-control  input-sm" /><br>
						</div>
					</div>


					<div class="control-group  ">
                      <label class="col-sm-4 "></label>
						<div class="controls ss">
							<button type="submit" class="btn   btn-warning ">
								<span class="glyphicon glyphicon-search"></span> 开始搜索
							</button>
						</div>
					</div>
				</form>
			</li>
		</ul></div>
	<table class="table table-striped table-hover table-bordered"
				width="800" height="280" align="center" cellspacing="0" id="h1">
		<tr align="center">
			<td>图书编号</td>
			<td>分类名称</td>
			<td>图书名称</td>
			<td>图书价格</td>
			<td>图书出版社</td>
			<td>状态</td>
			<td>借书人</td>
			<td>删除</td>
			<td>修改</td>
		</tr>
		<c:forEach items="${pb.beanList }" var="b" varStatus="s">
			<tr align="center">
				<td>${s.index+1 }</td>
				<td>${b.fname}</td>
				<td>${b.name}</td>
				<td>${b.price}</td>
				<td>${b.chuban}</td>
				<td>${b.zhuangtai}</td>
				<td>${b.jieshuren}</td>
				<td><input type="checkbox" name="ids" value="${b.id}"></td>
				<td><a href="BookServlet?action=showOne&id=${b.id}">修改</a></td>
			</tr>
		</c:forEach>
	</table>
	<table  align="center">
	<tr align="center">

					<td colspan="9"><button id="selectAll"
							class="btn btn-success btn-sm">全选</button>
						<button id="noSelectAll" class="btn btn-success btn-sm">全不选</button>
						<button id="fanxuan" class="btn btn-success btn-sm">反选</button>
						<button id="deleteBook" class="btn btn-success btn-sm">删除</button></td>
				</tr>
			</table>
	<center>
		<ul class="pagination">
			<li><a href="${pb.url }&pageNow=1">首页</a></li>
             <c:if test="${pb.pageNow>1 }">
				<li><a
					href="${pb.url }&pageNow=${pb.pageNow-1 }">上一页</a></li>
			</c:if>
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
						<li><a href="${pb.url }&pageNow=${i }">[${i }]</a></li>
					</c:otherwise>
				</c:choose>


			</c:forEach>


            <c:if test="${pb.pageNow<pb.pages }">
				<li><a
					href="${pb.url }&pageNow=${pb.pageNow+1 }">下一页</a></li>
			</c:if>


            <li><a
				href="${pb.url }&pageNow=${pb.pages }">尾页</a></li>
		</ul>
	</center>
	<p align="center">第${pb.pageNow }页/共${pb.pages }页</p>


	<p align="center">
		<font size="4" color="#4682B4">没有您想要的图书？您可以点击这里</font><a
						href="addBook.jsp" class="btn btn-primary btn-sm">添加分类</a>
	</p>
</body>
</html>