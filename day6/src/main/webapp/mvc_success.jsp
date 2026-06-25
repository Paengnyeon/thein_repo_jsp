<%@ page contentType="text/html; charset=utf-8"%>
<%@page import="model.LoginBean"%>
<html>
<head>
<title>MVC</title>
</head>
<body>
	<p>로그인 성공했습니다
	<%
		LoginBean bean = (LoginBean) request.getAttribute("bean");
		out.print("아이디 : " + bean.getId());
	%>
</body>
</html>