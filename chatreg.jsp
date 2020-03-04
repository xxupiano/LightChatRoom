<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<!-- 用户输入注册数据，进行前期的数据检查 -->
<html>
	<head>
		<meta charset="UTF-8">
		<title> 注册 </title>
		<link rel="stylesheet" href="./src/font-awesome.min.css" />
  		<link rel="stylesheet" href="./src/style.css">
		<script src="src/finalcheck.js"></script>
	</head>
	 <body id="particles-js"> 
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
	      手机账号注册
	     </div> 
	     <div class="v-line"></div> 
	     <div id="webLog">
	      网站账号注册
	     </div> 
	    </div> 
		<form name = "regForm" method="post" action="chatregcof.jsp" onSubmit="return validate_form()">
			<img src="./src/smile.jpg" style="width:120px;margin-bottom: 5px;" /> 
			<input id="phoneNum" name="phoneNum" type="tel" placeholder="手机号码" class="login-input top-radius" value="" required=""/><span id="ckphoneNum" class="check"></span>
			<input id="username" name="username" type="text" placeholder="用户名"  class="login-input top-radius" value="" required=""/><span id="ckusername" class="ckusername"></span>
			<input id="password" name="password" type="password"  placeholder="密码"  class="login-input top-radius" value="" required=""/><span id="ckpassword" class="check"></span> 
			<input id="cfpassword" name="cfpassword" type="password" placeholder="确认密码" class="login-input top-radius" value="" required=""/><span id="ckcfpassword" class="check"></span> 
			<input id="email" name="email" type="text" placeholder="邮箱地址" class="login-input top-radius" value="" required=""/><span id="ckemail" class="check"></span> 
			<div style="margin-left: 0px;margin-bottom: 5px;color:#ec3627"></div>
		    <div id="login-btn" class="login-in-btn" style="margin-right: 10px;">
		     <input type="submit" name="Submit" value="注册" class="login-in-btn">
		    </div>
		</form>
		<script src="src/rtcheck.js"></script> 
	   </div>
	  </div>
	 </body>
</html>