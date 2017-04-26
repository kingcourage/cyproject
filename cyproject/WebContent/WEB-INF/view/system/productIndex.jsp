<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@include file="../common/common.jsp"%>
</head>
<body>
	<table id="dg" title="商品列表" class="easyui-datagrid" style="width: 100%; height:100%" url="${pageContext.request.contextPath}/product/getAllProducts" toolbar="#toolbar" rownumbers="true"
		fitColumns="true" singleSelect="true">
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
		<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editProduct()">编辑商品</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyProduct()">删除商品</a>
	</div>


	<div id="dlg" class="easyui-dialog" style="width: 400px; height: 280px; padding: 10px 20px" closed="true" buttons="#dlg-buttons">
		<div class="ftitle">商品信息</div>
		<form id="fm" method="post">
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
			</div>
		</form>
	</div>
	<div id="dlg-buttons">
		<a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveProduct()">保存</a> <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>
	</div>
</body>
<script type="text/javascript">
function newProduct(){
	$('#dlg').dialog('open').dialog('setTitle','New User');
	$('#fm').form('clear');
	url = '${pageContext.request.contextPath}/product/system/saveProduct';
}

function editProduct(){
	var row = $('#dg').datagrid('getSelected');
	if (row){
		$('#dlg').dialog('open').dialog('setTitle','Edit User');
		$('#fm').form('load',row);
		url = '${pageContext.request.contextPath}/product/system/editProduct?id='+row.id;
	}
}

function saveProduct(){
	$('#fm').form('submit',{
		url: url,
		onSubmit: function(){
			return $(this).form('validate');
		},
		success: function(result){
			var result = eval('('+result+')');
			if (result.code !=0){
				$.messager.show({
					title: 'Error',
					msg: result.errorMsg
				});
			} else {
				$('#dlg').dialog('close');		// close the dialog
				$('#dg').datagrid('reload');	// reload the user data
			}
		}
	});
}

function destroyProduct(){
	var row = $('#dg').datagrid('getSelected');
	if (row){
		$.messager.confirm('Confirm','Are you sure you want to destroy this user?',function(r){
			if (r){
				$.post('${pageContext.request.contextPath}/product/system/deleteProduct',{id:row.id},function(result){
					if (result.code ==0){
						$('#dg').datagrid('reload');	// reload the user data
					} else {
						$.messager.show({	// show error message
							title: 'Error',
							msg: result.errorMsg
						});
					}
				},'json');
			}
		});
	}
}
</script>
</html>