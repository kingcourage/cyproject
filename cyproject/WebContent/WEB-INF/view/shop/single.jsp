<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>Single</title>
<!-- Custom Theme files -->
<!--theme-style-->
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Fashion Mania Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript">
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 

</script>
<!---->
<%@include file="shopcommon/common.jsp"%>
</head>
<body>
	<!--header-->
	<%@include file="shopcommon/header.jsp"%>
	<!---->
	<div class="single">

		<div class="container">
			<div class="col-md-9">
				<div class="col-md-5 grid">
					<div class="flexslider">
						<ul class="slides">
							<li data-thumb="images/si.jpg">
								<div class="thumb-image">
									<img src="${pageContext.request.contextPath}/${product.mainImage}" data-imagezoom="true" class="img-responsive">
								</div>
							</li>
						</ul>
					</div>
				</div>
				<input type="hidden" name="productId" id="productId" value="${product.id}">
				<div class="col-md-7 single-top-in">
					<div class="single-para simpleCart_shelfItem">
						<h1>${product.name}</h1>
						<p>${product.subtitle}</p>
						<div class="star-on">
							<ul>
								<li><a href="#"><i class="glyphicon glyphicon-star"> </i></a></li>
								<li><a href="#"><i class="glyphicon glyphicon-star"> </i></a></li>
								<li><a href="#"><i class="glyphicon glyphicon-star"> </i></a></li>
								<li><a href="#"><i class="glyphicon glyphicon-star"> </i></a></li>
								<li><a href="#"><i class="glyphicon glyphicon-star"> </i></a></li>
							</ul>
							<div class="review">
								<a href="#"> 3 reviews </a>/ <a href="#"> Write a review</a>
							</div>
							<div class="clearfix"></div>
						</div>

						<label class="add-to item_price">${product.price}</label> <a href="#" onclick="buy()" class="cart item_add">购买</a>
						<a href="${pageContext.request.contextPath}/cart/add/${product.id}"  class="cart item_add">加入购物车</a>
					</div>
				</div>
				<!----->
			</div>
		</div>
		<!--footer-->
		<%@include file="shopcommon/footer.jsp"%>
		<!-- slide -->
		<script src="${pageContext.request.contextPath}/public/cpts/js/imagezoom.js"></script>
		<!-- start menu -->
		<link href="${pageContext.request.contextPath}/public/cpts/css/memenu.css" rel="stylesheet" type="text/css" media="all" />
		<script type="text/javascript" src="js/memenu.js"></script>
		<script>
			$(document).ready(function() {
				$(".memenu").memenu();
			});
		</script>
		<script src="${pageContext.request.contextPath}/public/cpts/js/simpleCart.min.js">
			
		</script>
		<!--initiate accordion-->
		<script type="text/javascript">
			$(function() {
				var menu_ul = $('.menu-drop > li > ul'), menu_a = $('.menu-drop > li > a');
				menu_ul.hide();
				menu_a.click(function(e) {
					e.preventDefault();
					if (!$(this).hasClass('active')) {
						menu_a.removeClass('active');
						menu_ul.filter(':visible').slideUp('normal');
						$(this).addClass('active').next().stop(true, true)
								.slideDown('normal');
					} else {
						$(this).removeClass('active');
						$(this).next().stop(true, true).slideUp('normal');
					}
				});

			});
		</script>
		<!-- FlexSlider -->
		<script defer src="${pageContext.request.contextPath}/public/cpts/js/jquery.flexslider.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/public/cpts/css/flexslider.css" type="text/css" media="screen" />

		<script>
			// Can also be used with $(document).ready()
			$(window).load(function() {
				$('.flexslider').flexslider({
					animation : "slide",
					controlNav : "thumbnails"
				});
			});
		</script>
		<!---pop-up-box---->
		<link href="${pageContext.request.contextPath}/public/cpts/css/popuo-box.css" rel="stylesheet" type="text/css" media="all" />
		<script src="${pageContext.request.contextPath}/public/cpts/js/jquery.magnific-popup.js" type="text/javascript"></script>
		<!---//pop-up-box---->
		<script>
			$(document).ready(function() {
				$('.popup-with-zoom-anim').magnificPopup({
					type : 'inline',
					fixedContentPos : false,
					fixedBgPos : true,
					overflowY : 'auto',
					closeBtnInside : true,
					preloader : false,
					midClick : true,
					removalDelay : 300,
					mainClass : 'my-mfp-zoom-in'
				});

			});
			
			
			function buy(){
				$.ajax({
					type:'post',
					url:'${pageContext.request.contextPath}/order/addOrder/${product.id}',
					data:{},
					dataType:'json',
					success:function(result){
						if(result.code==0){
							layui.use('layer', function(){
							  var layer = layui.layer;
						 	 layer.msg('下单成功,正在跳转到订单页',{icon: 1,time:1000});
							}); 
						}	
					setTimeout("window.location.href='${pageContext.request.contextPath}/order/orderList'",3000);	  
					}
				})
			}
		</script>
</body>
</html>