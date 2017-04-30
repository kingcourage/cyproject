<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%@include file="shopcommon/common.jsp" %>
<body>
<%@include file="shopcommon/header.jsp" %>
<div class="row">
<div class="col-md-4">请使用支付宝扫描二维码完成付款</div>
<div class="col-md-4"><img  src="${pageContext.request.contextPath}/images/${qrimage}"></div>
<div class="col-md-4"></div>
</div>

<%@include file="shopcommon/footer.jsp" %>
</body>
</html>