<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单列表</title>
<%@include file="../common/common.jsp"%>
</head>
<body>
	<table id="dg" title="订单列表" class="easyui-datagrid" url="${pageContext.request.contextPath}/order/system/getAllOrder" style="width: 100%; height: 500px;" toolbar="#toolbar" rownumbers="true"
		fitColumns="true" singleSelect="true">
		<thead>
			<tr>
				<th field="orderNo" width="50">订单编号</th>
				<th field="userId" width="50">用户编号</th>
				<th field="payment" width="50">支付金额</th>
				<th field="status" width="50">订单状态</th>
			</tr>
		</thead>
	</table>
	<div id="toolbar">
		<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newProduct()">新建商品</a> <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editProduct()">编辑商品</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyProduct()">删除商品</a>
	</div>
	<script type="text/javascript">
		function newProduct() {
			$('#dlg').dialog('open').dialog('setTitle', 'New User');
			$('#fm').form('clear');
			url = '${pageContext.request.contextPath}/product/system/saveProduct';
		}

		function editProduct() {
			var row = $('#dg').datagrid('getSelected');
			if (row) {
				$('#dlg').dialog('open').dialog('setTitle', 'Edit User');
				$('#fm').form('load', row);
				url = '${pageContext.request.contextPath}/product/system/editProduct?id='
						+ row.id;
			}
		}

		function saveProduct() {
			$("#categoryId2").val($("#categoryId1").val());
			$('#fm').form('submit', {
				url : url,
				onSubmit : function() {
					return $(this).form('validate');
				},
				success : function(result) {
					var result = eval('(' + result + ')');
					if (result.code != 0) {
						$.messager.show({
							title : 'Error',
							msg : result.errorMsg
						});
					} else {
						$('#dlg').dialog('close'); // close the dialog
						$('#dg').datagrid('reload'); // reload the user data
					}
				}
			});
		}

		function destroyProduct() {
			var row = $('#dg').datagrid('getSelected');
			if (row) {
				$.messager
						.confirm(
								'Confirm',
								'Are you sure you want to destroy this user?',
								function(r) {
									if (r) {
										$
												.post(
														'${pageContext.request.contextPath}/product/system/deleteProduct',
														{
															id : row.id
														},
														function(result) {
															if (result.code == 0) {
																$('#dg')
																		.datagrid(
																				'reload'); // reload the user data
															} else {
																$.messager
																		.show({ // show error message
																			title : 'Error',
																			msg : result.errorMsg
																		});
															}
														}, 'json');
									}
								});
			}
		}
	</script>
</body>
</html>