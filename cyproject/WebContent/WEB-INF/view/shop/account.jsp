<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>Account</title>
<!-- Custom Theme files -->
<!--theme-style-->
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Fashion Mania Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- start menu -->
<script>$(document).ready(function(){$(".memenu").memenu();});
</script>

<!-- slide -->
<%@include file="shopcommon/common.jsp"%>
</head>
<body>
<!--header-->
<%@include file="shopcommon/header.jsp"%>
<!--//header-->
<div class="account">
	<div class="container">
		<h1>Account</h1>
		<div class="account_grid">
			   <div class="col-md-6 login-right">
				<form id="myform">

					<span>用户名</span>
					<input type="text" class="form-control" id="username" name="username" style="width:540px;">  
				
					<span>密码</span>
					<input type="password"  class="form-control" id="password" name="password"> 
					<div class="word-in">
				  		<a class="forgot" href="#">忘记密码?</a>
				 		 <input type="button" class="btn btn-info" value="登录" onclick="login()">
				  	</div>
			    </form>
			   </div>	
			    <div class="col-md-6 login-left">
			  	 <h4>新建账户</h4>
				 <p>创建账户代表您将遵循本网站的用户协议</p>
				 <a class="acount-btn" href="${pageContext.request.contextPath}/register">创建账户</a>
			   </div>
			   <div class="clearfix"> </div>
			 </div>
	</div>
</div>

<!--footer-->
<%@include file="shopcommon/footer.jsp"%>
<!--//footer-->
<script type="text/javascript">
	function login(){
		$.ajax({
			type:'post',
			url:'${pageContext.request.contextPath}/user/login',
			data:$("#myform").serialize(),
			dataType:'json',
			success:function(result){
				if(result.msg=='success'){
					layui.use('layer', function(){
						  var layer = layui.layer;
						  layer.msg('登录成功，正在跳转中。。。',{icon: 1,time:1000});
						}); 
					setTimeout("window.location.href='${pageContext.request.contextPath}/'",1000);	  
				}else{
					layui.use('layer', function(){
						  var layer = layui.layer;
						  layer.msg('用户名或密码错误',{icon: 5,time:1000});
						}); 
				}
			}
		})
	}
</script>
</body>
