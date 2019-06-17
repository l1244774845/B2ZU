<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<br/>
			<p align="center"><font size="7" face="幼圆">查看图书</font><br></p>
		<br/>
			<table id="t" align="center" width="1000" height="600" cellspacing="0" border="1">
	        <td colspan="2" valign="top">
			<table class="table table-striped table-hover table-bordered"
				width="800" height="350" align="center" cellspacing="0" border="1">
				<br>
				<div class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown"><font
						size="4">高级搜索</font><span class="caret"></span></a>
					<div class="col-md-1 "></div>
					<ul class="dropdown-menu dropdown-menu-left" role="menu">
						<li>
							<form action="BookServlet" class="form-horizontal">
								<!-- 隐藏域，用来传递action -->
								<input type="hidden" name="action" value="showBookByWhere">
								<div class="control-group">
									<br> <label class="col-md-4">选择分类： </label>
									<div class="col-sm-7 ">
										<select name="fname" id="fenleiList" class="form-control" >
											<option value="0">--请选择分类--</option>
											<c:forEach items="${list }" var="b">
									        <option>${b.fname}</option>
								            </c:forEach>
										</select><br>
									</div>
								</div>
								<div class="control-group  ">
									<label class="col-sm-4  control-label  ">书名:</label>
									<div class="controls col-sm-6 ">
										<input name="name" type="text" class="form-control" /><br>
									</div>
								</div>

								<div class="control-group   ">
									<label class="col-sm-4 control-label  "> 出版社:</label>
									<div class="controls  col-sm-6">
										<input name="chuban" type="text" class="form-control  input-sm" /><br>
									</div>
								</div>

								<div class="control-group   ">
									<label class="col-sm-4 control-label ">借书人:</label>
									<div class="controls  col-sm-6">
										<input name="jieshuren" type="text" class="form-control  input-sm" /><br>
									</div>
								</div>

								<div class="control-group    ">
									<label class="control-label col-sm-4 "> 状态:</label>
									<div class="controls  col-sm-6">
										<input name="zhuangtai" type="text" class="form-control  input-sm" /><br>
									</div>
								</div>

								<div class="control-group  ">
									<label class="col-sm-4 "></label>
									<div class="controls ss">
										<button type="submit" class="btn   btn-info ">
											<span class="glyphicon glyphicon-search"></span> 开始搜索
										</button>
									</div>
								</div>
							</form>
						</li>
					</ul>
				</div>
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

				<c:forEach items="${pb.beanList}" var="b" varStatus="s">
					<tr align="center">
						<td>${s.index+1 }</td>
						<td>${b.fname}</td>
						<td>${b.name }</td>
						<td>${b.price}</td>
						<td>${b.chuban}</td>
						<td>${b.zhuangtai }</td>
						<td>${b.jieshuren }</td>
						<td><input type="checkbox" name="ids" value="${b.id}" /></td>
						<td><a href="BookServlet?action=showOne&id=${b.id}" />修改</a></td>
					</tr>
				</c:forEach>
				<tr align="center">

					<td colspan="9"><button id="selectAll"
							class="btn btn-success btn-sm">全选</button>
						<button id="noSelectAll" class="btn btn-success btn-sm">全不选</button>
						<button id="fanxuan" class="btn btn-success btn-sm">反选</button>
						<button id="deleteBook" class="btn btn-success btn-sm">删除</button></td>
				</tr>
			</table>
			</td> <br> <br>
			<center>
				第${pb.pageNow}页/共${pb.pages}页 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
				<ul class="pagination">
					<li><a href="${pb.url}&pageNow=1">首页</a></li>
					&nbsp; &nbsp;
					<c:if test="${pb.pageNow>1 }">
						<li><a
							href="${pb.url}&pageNow=${pb.pageNow-1 }">上一页</a></li>
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
								<li><a
									href="${pb.url}&pageNow=${i }">${i }</a></li>
							</c:otherwise>
						</c:choose>

					</c:forEach>
					&nbsp;

					<c:if test="${pb.pageNow<pb.pages }">
						<a
							href="${pb.url}&pageNow=${pb.pageNow+1 }">下一页</a>
					</c:if>
					&nbsp; &nbsp;
					<li><a
						href="${pb.url}&pageNow=${pb.pages}">尾页</a></li>
				</ul>
			</center>
			<p>
			<table align="center">
				<tr align="center">
					<br>
					<td><font size="4" color="#4682B4">没有您想要的图书？您可以点击这里</font><a
						href="addBook.jsp" class="btn btn-primary btn-sm">添加分类</a></td>
				</tr>
			</table>
	</table>

</body>
</html>