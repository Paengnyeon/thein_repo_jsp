<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // 이미 로그인 상태면 마이페이지로
    if (session.getAttribute("loginUser") != null) {
        response.sendRedirect("../ex5/list.jsp");
        return;
    }
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<h2>로그인</h2>

    <% String msg = request.getParameter("msg"); %>
    <% if ("fail".equals(msg)) { %>
        <p style="color:red">아이디 또는 비밀번호가 틀렸습니다.</p>
    <% } %>

    <form action="loginCheck.jsp" method="post">
        아이디   : <input type="text"     name="userid"   ><br><br>
        비밀번호 : <input type="password" name="password" ><br><br>
        <input type="submit" value="로그인">
    </form>
</body>
</html>
