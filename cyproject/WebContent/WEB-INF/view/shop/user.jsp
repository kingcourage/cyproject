<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>个人信息</title>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<!-- Custom Theme files -->
<!--theme-style-->
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Fashion Mania Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- slide -->
<%@include file="shopcommon/common.jsp"%>
</head>
<body>
<!--header-->
<%@include file="shopcommon/header.jsp"%>
<!--//header-->
<div class="contact">
			<div class="container">
			<div class="row">
				<div class="col-md-6"> <h1>个人信息</h1></div>
				<div class="col-md-6"> <a href="${pageContext.request.contextPath}/order/orderList"><h1>订单信息</h1></a></div>
			</div>
				
			<input type="hidden" name="userId" value="${user.id}">
			<div class="contact-grids">
				<div class="address">
					<div class=" address-more">
						<div class="col-md-4 address-grid">
							<i class="glyphicon glyphicon-user"></i>
							<div class="address1">
								<p>${user.username}</p>
							</div>
							<div class="clearfix"></div>
						</div>
						<div class="col-md-4 address-grid ">
							<i class="glyphicon glyphicon-phone"></i>
							<div class="address1">
								<p>${user.phone}</p>
							</div>
							<div class="clearfix"></div>
						</div>
						<div class="col-md-4 address-grid ">
							<i class="glyphicon glyphicon-envelope"></i>
							<div class="address1">
								<p>
									${user.email}
								</p>
							</div>
							<div class="clearfix"></div>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
			
			
				<div class="contact-grids">
				<div class="address">
					<div class=" address-more">
						<div class="col-md-12 address-grid ">
							<i class="	glyphicon glyphicon-map-marker"></i>
							<div class="address1">
								<p>收货地址  <button class="btn btn-info" onclick="add()">新增收货地址</button></p>
								<table class="table table-bordered">
									<tr>
										<th>收货人</th>
										<th>收货人电话号码</th>
										<th>收货人手机号</th>
										<th>省</th>
										<th>市</th>
										<th>区</th>
										<th>详细地址</th>
										<th>邮编</th>
										<th>操作</th>
									</tr>
									<c:forEach var="shipping" items="${shippings}" varStatus="status">
									<tr>
										<td>${shipping.receiverName}</td>
										<td>${shipping.receiverPhone}</td>
										<td>${shipping.receiverMobile }</td>
										<td>${shipping.receiverProvince }</td>
										<td>${shipping.receiverCity}</td>
										<td>${shipping.receiverDistrict}</td>
										<td>${shipping.receiverAddress}</td>
										<td>${shipping.receiverZip}</td>
										<td><button onclick='del(${shipping.id})'>删除</button></td>
									</tr>
									</c:forEach>
								</table>
							</div>
							<div class="clearfix"></div>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
			
		</div>
	</div>
<!--//content-->

<!--footer-->
<%@include file="shopcommon/footer.jsp"%>
<!--//footer-->
<script type="text/javascript">
	var userId = $("#userId").val();
	function add(){
		layui.use('layer', function(){
			  var layer = layui.layer;
			  layer.open({
				  type: 2,
				  content: '${pageContext.request.contextPath}/shipping/add',
				  area: ['700px', '500px'],
				  offset: '100px',
				  success: function(layero, index){
				    var body = layer.getChildFrame('body', index);
				    var iframeWin = window[layero.find('iframe')[0]['name']]; //得到iframe页的窗口对象，执行iframe页的方法：iframeWin.method();
				    console.log(body.html()) //得到iframe页的body内容
				    body.find('#userId').val(userId);
				  }
				});  
			}); 
	}
	
	function del(id){
		$.ajax({
			type:'post',
			url:'${pageContext.request.contextPath}/shipping/delete',
			data:{
				"id":id,
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
</body>
</html>