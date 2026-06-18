<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<%
request.setCharacterEncoding("UTF-8");

String name = request.getParameter("name");
String message = request.getParameter("message");

String url = "jdbc:postgresql://localhost:5432/hrd"; //DB연결
String dbUser = "postgres";
String dbPass = "1234";

Connection conn = null;
PreparedStatement pstmt = null;

try {
	Class.forName("org.postgresql.Driver");
	conn = DriverManager.getConnection(url, dbUser, dbPass);

	String sql = "INSERT INTO guestbook (name, message) VALUES (?, ?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, name);
	pstmt.setString(2, message);
	pstmt.executeUpdate();

} catch (Exception e) {
	out.println("오류: " + e.getMessage());
} finally {
	if (pstmt != null)
		try {
	pstmt.close();
		} catch (Exception e) {
		}
	if (conn != null)
		try {
	conn.close();
		} catch (Exception e) {
		}
}

// 저장 후 목록 페이지로 이동
response.sendRedirect("guestbook.jsp");
%>
</body>
</html>