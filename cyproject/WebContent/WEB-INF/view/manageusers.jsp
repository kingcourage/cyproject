<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">  
    <title>用户管理</title>
    <meta name="description" content="">
    <meta name="author" content="templatemo">
    <%@include file="common/common.jsp" %>        
  </head>
  <body>  
    <!-- Left column -->
    <%@include file="common/menu.jsp"%>
      <!-- Main content --> 
      <div class="templatemo-content col-1 light-gray-bg">
        <%@include file="common/topmenu.jsp"%>
        <div class="templatemo-content-container">
          <div class="templatemo-content-widget no-padding">
            <div class="panel panel-default table-responsive">
              <table class="table table-striped table-bordered templatemo-user-table" id="myTable" width="100%">
                <thead>
                  <tr>
                    <td><a href="" class="white-text templatemo-sort-by">编号 <span class="caret"></span></a></td>
                    <td><a href="" class="white-text templatemo-sort-by">用户名<span class="caret"></span></a></td>
                    <td><a href="" class="white-text templatemo-sort-by">密码<span class="caret"></span></a></td>
                    <td><a href="" class="white-text templatemo-sort-by">性别<span class="caret"></span></a></td>
                    <td><a href="" class="white-text templatemo-sort-by">电话号码<span class="caret"></span></a></td>
                    <td><a href="" class="white-text templatemo-sort-by">邮箱<span class="caret"></span></a></td>
                    <td>操作</td>                   
                  </tr>
                </thead>
                <tbody>               
                </tbody>
              </table>    
            </div>                          
          </div>          
          <div class="templatemo-flex-row flex-content-row">
            <div class="col-1">
              <div class="panel panel-default margin-10">
                <div class="panel-heading"><h2 class="text-uppercase">Login Form</h2></div>
                <div class="panel-body">
                  <form action="index.html" class="templatemo-login-form">
                    <div class="form-group">
                      <label for="inputEmail">Email address</label>
                      <input type="email" class="form-control" id="inputEmail" placeholder="Enter email">
                    </div>
                    <div class="form-group">                      
                      <label for="inputEmail">Password</label>
                      <input type="password" class="form-control" placeholder="Enter password">                                 
                    </div>              
                    <div class="form-group">
                        <div class="checkbox squaredTwo">
                            <label>
                              <input type="checkbox"> Remember me
                            </label>
                        </div>            
                    </div>
                    <div class="form-group">
                      <button type="submit" class="templatemo-blue-button">Submit</button>
                    </div>
                  </form>
                </div>                
              </div>              
            </div>
            <div class="col-1">              
              <div class="templatemo-content-widget pink-bg">
                <i class="fa fa-times"></i>                
                <h2 class="text-uppercase margin-bottom-10">Latest Data</h2>
                <p class="margin-bottom-0">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc mi sapien, fringilla at orci nec, viverra rhoncus leo. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus rhoncus erat non purus commodo, sit amet varius dolor sagittis.</p>                  
              </div>            
              <div class="templatemo-content-widget blue-bg">
                <i class="fa fa-times"></i>
                <h2 class="text-uppercase margin-bottom-10">Older Data</h2>
                <p class="margin-bottom-0">Phasellus dapibus nulla quis risus auctor, non placerat augue consectetur. Aliquam convallis pharetra odio, in convallis erat molestie sed. Fusce mi lacus, semper sit amet mattis eu, volutpat vitae enim.</p>                
              </div>            
            </div>                       
          </div> <!-- Second row ends -->
          <div class="templatemo-flex-row flex-content-row">
            <div class="templatemo-content-widget white-bg col-2">
              <i class="fa fa-times"></i>
              <div class="media margin-bottom-30">
                <div class="media-left padding-right-25">
                  <a href="#">
                    <img class="media-object img-circle templatemo-img-bordered" src="${pageContext.request.contextPath}/public/images/person.jpg" alt="Sunset">
                  </a>
                </div>
                <div class="media-body">
                  <h2 class="media-heading text-uppercase blue-text">John Barnet</h2>
                  <p>Project Manager</p>
                </div>        
              </div>
              <div class="table-responsive">
                <table class="table">
                  <tbody>
                    <tr>
                      <td><div class="circle green-bg"></div></td>
                      <td>New Task Issued</td>
                      <td>02</td>                    
                    </tr> 
                    <tr>
                      <td><div class="circle pink-bg"></div></td>
                      <td>Task Pending</td>
                      <td>22</td>                    
                    </tr>  
                    <tr>
                      <td><div class="circle blue-bg"></div></td>
                      <td>Inbox</td>
                      <td>13</td>                    
                    </tr>  
                    <tr>
                      <td><div class="circle yellow-bg"></div></td>
                      <td>New Notification</td>
                      <td>18</td>                    
                    </tr>                                      
                  </tbody>
                </table>
              </div>             
            </div>
            <div class="templatemo-content-widget white-bg col-1 text-center templatemo-position-relative">
              <i class="fa fa-times"></i>
              <img src="${pageContext.request.contextPath}/public/images/person.jpg" alt="Bicycle" class="img-circle img-thumbnail margin-bottom-30">
              <h2 class="text-uppercase blue-text margin-bottom-5">Paul Smith</h2>
              <h3 class="text-uppercase margin-bottom-70">Managing Director</h3>
              <div class="templatemo-social-icons-container">
                <div class="social-icon-wrap">
                  <i class="fa fa-facebook templatemo-social-icon"></i>  
                </div>
                <div class="social-icon-wrap">
                  <i class="fa fa-twitter templatemo-social-icon"></i>  
                </div>
                <div class="social-icon-wrap">
                  <i class="fa fa-google-plus templatemo-social-icon"></i>  
                </div>                
              </div>
            </div>
            <div class="templatemo-content-widget white-bg col-1 templatemo-position-relative templatemo-content-img-bg">
              <img src="${pageContext.request.contextPath}/public/images/sunset-big.jpg" alt="Sunset" class="img-responsive content-bg-img">
              <i class="fa fa-heart"></i>
              <h2 class="templatemo-position-relative white-text">Sunset</h2>
              <div class="view-img-btn-wrap">
                <a href="" class="btn btn-default templatemo-view-img-btn">View</a>  
              </div>              
            </div>
          </div>
          <div class="pagination-wrap">
            <ul class="pagination">
              <li><a href="#">1</a></li>
              <li><a href="#">2</a></li>
              <li class="active"><a href="#">3 <span class="sr-only">(current)</span></a></li>
              <li><a href="#">4</a></li>
              <li><a href="#">5</a></li>
              <li>
                <a href="#" aria-label="Next">
                  <span aria-hidden="true"><i class="fa fa-play"></i></span>
                </a>
              </li>
            </ul>
          </div>          
          <footer class="text-right">
            <p>Copyright &copy; 2084 Company Name 
            | Designed by <a href="http://www.templatemo.com" target="_parent">templatemo</a></p>
          </footer>         
        </div>
      </div>
    </div>
    
    
    <script>
      $(document).ready(function(){
        // Content widget with background image
        var imageUrl = $('img.content-bg-img').attr('src');
        $('.templatemo-content-img-bg').css('background-image', 'url(' + imageUrl + ')');
        $('img.content-bg-img').hide();        
      });

      $(function(){
         $('#myTable').DataTable( {  
        searching: false,
       //paging: false,
          ajax: {
        	  url: '${pageContext.request.contextPath}/admin/getAllUsers',  
        	  dataSrc: ''
          },        
          columns: [
                      { "data": "id" },
                      { "data": "username" },
                      { "data": "password" },
                      { "data": "sex" },
                      { "data": "phone" }, 
                      { "data": "email" },
                  ],
                  "columnDefs" : [ {
                	// 定义操作列,######以下是重点########
                	"targets" : 6,//操作按钮目标列
                	"data" : null,
                	"render" : function(data, type,row) {
                	var id = '"' + row.id + '"';
                	var html = "<a href='javascript:void(0);'  class='delete btn btn-default btn-xs'  ><i class='fa fa-times'></i> 查看</a>"
                	html += "<a href='javascript:void(0);' class='up btn btn-default btn-xs'><i class='fa fa-times'></i> 编辑</a>"
                	html += "<a href='javascript:void(0);'   onclick='deleterow("+ id + ")'  class='down btn btn-default btn-xs'><i class='fa fa-times'></i> 删除</a>"
                	return html;
                	}
                	} ],        
         });
       });
     function deleterow(id){
    	 $.ajax({
    		type: "post",
    		 url: '${pageContext.request.contextPath}/admin/deleteAdmin?id='+id,  
    		 success:function(result){
    			window.location.reload();
    		 }
    	 });
     }
    </script>
  </body>
</html>