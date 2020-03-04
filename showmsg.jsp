<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" import="java.util.*, java.lang.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<!-- 负责显示各个用户所说的话。如果是私聊，则只有相关的两人能看到，默认是大家都能看到用户发言。
	为了让用户看到其他用户的发言，本页面需要自动刷新。该页面出现在主界面的右侧 -->
<html>
<head>
<meta charset="UTF-8" http-equiv="refresh" content="5">
<title>Show Message</title>
</head>
<body bgcolor="#CCFFCC" style="font-family:幼圆">
	<%
		//获取本用户的用户名、接受者和发言内容，以及是否为私聊
		String audience = null, addresser=null, msg=null;
		String isPrivate;
		boolean isAutoRefresh=false;
		audience=request.getParameter("towho");
		if(audience==null || audience.length()==0) audience="大家";
		addresser=(String)session.getAttribute("Name");
		msg=request.getParameter("msghide");
		if(msg==null || msg.length()==0) isAutoRefresh=true;
		isPrivate=request.getParameter("private");
		if(isPrivate==null) isPrivate="off";
		
		Vector Vmsg=null, Vaddresser=null, VisPrivate=null, Vaudience=null;
		int s=0,e=0,n=0;
		int MAXN=51;
		synchronized(application) {
			Vmsg=(Vector) application.getAttribute("message");
			if(Vmsg==null){
				Vmsg=new Vector(MAXN);
				Vmsg.setSize(MAXN);
				application.setAttribute("s", new Integer(0));
				application.setAttribute("e", new Integer(0));
				application.setAttribute("n", new Integer(0));
			}
			Vaddresser=(Vector)application.getAttribute("addresser");
			if(Vaddresser==null){
				Vaddresser=new Vector(MAXN);
				Vaddresser.setSize(MAXN);
			}
			VisPrivate=(Vector)application.getAttribute("isPrivate");
			if(VisPrivate==null) {
				VisPrivate=new Vector(MAXN);
				VisPrivate.setSize(MAXN);
			}
			Vaudience=(Vector) application.getAttribute("audience");
			if(Vaudience==null){
				Vaudience=new Vector(MAXN);
				Vaudience.setSize(MAXN);
			}
			s=(Integer)application.getAttribute("s");
			e=(Integer)application.getAttribute("e");
			n=(Integer)application.getAttribute("n");
		}
		//将用户的发言保存到application中
		if(!isAutoRefresh) {
			Vmsg.set(e, msg);
			Vaddresser.set(e,addresser);
			VisPrivate.set(e,isPrivate);
			Vaudience.set(e,audience);
			e=(e+1)%MAXN;
			if(n<MAXN-1){
				n++;
			}
			else{
				s=(s+1)%MAXN;
			}
			synchronized(application) {
				application.setAttribute("message", Vmsg);
				application.setAttribute("addresser", Vaddresser);
				application.setAttribute("isPrivate", VisPrivate);
				application.setAttribute("audience", Vaudience);
				application.setAttribute("s", s);
				application.setAttribute("e", e);
				application.setAttribute("n", n);
			}
		}
		
		//显示用户发言
		synchronized(application) {
			int i, size=Vmsg.size();
			String showmsg=null, tmpstr1, tmpstr2;
			
			for(i=s; i!=e; i=(i+1)%MAXN) {
				tmpstr1=(String)VisPrivate.get(i);
				if(tmpstr1.equals("off")) {//判断是否私聊
					showmsg="【" + (String)Vaddresser.get(i) + "】对【" + 
							(String) Vaudience.get(i) + "】说 >> "+(String)Vmsg.get(i) + "<br>";
					out.println(showmsg);
				} else {
					tmpstr1 = (String)Vaudience.get(i);
					tmpstr2 = (String)Vaddresser.get(i);
					if(tmpstr1.equals(addresser) || tmpstr2.equals(addresser)) {
						showmsg="【" + (String) Vaddresser.get(i) + "】对【" + 
								(String)Vaudience.get(i) + "】说[私聊] >> " + (String)Vmsg.get(i) + "<br>";
						out.println(showmsg);
					}
				}
			}
		}
	%>
</body>
</html>