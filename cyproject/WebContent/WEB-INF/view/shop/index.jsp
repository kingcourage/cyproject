<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Home</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Fashion Mania Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 
</script>
<!-- start menu -->
<script>
	$(document).ready(function() {
		$(".memenu").memenu();
	});
</script>
<!-- slide -->
<script
	src="${pageContext.request.contextPath}/public/cpts/js/responsiveslides.min.js"></script>
<script>
	$(function() {
		$("#slider").responsiveSlides({
			auto : true,
			speed : 500,
			namespace : "callbacks",
			pager : true,
		});
	});
	
</script>
</head>
<%@include file="shopcommon/common.jsp"%>
<body>
	<!--header-->
	<div class="header">
		<%@include file="shopcommon/header.jsp"%>
		<div class="container">
			<div class="head-top">
				<div class="col-md-2 number">
					<span><i class="glyphicon glyphicon-phone"></i>18186323208 </span>
				</div>
				<div class="col-md-8 h_menu4">
					<ul class="memenu skyblue">
						<li class="grid"><a
							href="${pageContext.request.contextPath}/">主页</a></li>
						<c:forEach items="${categorys}" var="category">
							<li class="grid"><a
								href="${pageContext.request.contextPath}/${category.id}">
									${category.name}</a></li>
						</c:forEach>
					</ul>
				</div>
				<div class="col-md-2 search" style="display: inline-block;">
					<form id="myForm" action="${pageContext.request.contextPath}/search" method="post">
						<input type="text" id="searchText" name="searchText" style="width: 140px"><a
							class="play-icon popup-with-zoom-anim" href="#" onclick="searchProduct()"><i
							class="glyphicon glyphicon-search"> </i> </a>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!--banner-->
	<div class="banner">
		<div class="col-sm-3 banner-mat">
			<img class="img-responsive"
				src="${pageContext.request.contextPath}/public/cpts/images/ba1.jpg"
				alt="">
		</div>
		<div class="col-sm-6 matter-banner">
			<div class="slider">
				<div class="callbacks_container">
					<ul class="rslides" id="slider">
						<li><img
							src="${pageContext.request.contextPath}/public/cpts/images/1.jpg"
							alt=""></li>
						<li><img
							src="${pageContext.request.contextPath}/public/cpts/images/2.jpg"
							alt=""></li>
						<li><img
							src="${pageContext.request.contextPath}/public/cpts/images/1.jpg"
							alt=""></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="col-sm-3 banner-mat">
			<img class="img-responsive"
				src="${pageContext.request.contextPath}/public/cpts/images/ba.jpg"
				alt="">
		</div>
		<div class="clearfix"></div>
	</div>
	<!--//banner-->
	<div class="copyrights">
		Collect from <a href="http://www.wcy1994.com/">cyshopping</a>
	</div>
	<!--content-->
	<div class="content">
		<div class="container">
			<div class="content-top">
				<h1>热销商品</h1>
				<div class="content-top1">
					<c:forEach var="product" items="${products}" varStatus="v">
						<div class="col-md-3 col-md2">
							<div class="col-md1 simpleCart_shelfItem">
								<a
									href="${pageContext.request.contextPath}/product/detail?id=${product.id}">
									<img class="img-responsive" style='width: 185px; height: 207px'
									src="${pageContext.request.contextPath}/${product.mainImage}"
									alt="" />
								</a>
								<h3>
									<a
										href="${pageContext.request.contextPath}/product/detail?id=${product.id}">${product.name}</a>
								</h3>
								<div class="price">
									<h5 class="item_price">${product.price}</h5>
									<a
										href="${pageContext.request.contextPath}/cart/add/${product.id}"
										class="item_add">Add To Cart</a>
									<div class="clearfix"></div>
								</div>
							</div>
						</div>
						<c:if test="${v.index>2 && v.index+1 %4 ==0}">
							<div class="clearfix"></div>
				</div>
				</c:if>
				</c:forEach>
			</div>
		</div>
		<!--//content-->
		<!--footer-->
		<%@include file="shopcommon/footer.jsp"%>
		<!--//footer-->
		<script type="text/javascript">
					function searchProduct(){
						$("#myForm").submit();
					}
					</script>
</body>
</html>