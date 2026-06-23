<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    String method = request.getMethod();

    // POST로 제출됐을 때만 저장 처리
    if ("POST".equals(method)) {
        String title   = request.getParameter("title");
        String content = request.getParameter("content");
        String author  = request.getParameter("author");

        String url    = "jdbc:postgresql://localhost:5432/postgres";
        String dbUser = "postgres";
        String dbPass = "1234";

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            Class.forName("org.postgresql.Driver");
            conn = DriverManager.getConnection(url, dbUser, dbPass);

            String sql = "INSERT INTO board (title, content, author) VALUES (?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, title);
            pstmt.setString(2, content);
            pstmt.setString(3, author);
            pstmt.executeUpdate();

            response.sendRedirect("list.jsp");
            return;

        } catch (Exception e) {
            out.println("오류: " + e.getMessage());
        } finally {
            if (pstmt != null) try { pstmt.close(); } catch(Exception e) {}
            if (conn  != null) try { conn.close();  } catch(Exception e) {}
        }
    }
%>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>글쓰기</title></head>
<body>

<jsp:include page="header.jsp"/>

<h2>글쓰기</h2>

<form method="post">
    제목   : <input type="text" name="title" style="width:400px"><br><br>
    작성자 : <input type="text" name="author"><br><br>
    내용   : <textarea name="content" rows="8" cols="60"></textarea><br><br>
    <input type="submit" value="저장">
    <input type="button" value="취소" onclick="location.href='list.jsp'">
</form>

</body>
</html>
