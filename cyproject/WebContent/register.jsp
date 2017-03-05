<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Visual Admin Dashboard - Preferences</title>
    <meta name="description" content="">
    <meta name="author" content="templatemo">
   <script src="${pageContext.request.contextPath}/js/jquery.js" type="text/javascript"></script>
	<!-- 新 Bootstrap 核心 CSS 文件 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/public/dist/css/bootstrap.css">
	<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
	<script src="${pageContext.request.contextPath}/public/dist/js/bootstrap.min.js"></script>
	<!-- <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,700' rel='stylesheet' type='text/css'> -->
	<link href="${pageContext.request.contextPath}/public/css/font-awesome.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/public/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/public/css/templatemo-style.css" rel="stylesheet">
  </head>
  <body class="light-gray-bg">
        <div class="templatemo-content-container">
          <div class="templatemo-content-widget white-bg">
            <h2 class="margin-bottom-10">用户注册</h2>
            <p>请填写信息</p>
            <form action="${pageContext.request.contextPath}/admin/register" class="templatemo-login-form" method="post" enctype="multipart/form-data">            
              <div class="row form-group">
               <div class="col-lg-3 col-md-3 form-group"></div>
                <div class="col-lg-6 col-md-6 form-group">                  
                    <label for="inputUsername">用户名</label>
                    <input type="text" class="form-control" name="username" id="inputUsername" placeholder="Admin">                  
                </div>
                <div class="col-lg-3 col-md-3 form-group"></div>
              </div>
              <div class="row form-group">
              <div class="col-lg-3 col-md-3 form-group"></div>
                <div class="col-lg-6 col-md-6 form-group">                  
                    <label for="inputNewPassword">密码</label>
                    <input type="password" name="passowrd" class="form-control" id="inputNewPassword">
                </div>
               <div class="col-lg-3 col-md-3 form-group"></div> 
               </div>
               <div class="row form-group"> 
               <div class="col-lg-3 col-md-3 form-group"></div>
                <div class="col-lg-6 col-md-6 form-group">                  
                    <label for="inputConfirmNewPassword">确认密码</label>
                    <input type="password" class="form-control" id="inputConfirmNewPassword">
                </div> 
               <div class="col-lg-3 col-md-3 form-group"></div> 
              </div>
              <div class="row form-group">
              <div class="col-lg-3 col-md-3 form-group"></div>  
                <div class="col-lg-6 col-md-6 form-group">                  
                    <label for="inputEmail">邮箱</label>
                    <input type="email" class="form-control"  name="email" id="inputEmail" placeholder="admin@company.com">                  
                </div>
               <div class="col-lg-3 col-md-3 form-group"></div>  
              </div>
               <div class="row form-group">
              <div class="col-lg-3 col-md-3 form-group"></div>  
                <div class="col-lg-6 col-md-6 form-group">                  
                    <label for="inputEmail">手机号码</label>
                    <input type="phone" class="form-control"  name="phone" id="inputPhone" placeholder="">                  
                </div>
               <div class="col-lg-3 col-md-3 form-group"></div>  
              </div>                      
            
             <!--  <div class="row form-group">
                <div class="col-lg-12 has-success form-group">                  
                    <label class="control-label" for="inputWithSuccess">Input with success</label>
                    <input type="text" class="form-control" id="inputWithSuccess">
                </div>
              </div>
              <div class="row form-group">
                <div class="col-lg-12 has-warning form-group">                  
                    <label class="control-label" for="inputWithWarning">Input with warning</label>
                    <input type="text" class="form-control" id="inputWithWarning">
                </div>
              </div>
              <div class="row form-group">
                <div class="col-lg-12 has-error form-group">                  
                    <label class="control-label" for="inputWithError">Input with error</label>
                    <input type="text" class="form-control" id="inputWithError">
                </div>
              </div> -->                                        
                <div class="row form-group"> 
                <div class="col-lg-3 col-md-3 form-group"></div>
                <div class="col-lg-6 col-md-6 form-group">
                  <div>
                    <label class="control-label templatemo-block">性别</label> 
                    <div class="templatemo-inline-block margin-bottom-5">
                      <input type="radio" name="sex" id="r1" value="男" checked>
                      <label for="r1" class="font-weight-400"><span></span>男</label>
                    </div>
                    <div class="templatemo-inline-block margin-bottom-5">
                      <input type="radio" name="sex" id="r2" value="女">
                      <label for="r2" class="font-weight-400"><span></span>女</label>
                    </div>                                
                  </div>                  
                </div> 
                <div class="col-lg-3 col-md-3 form-group"></div>
              </div>                       
              <div class="row form-group">
              <div class="col-lg-3 col-md-3 form-group"></div>
                <div class="col-lg-6">
                  <label class="control-label templatemo-block">File Input</label> 
                  <!-- <input type="file" name="fileToUpload" id="fileToUpload" class="margin-bottom-10"> -->
                  <input type="file" name="fileToUpload" id="fileToUpload" class="filestyle" data-buttonName="btn-primary" data-buttonBefore="true" data-icon="false">
                  <p>Maximum upload size is 5 MB.</p>                  
                </div>
                <div class="col-lg-3 col-md-3 form-group"></div>
              </div>
                 <div class="row form-group">
              <div class="col-lg-3 col-md-3 form-group"></div>
                <div class="col-lg-6 form-group">                   
                    <label class="control-label" for="inputNote">备注</label>
                    <textarea class="form-control" name="comment" id="inputNote" rows="3"></textarea>
                </div>
               <div class="col-lg-3 col-md-3 form-group"></div> 
              </div>        
              <div class="form-group text-right">
                <button type="submit" class="templatemo-blue-button">注册</button>
                <button type="reset" class="templatemo-white-button">重置</button>
                <button type="reset" class="templatemo-white-button" onclick="javascript:window.location.href='${pageContext.request.contextPath}/login.jsp'">返回</button>
              </div>                           
            </form>
          </div>
          <footer class="text-right">
            <p>Copyright &copy; 2084 kingcourage
            | Designed by <a href="http://www.templatemo.com" target="_parent">wcy</a></p>
          </footer>
        </div>
      </div>
    </div>

    <!-- JS -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/public/js/jquery-1.11.2.min.js"></script>        <!-- jQuery -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/public/js/bootstrap-filestyle.min.js"></script>  <!-- http://markusslima.github.io/bootstrap-filestyle/ -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/public/js/templatemo-script.js"></script>        <!-- Templatemo Script -->
  </body>
</html>
