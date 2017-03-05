<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

	 <div class="templatemo-flex-row">
      <div class="templatemo-sidebar">
        <header class="templatemo-site-header">
          <div class="square"></div>
          <h1>${username}</h1>
        </header>
        <div class="profile-photo-container">
          <img src="${pageContext.request.contextPath}/public/images/profile-photo.jpg" alt="Profile Photo" class="img-responsive">  
          <div class="profile-photo-overlay"></div>
        </div>      
        <!-- Search box -->
        <form class="templatemo-search-form" role="search">
          <div class="input-group">
              <button type="submit" class="fa fa-search"></button>
              <input type="text" class="form-control" placeholder="Search" name="srch-term" id="srch-term">           
          </div>
        </form>
        <div class="mobile-menu-icon">
            <i class="fa fa-bars"></i>
        </div>
        <nav class="templatemo-left-nav">          
          <ul>
            <li><a href="${pageContext.request.contextPath}/admin/index" class="active"><i class="fa fa-home fa-fw"></i>主页</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/visualization"><i class="fa fa-bar-chart fa-fw"></i>图表</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/visualization"><i class="fa fa-database fa-fw"></i>数据</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/maps"><i class="fa fa-map-marker fa-fw"></i>地图</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/manageusers"><i class="fa fa-users fa-fw"></i>用户</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/preferences"><i class="fa fa-sliders fa-fw"></i>设置</a></li>
            <li><a href="${pageContext.request.contextPath}/login.jsp"><i class="fa fa-eject fa-fw"></i>退出</a></li>
          </ul>  
        </nav>
      </div>
