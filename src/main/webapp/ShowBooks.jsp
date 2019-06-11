<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>查看图书</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>

<!-- <script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="js/ajax.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="icont/iconfont.css">
<script type="text/javascript" src="bootstrap/js/jquery.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script> -->

<script type="text/javascript">
	window.onload = function() {

		var selectAll = document.getElementById("selectAll");

		selectAll.onclick = function() {

			var check = document.getElementsByName("ids");

			for (var i = 0; i < check.length; i++) {

				check[i].checked = true;
			}
		};

		var unselectAll = document.getElementById("unselectAll");

		unselectAll.onclick = function() {

			var check = document.getElementsByName("ids");

			for (var i = 0; i < check.length; i++) {

				check[i].checked = false;
			}

		};

		var fanxuan = document.getElementById("fanxuan");

		fanxuan.onclick = function() {

			var check = document.getElementsByName("ids");

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

			var check = document.getElementsByName("ids");

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

				location.href = "http://localhost:8080/ssm_crud/books/1";

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
			var queren = confirm("您确定要删除这些图书吗？");

			if (queren == true) {

				var $url = "http://localhost:8080/ssm_crud/book/" + str;

				//alert($url);

				$("#deleteForm").attr("action", $url);

				//提交表单

				$("#deleteForm").submit();

				return false;

			} else {

				location.reload();
			}
		};

		//导出全部

		var outAll = document.getElementById("outAll");

		outAll.onclick = function() {

			var flage = confirm("你确定导出所有分类吗?");

			if (flage) {

				window.location.href = "http://localhost:8080/ssm_crud/outAll";

			}

		};

		//导出选择

		var outSelect = document.getElementById("outSelect");

		outSelect.onclick = function() {

			var chek = document.getElementsByName("ids");

			var flag = false;

			for (var i = 0; i < chek.length; i++) {

				if (chek[i].checked == true) {

					flag = true;

					break;
				}
			}

			if (flag == false) {

				alert("请至少选一项");

				return;

			} else {

				var str = "";

				for (var i = 0; i < chek.length; i++) {

					if (chek[i].checked == true) {

						str += chek[i].value + ",";

					}
				}
				str = str.slice(0, str.length - 1);

				var flage = confirm("你确定导出选中的分类信息？");

				if (flage) {//确定

					window.location.href = "http://localhost:8080/ssm_crud/outSelect/"
							+ str;

				}
			}

		};

		ajax({

			method : "POST",

			url : "FenLeiServlet",

			params : "action=updateShowClassfies",

			type : "xml",

			success : function(data) {

				var select = document.getElementById("fenleiList");

				alert(typeof data);

				var names = data.getElementsByTagName("name");

				for (var i = 0; i < names.length; i++) {

					var name = names[i];

					var opt = document.createElement("option");

					var value;

					if (window.addEventListener) {

						value = name.textContent;
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
<body background="./imgs">
	</br>
	<div class="dropdown">
		<a href="#" class="dropdown-toggle" data-toggle="dropdown"><font
			size="4" face="幼圆"><b>高级搜索</b></font><span class="caret"></span></a>
		<div class="col-md-1 "></div>
		<br>
		<ul class="dropdown-menu dropdown-menu-left" role="menu">
			<li>
				<form action="http://localhost:8080/ssm_crud/bookByWhere/1"
					class="form-horizontal">
					<!-- 隐藏域，用来传递action -->
					<input type="hidden" name="action" value="">
					<div class="control-group   ">
						<br> <label class="col-md-4">分类： </label>
						<div class="col-sm-7 ">
							<select name="fId" class="form-control  input-sm">
								<option value="0">--请选择分类--</option>
								<c:forEach items="${flist }" var="f">
									<option value="${f.fId }">${f.fname }</option>
								</c:forEach>
							</select><br>
						</div>
					</div>
					<div class="control-group  ">
						<br> <label class="col-sm-4 ">书名:</label>
						<div class="col-sm-7 ">
							<input name="bname" type="text" class="form-control  input-sm" /><br>
						</div>
					</div>
					<div class="control-group    ">
						<label class="col-sm-4">价格:</label>
						<div class="col-sm-7">
							<input name="price" type="text" class="form-control  input-sm" /><br>
						</div>
					</div>
					<div class="control-group   ">
						<br> <label class="col-sm-4"> 出版社:</label>
						<div class="col-sm-7">
							<input name="chubanshe" type="text"
								class="form-control  input-sm" /><br>
						</div>
					</div>
					<div class="control-group    ">
						<label class="col-sm-4"> 状态:</label>
						<div class="col-sm-7">
							<input name="zhuangtai" type="text"
								class="form-control  input-sm" /><br>
						</div>
					</div>
					<div class="control-group   ">
						<label class="col-sm-4 ">借书人:</label>
						<div class="col-sm-7">
							<input name="jieshuren" type="text"
								class="form-control  input-sm" /><br>
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
		</ul>
	</div>

	<center>
		<p>
			<font color="black" size="6">查看图书</font>
		</p>
	</center>
	<hr width="1000px">
	<div class="container">
		<table class="table table-bordered table-hover table-striped">
			<tr align="center">
				<td>选择</td>
				<td>编号</td>
				<td>分类名称</td>
				<td>图书名称</td>
				<td>图书价格</td>
				<td>图书出版社</td>
				<td>状态</td>
				<td>借书人</td>
				<td>修改</td>
			</tr>
			<c:forEach items="${pb.beanList }" var="q" varStatus="s">
				<tr align="center">
					<td><input type="checkbox" name="ids" value="${q.bid }" /></td>
					<td>${s.index+1 }</td>
					<td>${q.fenleis.fname }</td>
					<td>${q.bname }</td>
					<td>${q.price }</td>
					<td>${q.chubanshe}</td>
					<td>${q.zhuangtai }</td>
					<td>${q.jieshuren }</td>
					<td><a href="http://localhost:8080/ssm_crud/book/${q.bid }"
						target="right" class="btn btn-primary">修改</a></td>
				</tr>
			</c:forEach>
		</table>

		<!-- 准备一个隐藏表单 -->
		<form action="" method="post" id="deleteForm">
			<input type="hidden" name="_method" value="DELETE" />
		</form>
	</div>

	<center>
		<table>
			<tr align="center">
				<td colspan="4"><button id="selectAll" class="btn btn-info">全选</button>&nbsp;&nbsp;
					<button id="unselectAll" class="btn btn-info">全不选</button>&nbsp;&nbsp;
					<button id="fanxuan" class="btn btn-info">反选</button>&nbsp;&nbsp;
					<button id="deleteStudent" class="btn btn-info">删除</button>&nbsp;&nbsp;
					<button id="outSelect" class="btn btn-info">导出所选</button>&nbsp;&nbsp;
					<button id="outAll" class="btn btn-info">导出全部</button></td>
			</tr>
		</table>
		</br>
	</center>
	<p>
		<!-- 分页 -->
	<center>
		<p>第${pb.pageNow }页/共${pb.pages }页</p>
		<ul class="pagination">
			<li><a href="1?${pb.url }">首页</a></li>
			<%-- <li><c:if test="${pb.pageNow>1 }">
				<a href="${pb.pageNow-1 }">上一页</a>
			</c:if></li> --%>

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
						<li><span><a href="${i }?${pb.url }">${i }</a></span></li>
					</c:otherwise>
				</c:choose>

			</c:forEach>

			<li><span><a href="${pb.pages }?${pb.url }">尾页</a></span></li>

		</ul>

	</center>
	<p>
	<table align="center">
		<tr align="center">
			<td>没有您需要的图书？您可以点击这里<a
				href="http://localhost:8080/ssm_crud/addBooksUI">添加图书</a></td>
		</tr>
	</table>
</body>
</html>