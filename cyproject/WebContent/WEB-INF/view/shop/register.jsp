<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>Register</title>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<!-- Custom Theme files -->
<!--theme-style-->
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Fashion Mania Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- start menu -->
<script>$(document).ready(function(){$(".memenu").memenu();});</script>
<!-- slide -->
<%@include file="shopcommon/common.jsp"%>
<!--layer -->
</head>
<body>
<!--header-->
<%@include file="shopcommon/header.jsp"%>
<!--//header-->
<div class="container">
	<div class="register">
		<h1>Register</h1>
		  	  <form id="myform"> 
				 <div class="col-md-6  register-top-grid">
					
					<div class="mation">
						<span>用户名</span>
						<input type="text" name="username"> 
						 <span>邮箱</span>
						 <input type="text" name="enail"> 
						  <span>手机号码</span>
						 <input type="text" name="phone"> 
					</div>
					 <div class="clearfix"> </div>
					   <a class="news-letter" href="#">
						 <label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i> </i>注册</label>
					   </a>
					 </div>
				     <div class=" col-md-6 register-bottom-grid">
						   
							<div class="mation">
								<span>密码</span>
								<input type="text" name="password">
								<span>确认密码</span>
								<input type="text" name="repassword">
							</div>
					 </div>
					 <div class="clearfix"> </div>
				</form>
				<div class="register-but">
				   <form>
					   <input type="button" class="btn btn-info" value="提交" onclick="resigter()">
					   <div class="clearfix"> </div>
				   </form>
				</div>
		   </div>
</div>
<!--footer-->
<%@include file="shopcommon/footer.jsp"%>
<!--//footer-->
<script type="text/javascript">
function resigter(){
	$.ajax({
		type:'post',
		url:'${pageContext.request.contextPath}/user/saveUser',
		data:$('#myform').serialize(),
		dataType:'json',
		success:function(result){
			if(result.msg=='success'){
				layui.use('layer', function(){
					  var layer = layui.layer;
					  layer.msg('注册成功,3秒后自动跳转到登录页',{icon: 1,time:3000});
					}); 
				setTimeout("window.location.href='${pageContext.request.contextPath}/login'",3000);	  
			}
		}
	})
}
</script>
</body>
</html>