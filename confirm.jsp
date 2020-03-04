<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" import="java.sql.*, java.util.Vector" %>
<!DOCTYPE html>
<!-- 用户输入完姓名，转到confirm.jsp，正确则进入聊天室，错误则返回登录界面，
	 并将新来的用户登记到application对象的UserName属性 -->
<html>
<head>
<meta charset="UTF-8">
<title>登录检查</title>
</head>
<body>
	<jsp:useBean id="reg" scope="page" class="chatroom.chatreg"/>
	<% 
		String regName=(String)request.getParameter("regName");
		regName = regName.trim();
		String regPassword=(String)request.getParameter("regPassword");
		regPassword=regPassword.trim();
		String Name=(String)request.getParameter("username");
		Name=Name.trim();
	%>
	<%
		//检测用户名的合法性
		boolean success = true;
		String sql=null;
		ResultSet RS;
		if((regName.length()!=0)) {//如果是注册用户
			sql="SELECT * FROM users where username='"
				+ regName + "' and password='" + regPassword + "' ";
			RS = reg.executeQuery(sql);
			if(!RS.next()) {
				session.setAttribute("confirm_message", "错误信息：[用户名或密码错误！]");
				success=false;
			}
			RS.close();
		} else {//如果是游客
			sql="SELECT * FROM users WHERE username='" + Name + "'";
			RS=reg.executeQuery(sql);
			if(RS.next()) {
				session.setAttribute("confirm_message", "错误信息: [游客不能使用注册用户名！]");
				success=false;
			}
			RS.close();
			if((Name.length()<2)||(Name.length()>8)) {
				session.setAttribute("confirm_message", "错误信息：[您的名字长度必须在2--8之间]");
				success=false;
			}
			if(Name.indexOf(' ')>-1) {
				session.setAttribute("confirm_message", "错误信息：[名字中不能有空格]");
				success=false;
			}
		}
		if(!success) {
			%><jsp:forward page="in.jsp"/> <%
		}
	%>
	
	<%
		synchronized (application) {
			Vector UserName=null;
			UserName=(Vector) application.getAttribute("UserName");
			if(UserName==null) {//如果是聊天室的第一个用户
				UserName=new Vector(30,10);
			}
			if(regName.length()>0) {//区分游客和注册用户，为权限管理做准备
				session.setAttribute("reguser", "true");
				Name=regName;
			} else {
				session.setAttribute("reguser", "false");
			}
			// 关闭界面没退出仍能再次登录
			// 只有一个session对象，因此同时登录会有bug
			if(UserName.contains(Name)) {
				session.setAttribute("confirm_message", "错误信息：[该账号已登录]");
				//session.setAttribute("reguser", "true");
				//session.setAttribute("Name", Name);
				%> <jsp:forward page="in.jsp"/> <%
			} else {
				UserName.addElement(Name);
				session.setAttribute("Name", Name);
				//把新来的用户加入到application的UserName属性中去
				application.setAttribute("UserName", UserName);
			}
		}
	%>
	<jsp:forward page="chatroom.jsp"/>
</body>
</html>