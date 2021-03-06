<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@include file="../common/common.jsp"%>
</head>
<body>
	<div class="easyui-layout" style="width: 100%; height: 700px;">
		<div region="west" split="true" title="菜单" style="width: 220px;">
			<div class="easyui-accordion" style="width: 200px; height:100%;">
				<div title="商品管理" iconCls="icon-ok" style="overflow: auto; padding: 10px;">
					<ul>
						<li><a href="#" onclick="addTab('商品列表','${pageContext.request.contextPath}/product/system/productList')">商品列表</a></li>
						<li><a href="#" onclick="addTab('商品分类管理','${pageContext.request.contextPath}/category/index')">商品分类管理</a></li>
					</ul>
				</div>

				<div title="分类管理" iconCls="icon-reload" selected="true" style="padding: 10px;">
					<ul>
						<li><a href="#" onclick="addTab('商品分类','${pageContext.request.contextPath}/category/category')">商品分类</a></li>
					</ul>
				</div>
				
				<div title="订单管理" iconCls="icon-reload"  style="padding: 10px;">
					<ul>
						<li><a href="#" onclick="addTab('订单管理','${pageContext.request.contextPath}/order/system/index')">订单管理</a></li>
					</ul>
				</div>
				
				<div title="用户管理" iconCls="icon-reload"  style="padding: 10px;">
					<ul>
						<li><a href="#" onclick="addTab('用户管理','${pageContext.request.contextPath}/user/system/index')">用户管理</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div id="content" region="center" title="mmall后台管理系统" style="padding: 5px;">
				<div id="tt" class="easyui-tabs" style="width: 100%; height: 100%;">
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	function addTab(title, url) {
		if ($('#tt').tabs('exists', title)) {
			$('#tt').tabs('select', title);
		} else {
			var content = '<iframe scrolling="auto" frameborder="0"  src="'
					+ url + '" style="width:100%;height:100%;"></iframe>';
			$('#tt').tabs('add', {
				title : title,
				content : content,
				closable : true
			});
		}
	}
</script>
</html>