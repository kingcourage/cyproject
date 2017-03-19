<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>wcy Admin - Login</title>
<meta name="description" content="">
<meta name="author" content="templatemo">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/public/js/jquery-1.11.2.min.js"></script>
<!-- jQuery -->
<link
	href="${pageContext.request.contextPath}/public/css/font-awesome.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/public/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/public/css/templatemo-style.css"
	rel="stylesheet">
</head>
<body class="light-gray-bg">
	<div class="templatemo-content-widget templatemo-login-widget white-bg">
		<header class="text-center">
			<div class="square"></div>
			<h1>cy-admin</h1>
		</header>
		<form action="${pageContext.request.contextPath}/admin/login"
			id="theform" class="templatemo-login-form">
			<div class="form-group">
				<div class="input-group">
					<div class="input-group-addon">
						<i class="fa fa-user fa-fw"></i>
					</div>
					<input type="text" name="username" class="form-control"
						placeholder="js@dashboard.com">
				</div>
			</div>
			<div class="form-group">
				<div class="input-group">
					<div class="input-group-addon">
						<i class="fa fa-key fa-fw"></i>
					</div>
					<input type="password" name="password" class="form-control"
						placeholder="******">
				</div>
			</div>
			<div class="form-group">
				<div class="checkbox squaredTwo">
					<input type="checkbox" id="c1" name="cc" /> <label for="c1"><span></span>Remember
						me</label>
				</div>
			</div>
			<div class="form-group">
				<button type="button" onclick="register()"
					class="templatemo-blue-button width-100">Login</button>
			</div>
		</form>
	</div>
	<div
		class="templatemo-content-widget templatemo-login-widget templatemo-register-widget white-bg">
		<p>
			Not a registered user yet? <strong><a
				href="${pageContext.request.contextPath}/register.jsp"
				target="_black" class="blue-text">Sign up now!</a></strong>
		</p>
	</div>
	<script type="text/javascript">
		function register() {
			$
					.ajax({
						type : "post",
						url : "${pageContext.request.contextPath}/admin/login",
						data : $("#theform").serialize(),
						dataType : "json",
						success : function(result) {
							window.location.href = "${pageContext.request.contextPath}/admin/index"
						}

					});
		}
	</script>
</body>
</html>