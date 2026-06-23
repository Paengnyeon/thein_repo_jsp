<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:include page="header.jsp"/>

<h2>글 목록</h2>

<%
    String url    = "jdbc:postgresql://localhost:5432/postgres";
    String dbUser = "postgres";
    String dbPass = "1234";

    Connection conn = null;
    Statement  stmt = null;
    ResultSet  rs   = null;

    try {
        Class.forName("org.postgresql.Driver");
        conn = DriverManager.getConnection(url, dbUser, dbPass);
        stmt = conn.createStatement();
        rs   = stmt.executeQuery(
            "SELECT id, title, author, reg_date FROM board ORDER BY id DESC"
        );
%>
<table border="1" cellpadding="8" style="border-collapse:collapse;width:100%">
    <tr>
        <th>번호</th><th>제목</th><th>작성자</th><th>날짜</th>
    </tr>
    <% while (rs.next()) { %>
    <tr>
        <td><%= rs.getInt("id") %></td>
        <td>
            <a href="view.jsp?id=<%= rs.getInt("id") %>">
                <%= rs.getString("title") %>
            </a>
        </td>
        <td><%= rs.getString("author") %></td>
        <td><%= rs.getTimestamp("reg_date") %></td>
    </tr>
    <% } %>
</table>
<%
    } catch (Exception e) {
        out.println("오류: " + e.getMessage());
    } finally {
        if (rs   != null) try { rs.close();   } catch(Exception e) {}
        if (stmt != null) try { stmt.close();  } catch(Exception e) {}
        if (conn != null) try { conn.close();  } catch(Exception e) {}
    }
%>
</body>
</html>
