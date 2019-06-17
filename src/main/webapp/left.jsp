 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="jquery-ui.css"/>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>
<style>

 li{
    	
       list-style-type:none;
       
       padding-top:5px;
    }
    
    a{ 
    
    
      text-decoration: none;
    }
</style>
<script type="text/javascript">
    $(function(){
    	
    	$("#accordion").accordion();
    	
    });
    
   
</script>

</head>
<body bgcolor="#FAFAD2">
   <!-- Accordion -->
<h2 class="demoHeaders">菜单</h2>
<div id="accordion">
	<h3>分类管理</h3>
	<div>
	  <ul>
	    <li><a href="addFenlei.jsp" target="right"><span class="ui-icon ui-icon-plusthick"></span>添加分类</a></li>
	    <li><a href="fenleis/1" target="right"><span class="ui-icon ui-icon-folder-open"></span>查看分类</a></li>
	  </ul>
	</div>
   
	<h4>图书管理</h4>
	<div>
	  <ul>
	    <li><a href="addBook.jsp" target="right"><span class="ui-icon ui-icon-plusthick"></span>添加图书</a></li>
	    <li><a href="BookServlet?action=showBookByPage" target="right"><span class="ui-icon ui-icon-folder-open"></span>查看图书</a></li>	   
	  </ul>
	</div>
	    
	<h5>用户管理</h5>
	<div>
	  <ul>
	    <li><a href="addUser.jsp" target="right"><span class="ui-icon ui-icon-plusthick"></span>添加用户</a></li>
	    <li><a href="UserServlet?action=showUserByPage" target="right"><span class="ui-icon ui-icon-folder-open"></span>查看用户</a></li>	   
	  </ul>
	</div>
	    
	<h6>管理员信息管理</h6>
	<div>
	  <ul>
	    <li><a href="showAdmin.jsp" target="right"><span class="ui-icon ui-icon-plusthick"></span>查看管理员信息</a></li>
	    <li><a href="updatePassword.jsp" target="right"><span class="ui-icon ui-icon-folder-open"></span>修改密码</a></li>
	    <li><a href="AdminServlet?action=exit" target="_parent"><span class="ui-icon ui-icon-folder-star"></span>退出系统</a></li>	   	   
	  </ul>
	</div>	 

</body>
</html>