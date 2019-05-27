<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body background="./imgs">
	<center>
		<p>
			<font color="black" size="6">修改图书</font>
		</p>
	</center>
	<hr width="700px">
	<br>

	<center>
		<form action="http://localhost:8080/ssm_crud/book" method="post">

			<input type="hidden" name="_method" value="PUT" /> <input
				type="hidden" name="bid" value="${b.bid }" />

			<table width="600px" height="400px" align="center" border="1px"
				bordercolor="silver" cellspacing="0";>
				<tr align="center">
					<td>请选择分类:</td>
					<td><select name="fId" class="form-control">
							<c:forEach items="${slist }" var="f">
								<c:if test="${f.fId == b.fId}">
									<option value="${f.fId }" selected="selected">${f.fname }</option>
								</c:if>
								<c:if test="${f.fId != b.fId}">
									<option value="${f.fId }">${f.fname }</option>
								</c:if>
							</c:forEach>
					</select></td>
				</tr>
				<tr align="center">
					<td>图&nbsp;书&nbsp;名&nbsp;称:</td>
					<td><input type="text" name="bname" value="${b.bname }"></td>
				</tr>
				<tr align="center">
					<td>图&nbsp;书&nbsp;价&nbsp;格:</td>
					<td><input type="text" name="price" value="${b.price }"></td>
				</tr>
				<tr align="center">
					<td>出&nbsp;&nbsp;&nbsp;版&nbsp;&nbsp;&nbsp;社:</td>
					<td><input type="text" name="chubanshe"
						value="${b.chubanshe }"></td>
				</tr>
				<tr align="center">
					<td>状&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;态:</td>
					<td><c:if test="${b.zhuangtai == '借出' }">
							<input type="radio" name="zhuangtai" value="未借出" />未借出&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
								type="radio" name="zhuangtai" value="借出" checked />借出
					</c:if> <c:if test="${b.zhuangtai == '未借出' }">
							<input type="radio" name="zhuangtai" value="未借出" checked />未借出&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
								type="radio" name="zhuangtai" value="借出" />借出
					</c:if></td>
				</tr>
				<tr align="center">
					<td>借&nbsp;&nbsp;&nbsp;书&nbsp;&nbsp;&nbsp;人:</td>
					<td><input type="text" name="jieshuren"
						value="${b.jieshuren }"></td>
				</tr>
				<tr align="center">
					<td colspan="2"><input type="submit" value="修改">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
						type="reset" value="重置"></td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>