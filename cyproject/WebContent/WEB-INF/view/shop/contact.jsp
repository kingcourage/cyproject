<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>Contact</title>
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
</head>
<body>
<!--header-->
<%@include file="shopcommon/header.jsp"%>
<!--//header-->
<div class="contact">
			<div class="container">
				<h1>Contact</h1>
				
				<div class="contact-grids">
					<div class="contact-form">
							<form>
								<div class="contact-bottom">
									<div class="col-md-4 in-contact">
										<span>Name</span>
										<input type="text" >
									</div>
									<div class="col-md-4 in-contact">
										<span>Email</span>
										<input type="text" >
									</div>
									<div class="col-md-4 in-contact">
										<span>Phonenumber</span>
										<input type="text">
									</div>
									<div class="clearfix"> </div>
								</div>
							
								<div class="contact-bottom-top">
									<span>Message</span>
									<textarea > </textarea>								
									</div>
								<input type="submit" value="Send">
							</form>
						</div>
				<div class="address">
					<div class=" address-more">
						<h2>Address</h2>
						<div class="col-md-4 address-grid">
							<i class="glyphicon glyphicon-map-marker"></i>
							<div class="address1">
								<p>Lorem ipsum dolor</p>
								<p>TL 19034-88974</p>
							</div>
							<div class="clearfix"> </div>
						</div>
						<div class="col-md-4 address-grid ">
							<i class="glyphicon glyphicon-phone"></i>
							<div class="address1">
								<p>+885699655</p>
							</div>
							<div class="clearfix"> </div>
						</div>
						<div class="col-md-4 address-grid ">
							<i class="glyphicon glyphicon-envelope"></i>
							<div class="address1">
								<p><a href="mailto:@example.com"> @example.com</a></p>
							</div>
							<div class="clearfix"> </div>
						</div>
						<div class="clearfix"> </div>
					</div>
				</div>
			</div>
		</div>
	</div>
<!--//content-->

<!--footer-->
<%@include file="shopcommon/footer.jsp"%>
<!--//footer-->
</body>
</html>