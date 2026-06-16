<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Action tag</title>
</head>
<body>
<h3>이 파일은 second.jsp입니다.</h3>
Today is : <%= new java.util.Date() %>
Today is : <%=request.getParameter("date") %>
</body>
</html>