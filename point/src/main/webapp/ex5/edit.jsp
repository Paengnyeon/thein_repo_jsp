<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");

    int id;
    try {
        id = Integer.parseInt(request.getParameter("id"));
    } catch (Exception e) {
        response.sendRedirect("list.jsp");
        return;
    }

    String url = "jdbc:postgresql://localhost:5432/postgres";
    String dbUser = "postgres";
    String dbPass = "1234";

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String author = request.getParameter("author");

        String sql = "UPDATE board SET title = ?, content = ?, author = ? WHERE id = ?";

        try {
            Class.forName("org.postgresql.Driver");
            try (Connection conn = DriverManager.getConnection(url, dbUser, dbPass);
                 PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1, title);
                pstmt.setString(2, content);
                pstmt.setString(3, author);
                pstmt.setInt(4, id);

                int result = pstmt.executeUpdate();
                if (result == 0) {
                    response.sendRedirect("list.jsp");
                    return;
                }
            }

            response.sendRedirect("view.jsp?id=" + id);
            return;
        } catch (Exception e) {
            out.println("오류: " + e.getMessage());
        }
    }

    String title = "";
    String content = "";
    String author = "";
    String sql = "SELECT title, content, author FROM board WHERE id = ?";

    try {
        Class.forName("org.postgresql.Driver");
        try (Connection conn = DriverManager.getConnection(url, dbUser, dbPass);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    title = rs.getString("title");
                    content = rs.getString("content");
                    author = rs.getString("author");
                } else {
                    response.sendRedirect("list.jsp");
                    return;
                }
            }
        }
    } catch (Exception e) {
        out.println("오류: " + e.getMessage());
    }
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>글 수정</title>
</head>
<body>

<jsp:include page="header.jsp"/>

<h2>글 수정</h2>

<form method="post" action="edit.jsp?id=<%= id %>">
    제목: <input type="text" name="title" value="<%= title %>"
               style="width:400px" required><br><br>
    작성자: <input type="text" name="author" value="<%= author %>" required><br><br>
    내용: <textarea name="content" rows="8" cols="60" required><%= content %></textarea><br><br>
    <input type="submit" value="수정 완료">
    <input type="button" value="취소"
           onclick="location.href='view.jsp?id=<%= id %>'">
</form>

</body>
</html>
