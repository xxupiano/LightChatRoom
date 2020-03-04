<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	String info=null, user=null;
	info=(String)session.getValue("reguser");
	if(info==null || info.length()==0) {
		session.putValue("confirm_message", "错误信息：[您需要登录才能进入聊天室]");
		%> <jsp:forward page="in.jsp"/><%
	}
%>
<!DOCTYPE html>
<!-- 聊天室主页面，框架页面，由3个frameset组成，分别放置listuser.jsp、talk.jsp和showmsg.jsp -->
<html>
<head>
<meta charset="UTF-8">
<title>欢迎<%= session.getValue("Name") %>来到聊天室</title>
</head>
<frameset rows="*, 16%">
<frameset cols="*, 90%">
<frame name="left" src="listuser.jsp">
<frame name="main" src="showmsg.jsp">
</frameset>
<frame name="bottom" src="talk.jsp">
<noframes>
	<body>
		<p>此网页使用了框架，但您的浏览器不支持框架。</p>
	</body>
</noframes>
</html>