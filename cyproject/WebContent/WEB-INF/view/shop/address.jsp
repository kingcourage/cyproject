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
<!-- start menu -->
<!-- slide -->
<%@include file="shopcommon/common.jsp"%>
</head>
<body>
	<form id="myform">
	<input type="text" class="form-control" name="userId" id="userId" placeholder="收货人">
  <div class="form-group">
    <label >收货人</label>
     <input type="text" name="receiverName"  id="receiverName" class="form-control"  placeholder="收货人">
  </div>
 <div class="form-group">
    <label >收货人电话号码</label>
    <input type="text" class="form-control"  name="receiverPhone" id="receiverPhone" placeholder="收货人">
  </div>
 <div class="form-group">
    <label >收货人手机号码</label>
    <input type="text" class="form-control" name="receiverMobile" id="receiverMobile" placeholder="手机">
  </div>
 <div class="form-group">
    <label >省</label>
    <input type="text" class="form-control"  name="receiverProvince" id="receiverProvince" placeholder="省">
  </div>
  <div class="form-group">
    <label >市</label>
    <input type="text" class="form-control"  name="receiverCity" id="receiverCity" placeholder="市">
  </div>
  <div class="form-group">
    <label >区</label>
    <input type="text" class="form-control"  name="receiverDistrict" id="receiverDistrict" placeholder="区">
  </div>
  <div class="form-group">
    <label >详细地址</label>
    <input type="text" class="form-control"  name="receiverAddress" id="receiverAddress" placeholder="详细地址">
  </div>
  <div class="form-group">
    <label >邮编</label>
    <input type="text" class="form-control" name="receiverZip" id="receiverZip" placeholder="邮编">
  </div>
  <button onclick="save()" class="btn btn-default">提交</button>
</form>
</body>
<script type="text/javascript">
	function save(){
		$.ajax({
			type:'post',
			url:'${pageContext.request.contextPath}/shipping/save',
			data:$('#myform').serialize(),
			dataType:'json',
			success:function(result){
				alert(result);
				alert(result.code);
				if(result.code==0){
					layui.use('layer', function(){
						  var layer = layui.layer;
						  layer.msg('添加成功',{icon: 1,time:3000});
						  layer.closeAll('iframe');
						}); 
				}
			}
		})
	}
</script>
</html>