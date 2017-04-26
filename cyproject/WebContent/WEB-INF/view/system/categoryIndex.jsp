<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品分类</title>
<%@include file="../common/common.jsp"%>
</head>
<body>
	<div class="easyui-layout" style="width: 100%; height: 700px;">
		<div region="west" split="true" title="商品分类" style="width: 220px;">
			<ul id="tt" class="easyui-tree">
			</ul>
		</div>
		<div id="content" region="center" title="Language" style="padding: 5px;">
			<table id="dg" title="My Users" class="easyui-datagrid" style="width: 100%; height: 100%" toolbar="#toolbar" rownumbers="true" fitColumns="true" singleSelect="true">
				<thead>
					<tr>
						<th field="name" width="50">商品名称</th>
						<th field="subtitle" width="50">副标题</th>
						<th field="price" width="价格">价格</th>
						<th field="stock" width="库存">库存</th>
					</tr>
				</thead>
			</table>
			<div id="toolbar">
				<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newProduct()">新建商品</a> <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editProduct()">编辑商品</a>
				<a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyProduct()">删除商品</a>
			</div>
			<input type="hidden" name="categoryId" id="categoryId1">

			<div id="dlg" class="easyui-dialog" style="width: 400px; height: 280px; padding: 10px 20px" closed="true" buttons="#dlg-buttons">
				<div class="ftitle">商品信息</div>
				<form id="fm" method="post" enctype="multipart/form-data">
					<div class="fitem">
						<label>商品名称:</label> <input name="name" class="easyui-validatebox" required="true">
					</div>
					<div class="fitem">
						<label>副标题:</label> <input name="subtitle" class="easyui-validatebox" required="true">
					</div>
					<div class="fitem">
						<label>价格</label> <input name="price">
					</div>
					<div class="fitem">
						<label>库存</label> <input name="stock" class="easyui-validatebox">
						<input type="hidden" name="categoryId" id="categoryId2">
					</div>
					
					<div class="fitem">
						<label>库存</label> <input type="file" name="image" >
					</div>
					
				</form>
			</div>
			<div id="dlg-buttons">
				<a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveProduct()">保存</a> <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>
			</div>
		</div>
	</div>
	</div>
	<script type="text/javascript">
		$(function() {
			$('#tt')
					.tree(
							{
								url : '${pageContext.request.contextPath}/category/getAllCategory',
								loadFilter : function(rows) {
									return convert(rows);
								}
							});

			$('#tt').tree({
				onClick : function(node) {
					var id = node.id;
					$("#categoryId1").val(id);
					$('#dg').datagrid({
					    url:'${pageContext.request.contextPath}/product/system/getProducts?categoryId='+id,
					});
				}
			});

		})

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