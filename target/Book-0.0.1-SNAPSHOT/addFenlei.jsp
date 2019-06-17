<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 1.要使用Bootstrap的话，必须是html5文档-->
<meta charset="UTF-8">
<!-- 2.移动设备优先 -->
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!-- 3.导入核心的CSS文件 -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrapValidator.css" />
<!-- 4.需要引入jQuery文件 -->
<script type="text/javascript" src="bootstrap/js/jQuery.js"></script>
<!-- 5.引入Bootstrap的核心JS文件 -->
<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrapValidator.js"></script>
<title>添加分类</title>
<script type="text/javascript">


$(function(){
	
	 $(".form-horizontal").bootstrapValidator({
		  
		  feedbackIcons:{
			  
			  valid : "glyphicon glyphicon-ok",
			  invalid : "glyphicon glyphicon-remove",
			  validating : "glyphicon glyphicon-refresh"
			  
		  },
		  
		 fields:{
		  
	    fname:{
			  
			  validators :{
				  
				   notEmpty : {


						message : '分类名不能为空'


					},


					 regexp : {


						regexp : /^[\u4e00-\u9fa5]{1,15}$/,
						message : '分类名必须是1-15位的汉字'

					},    
				  
					remote:{
					 
						message:'该分类已被添加，请重新输入',
					    url:"queryone",
					
					    type:'post',
					  
					    data:function(validator){
						  
						  return{
							  
							  fname:$("input[name=fname]").val()
						  }
					  }
				  }
				 
			  }
		  }
	  }
});
	 
	 
}); 


</script>
</head>
<body background="images/03.jpg">
	<div class="container">
		<h1 align="center">图书管理系统----添加分类页面</h1>

         <hr width="1000px">

		<form action="fenlei"  class="form-horizontal" method="post">

			

			<!-- <div class="form-group">
				<label for="fid" class="col-sm-4 control-label">分类编号</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="fid"
						name="fid">
				</div>
			</div> -->

			<div class="form-group">
				<label for="fname" class="col-sm-4 control-label">分类名称</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="fname" name="fname">
				</div>
			</div>
           
			

			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-4">
					<button type="submit" class="btn btn-primary">添加分类</button>
					<button type="reset" class="btn btn-primary">重置</button>
				</div>
			</div>

		</form>

	</div>
</body>
</html>