<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品分类</title>
<%@include file="../common/common.jsp"%>
</head>
<body>
	<button class="btn btn-default" onclick="addOne()">添加一级节点</button>
	<button class="btn btn-info" onclick="addTwo()">添加二级节点</button>
	<button class="btn btn-danger" onclick="editCategory()">修改节点</button>
	<button class="btn btn-warning" onclick="deleteCategory()">删除节点</button>
	<ul id="tt" class="easyui-tree">
	</ul>

	<div id="dlg" class="easyui-dialog" style="width: 400px; height: 280px; padding: 10px 20px" closed="true" buttons="#dlg-buttons">
		<div class="ftitle">商品信息</div>
		<form id="fm" method="post">
			<div class="fitem">
				<label>分类名称:</label> <input name="name" class="easyui-validatebox" required="true">
			</div>
			<input type="hidden" name="parentId" id="parentId">
		</form>
	</div>
	<div id="dlg-buttons">
		<a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveCategory()">保存</a> <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>
	</div>

	<script type="text/javascript">
		function addOne() {
			newCategory(0);
		}
		function addTwo() {
			var node = $('#tt').tree('getSelected');
			if (node == null) {
				alert("请选择一级分类");
				return false;
			}
			if ($('#tt').tree('getParent', node.target) != null) {
				alert("只能在一级分类下面添加二级分类");
				return false;
			}
			newCategory($('#tt').tree('getSelected').id);
		}
		function newCategory(parentId) {
			$('#dlg').dialog('open').dialog('setTitle', 'New User');
			$('#fm').form('clear');
			$("#parentId").val(parentId);
			url = '${pageContext.request.contextPath}/category/saveCategory';
		}

		function editCategory() {
			var node = $('#tt').tree('getSelected');
			if (node) {
				$('#dlg').dialog('open').dialog('setTitle', '编辑节点');
				$('#fm').form('load', node);
				url = '${pageContext.request.contextPath}/category/editCategory?id='
						+ node.id;
			}
		}

		function saveCategory() {
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
						 $('#tt').tree('reload');
					}
				}
			});
		}

		function deleteCategory() {
			var node = $('#tt').tree('getSelected');
			if (node) {
				$.messager
						.confirm(
								'确认',
								'您确认删除这个分类吗?',
								function(r) {
									if (r) {
										$
												.post(
														'${pageContext.request.contextPath}/category/deleteCategory',
														{
															id : node.id
														},
														function(result) {
															if (result.code == 0) {
																$('#dg')
																 $('#tt').tree('reload');
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

		$(function() {
			$('#tt')
					.tree(
							{
								url : '${pageContext.request.contextPath}/category/getAllCategory',
								loadFilter : function(rows) {
									return convert(rows);
								}
							});

			$('#tt')
					.tree(
							{
								onClick : function(node) {
									var id = node.id;
									$("#categoryId1").val(id);
									$('#dg')
											.datagrid(
													{
														url : '${pageContext.request.contextPath}/product/system/getProducts?categoryId='
																+ id,
													});
								}
							});

		})
		
	</script>
</body>
</html>