<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
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
<html>
<head>
<meta charset="UTF-8">
<title>방명록</title>
</head>
<body>
	<h2>방명록</h2>

	<!-- 글 작성 폼 -->
	<form action="save.jsp" method="post">
		이름 : <input type="text" name="name"> <br> 메시지 :
		<textarea name="message" rows="3" cols="40"></textarea>
		<br> <input type="submit" value="저장하기">
	</form>

	<hr>

	<!-- DB에서 목록 불러오기 -->
	<%
    String url    = "jdbc:postgresql://localhost:5432/hrd";
    String dbUser = "postgres";
    String dbPass = "1234";

    Connection conn = null;
    Statement  stmt = null;
    ResultSet  rs   = null;

    try {
        Class.forName("org.postgresql.Driver");
        conn = DriverManager.getConnection(url, dbUser, dbPass);
        stmt = conn.createStatement();
        rs   = stmt.executeQuery("SELECT * FROM guestbook ORDER BY id DESC");

        while (rs.next()) {
%>
    <div style="border:1px solid #ccc; margin:10px; padding:10px">
        <b><%= rs.getString("name") %></b>
        <span style="color:gray;font-size:0.9em"><%= rs.getTimestamp("reg_date") %></span><br>
        <%= rs.getString("message") %>
    </div>
<%
        }
    } catch (Exception e) {
        out.println("<p>오류: " + e.getMessage() + "</p>");
    } finally {
        if (rs   != null) try { rs.close();   } catch(Exception e) {}
        if (stmt != null) try { stmt.close();  } catch(Exception e) {}
        if (conn != null) try { conn.close();  } catch(Exception e) {}
    }
%>
</body>
</html>