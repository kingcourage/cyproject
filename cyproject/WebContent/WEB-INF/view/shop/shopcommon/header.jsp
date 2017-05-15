<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<div class="header-top">
		<div class="container">
		<div class="col-md-4 world">
				</div>
				<div class="col-md-4 logo">
					<a href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/public/cpts/images/logo.png" alt=""></a>	
				</div>
		
			<div class="col-md-4 header-left">
			<c:if test="${CURRENT_USER == null}">
					<p class="log"><a href="${pageContext.request.contextPath}/login"  >登录</a>
					<span>or</span><a  href="${pageContext.request.contextPath}/register">注册</a></p>
			</c:if>
			<c:if test="${CURRENT_USER != null}">
				<p class="log"><a href="${pageContext.request.contextPath}/user/shop/index"  >您好,${CURRENT_USER.username}</a>
			</c:if>		
					<div class="cart box_1">
						<a href="${pageContext.request.contextPath}/cart/index">
						<h3> <div class="total">
							<span class="simpleCart_total"></span></div>
							<img src="${pageContext.request.contextPath}/public/cpts/images/cart.png" alt=""/></h3>
						</a>
						<p><a href="javascript:;" class="simpleCart_empty">Empty Cart</a></p>

					</div>
					<div class="clearfix"> </div>
			</div>
				<div class="clearfix"> </div>
		</div>
		</div>