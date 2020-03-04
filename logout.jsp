<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" import="java.util.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Logout</title>
</head>
<body bgcolor="#CCFFCC">
	<%
		String logout_user=(String)request.getParameter("logout");
		if(logout_user!=null) {
			synchronized(application) {//清除用户资料
				Vector UserName=null;
				UserName = (Vector)application.getAttribute("UserName");
				UserName.remove(logout_user);
				application.setAttribute("UserName", UserName);
				session.invalidate();
			}
			synchronized(application) {//自动向其他用户发送退出信息
				Vector outMessage=null, addresser=null, isPrivate=null, audience=null;
				outMessage=(Vector)application.getAttribute("message");
				if(outMessage==null) outMessage=new Vector(30,10);
				addresser=(Vector)application.getAttribute("addresser");
				if(addresser==null) addresser=new Vector(30, 10);
				isPrivate=(Vector)application.getAttribute("isPrivate");
				if(isPrivate==null) isPrivate=new Vector(30, 10);
				audience=(Vector)application.getAttribute("audience");
				if(audience==null) audience=new Vector(30, 10);
				
				outMessage.addElement("离开了聊天室");
				addresser.addElement(logout_user);
				isPrivate.addElement("off");
				audience.addElement("大家");
				application.setAttribute("message", outMessage);
				application.setAttribute("addresser", addresser);
				application.setAttribute("isPrivate", isPrivate);
				application.setAttribute("audience", audience);
			}
		}
	%>
	<br><br><br><br>
	<p align="center"><font size=+3 color=blue>欢迎<%= logout_user %>下次再来！</font>

</body>
</html>