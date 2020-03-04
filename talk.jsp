<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" import="java.util.*, java.lang.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<!-- 用户可以在里面输入要说的话，以及选择说话的对象、是否私聊等，它出现在聊天室页面的下方。
	当用户输入完一句话，并回车发送时，该页面会将用户的发言发送给showmsg.jsp文件处理 -->
<html>
<base target="main">
<head>
	<meta charset="UTF-8">
	<title>Talk</title>
	<script type="text/javascript">
		function NameGotFocus() {
			document.talkfrm.msgtext.focus();
		}
		function Logoutconfirm() {
			return confirm("您要退出聊天室吗？");
		}
		function sendMsg() {
			if(document.talkfrm.msgtext.value!="") {
				// 需要隐藏按钮做中转
				document.talkfrm.msghide.value=document.talkfrm.msgtext.value;
				document.talkfrm.msgtext.value="";
				document.talkfrm.msgtext.focus();
				return true;
			} else {
				return false;
			}
		}
	</script>
</head>
<body onload="NameGotFocus()" bgcolor="#CCCCFF" style="font-family:幼圆">
	<form method="POST" action="showmsg.jsp" name="talkfrm">
		<p align="left">
			对<input type="text" name="towho" size="8">说
			<input type="checkbox" name="private" value="ON">私聊
			<input type="text" name="msgtext" size="40">
			<input type="submit" value=" 提 交 " name="sendBtn" onClick="return sendMsg()">
			<input type="hidden" name="msghide">
			<a href="logout.jsp?logout=<%=session.getAttribute("Name")%>" target="_top" onClick="return Logoutconfirm()">退出</a>
		</p>
	</form>

</body>
</html>