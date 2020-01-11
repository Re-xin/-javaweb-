<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>管理员登录</title>

    <!-- 1. 导入CSS的全局样式 -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="js/jquery-2.1.0.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="js/bootstrap.min.js"></script>
  </head>
  <body>
  	<div class="container" style="width: 400px;">
  		<h3 style="text-align: center;">医生注册</h3>
        <form action="/doctorRegisterServlet" method="post">
	      <div class="form-group">
	        <label for="name">名字：</label>
	        <input type="text" required  name="name" class="form-control" id="name" placeholder="请输入名字"/>
	      </div>

	      <div class="form-group">
	        <label for="loginname">用户名：</label>
	        <input type="text" required  name="loginname" class="form-control" id="loginname" placeholder="请输入用户名"/>
	      </div>

			<div class="form-group">
	        <label for="pwd">密码：</label>
	        <input type="password" required  name="pwd" class="form-control" id="pwd" placeholder="请输入密码"/>
	      </div>
	      

	      <hr/>
	      <div class="form-group" style="text-align: center;">
	        <input class="btn btn btn-primary" type="submit" value="注册">
		  </div>
	  	</form>
		
		<!-- 出错显示的信息框 -->
	  	<div class="alert alert-warning alert-dismissible" role="alert">
		  <button type="button" class="close" data-dismiss="alert" >
		  	<span>&times;</span>
		  </button>
		   <strong>${login_msg}</strong>
		</div>
  	</div>
  </body>
</html>