<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true" import="java.sql.*"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<!-- 后台数据检查 -->
<html>
<head>
<meta charset="UTF-8">
<title>登录检查</title>
</head>
<body bgcolor="#ccccff">
	<%
		String regTel=(String)request.getParameter("phoneNum");
		regTel=regTel.trim();
		String regName=(String)request.getParameter("username");
		regName=regName.trim();
		String regPassword=(String)request.getParameter("password");
		regPassword=regPassword.trim();
		String regEmail=(String)request.getParameter("email");
		regEmail=regEmail.trim();		
	%>
	<jsp:useBean id="reg" scope="page" class="chatroom.chatreg" />
	
	<%
		int flag=0;//判断是否已注册
		String sql="SELECT * FROM users WHERE username='" + regName + "'";
		ResultSet rs = reg.executeQuery(sql);
		if(rs.next()) {
			rs.close();
			out.println("<center><h2>用户名已存在" + "</h2></center><br><br>");
			out.println("<center><a href=\"chatreg.jsp\"> 注册新账号 </a></center><br>");
			out.println("<center><a href=\"in.jsp\"> 直接登录 </a></center>");
			flag=1;
		} 
		else{
			sql = "SELECT * FROM users WHERE tel='"+regTel+"'";
			rs = reg.executeQuery(sql);
			if(rs.next()){
				String un=rs.getString("username");
				rs.close();
				out.println("<center><h2>该手机号已注册，用户名为" + un + "</h2></center><br><br>");
				out.println("<center><a href=\"in.jsp\"> 直接登录  </a></center><br>");
				out.println("<center><a href=\"chatreg.jsp\"> 注册新账号  </a></center><br>");
				flag=1;
			}
		}
		if(flag==0){
			String strSQL="INSERT INTO users(username, password, email, tel) VALUES('"
						 + regName + "', '" + regPassword + "', '" + regEmail + "', '" + regTel + "')";
			if(reg.executeUpdate(strSQL)) {
				out.println("<center><h2 color=red>恭喜您注册成功！"+"</h2></center><br><br>");
				out.println("<center><a href=\"in.jsp\">登录</a></center>");
			} else {
				out.println("<center><h2 color=red>注册失败！"+"</h2></center><br><br>");
				out.println("<center><a href=\"netchat.jsp\">返回</a></center>");
			}			
		}
		reg.close();
	%>

</body>
</html>