<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // 로그인 안 했으면 로그인 페이지로 강제 이동
    String loginUser = (String) session.getAttribute("loginUser");
    if (loginUser == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>마이페이지</title></head>
<body>

    <h2>마이페이지</h2>
    <p>안녕하세요, <b><%= loginUser %></b>님! 로그인 중입니다.</p>

    <a href="logout.jsp">로그아웃</a>

</body>
</html>