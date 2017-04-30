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
<script type="text/javascript">
	function delcart(id){
		$.ajax({
			type:'post',
			url:'${pageContext.request.contextPath}/cart/delete',
			data:{
				"id":id.
			},
			dataType:'json',
			success:function(result){
				if(result.code == 0){
					alert("删除成功");
				}
			}
		})
	}
</script>
<!-- slide -->
<%@include file="shopcommon/common.jsp"%>
</head>
<body>

<!--//header-->
<%@include file="shopcommon/header.jsp"%>
<!---->
<div class="container">
	<div class="check-out">
		<h1>购物车</h1>
			<table  class="table table-bordered">
		  <tr>
			<th>商品</th>
			<th>数量</th>
			<th>价格</th>
			<th>操作</th>
		  </tr>
		 <c:forEach var="cart" items="${cartModels}" varStatus="ca">
		 	 <tr>
		  <td class="ring-in"><a href="${pageContext.request.contextPath}/product/detail?id=${cart.productId}" class="at-in"><img src="${pageContext.request.contextPath}/${cart.productImage}" class="img-responsive" alt=""></a>
			<div class="sed">
				<h5>${cart.productName}</h5>
				<p> </p>
			</div>
			<div class="clearfix"> </div></td>
			<td class="check"><input type="text" value="1" onfocus="this.value='';" onblur="if (this.value == '') {this.value ='';}"></td>		
			<td>${cart.productPrice}</td>
			<td><button class="btn btn-info" onclick="delcart(${cart.id})">删除</button></td>
		  </tr>
		 </c:forEach>
	</table>
	<div class="clearfix"> </div>
    </div>
</div>
<!--footer-->
<%@include file="shopcommon/footer.jsp"%>
<!--//footer-->
</body>
