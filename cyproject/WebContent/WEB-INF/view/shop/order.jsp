<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>Checkout</title>
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

<!--//header-->
<%@include file="shopcommon/header.jsp"%>
<!---->
<div class="container">
<div class="contact">
			<div class="container">
			<div class="row">
				<div class="col-md-6"> <a href="${pageContext.request.contextPath}/user/shop/index"><h1>个人信息</h1></a></div>
				<div class="col-md-6"> <h1>订单信息</h1></div>
			</div>
			</div>
			</div>
	<div class="check-out">
		<h1>订单列表</h1>
		<c:forEach var="order" items="${orders}" varStatus="o">
			<table  class="table table-bordered">
			<tr>订单编号：${order.orderNo}&nbsp;&nbsp;订单金额：${order.payment}</tr>
		  <tr>
			<th>商品</th>
			<th>数量</th>		
			<th>价格</th>
			<th>总价</th>
		  </tr>
		 <c:forEach var="orderItem" items="${order.orderItemList}" varStatus="os">
		 	 <tr>
		  <td class="ring-in"><a href="${pageContext.request.contextPath}/product/detail?id=${orderItem.productId}" class="at-in"><img src="${pageContext.request.contextPath}/${orderItem.productImage}" class="img-responsive" alt=""></a>
			<div class="sed">
				<h5>${orderItem.productName}</h5>
				<p> </p>
			</div>
			<div class="clearfix"> </div></td>
			<td class="check"><input type="text" value="1" onfocus="this.value='';" onblur="if (this.value == '') {this.value ='';}"></td>		
			<td>${orderItem.currentUnitPrice}</td>
			<td>$150.00</td>
		  </tr>
		 </c:forEach>
	</table>
	<a href="${pageContext.request.contextPath}/order/pay/${order.orderNo}" class=" to-buy">前往支付</a>
	<div class="clearfix"> </div>
		</c:forEach>
    </div>
</div>
<!--footer-->
<%@include file="shopcommon/footer.jsp"%>
<!--//footer-->
</body>
