<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" http-equiv="refresh" content="60">
<title> Listuser </title>
</head>
<body bgcolor="#CCCCFF" leftmargin="0" style="font-family:幼圆">
	<font color=blue size=-1>在线人员列表：</font><br><br>
	<font color=#669900 size=-1><a href="listuser.jsp">刷新列表</a><br>
	<%
		synchronized(application) {
			Vector ListUser=null;
			//下面取出存在application中的所有用户名，放在一个Vector中
			ListUser = (Vector)application.getAttribute("UserName");
			if(ListUser!=null) {
				for(int i=0; i<ListUser.size(); i++) {
					String User=(String)ListUser.get(i);
					out.println(User+"<br>");
				}
			} else
				out.println(new String("Welcome to here!!"));
		}
	%>
</body>
</html>