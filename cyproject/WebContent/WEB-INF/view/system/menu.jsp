<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@include file="../common/common.jsp" %>
</head>
<body>
<div class="container-fluid">
  <div class="row">
    <ul class="easyui-tree" checkbox="true">
        <li>
            <span>Folder</span>
            <ul>
                <li>
                    <span>Sub Folder 1</span>
                    <ul>
                        <li><span>File 11</span></li>
                        <li><span>File 12</span></li>
                        <li><span>File 13</span></li>
                    </ul>
                </li>
                <li><span>File 2</span></li>
                <li><span>File 3</span></li>
            </ul>
        </li>
        <li><span>File21</span></li>
    </ul>
  </div>
</div>

</body>
</html>