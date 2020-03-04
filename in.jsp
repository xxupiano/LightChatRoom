<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
<% request.setCharacterEncoding("UTF-8"); %>yi8
<!DOCTYPE html>
<html>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="./src/font-awesome.min.css" />
 		<link rel="stylesheet" href="./src/style.css">
	<script type="text/javascript">
		function NameGotFocus() {
			document.LoginForm.username.focus();
		}
	</script>
	<title>欢迎来到聊天室</title>
</head>
 <body id="particles-js" onload="NameGotFocus()"> 
  <%-- 如果登录不成功，confirm.jsp将返回一段错误代码，可以显示给用户看 --%>
  <%
   String getMessage=(String) session.getValue("confirm_message");
   if(getMessage==null) getMessage="";
  %>
  <div style=""></div> 
  <script src="./src/particles.min.js"></script> 
  <script src="./src/particles.js"></script> 
  <div id="nav-bar"> 
   <div class="nav-head"> 
     <div style="margin-top: 12px;margin-left: 30px;float: left;">
      <img src="./src/logo.png" style="height: 25px;" />
     </div>
   </div> 
  </div> 
  <div style="z-index: 1000;position: absolute;top:20%;left :50%;margin:-30 0 0 -190px;"> 
   <div style="margin-left: auto;margin-right: auto;width: 300px;text-align: center;background-color: rgba(50,50,50,0.6);padding: 20px 40px 60px 40px;position: relative;"> 
    <div class="selectLog" style="position: absolute;left: 0px;top: -44px;width: 380px;"> 
     <div id="phoneLog">
      用户名登录
     </div> 
     <div class="v-line"></div> 
     <div id="webLog">
      手机号登录
     </div> 
    </div> 
	<form name = "LoginForm" method="post" action="confirm.jsp">
		<%= getMessage %>
		<img src="./src/smile.jpg" style="width:120px;margin-bottom: 5px;" /> 
		<input id="username" name="regName" placeholder="用户名"  class="login-input top-radius" /><span id="ckusername" class="ckusername"></span>
		<input id="password" name="regPassword" type="password"  placeholder="密码" class="login-input top-radius" /><span id="ckpassword" class="check"></span> 
		<div><p>游客登录</p></div>
		<input name="username" type="text" placeholder="临时账号" class="login-input top-radius">
		<div style="margin-left: 0px;margin-bottom: 5px;color:#ec3627"></div>
	    <div id="login-btn" class="login-in-btn" style="margin-right: 10px;">
	     <input type="submit" name="Submit" value="登录" class="login-in-btn">
	    </div> 
	</form>
   </div>
  </div>
 </body>
</html>