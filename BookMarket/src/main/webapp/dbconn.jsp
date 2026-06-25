<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%
	Connection conn = null;

	try {
		String url = "jdbc:postgresql://localhost:5432/postgres";
		String user = "postgres";
		String password = "1234";

		Class.forName("org.postgresql.Driver");
		conn = DriverManager.getConnection(url, user, password);

	} catch (ClassNotFoundException ex) {
		out.println("JDBC 드라이버를 찾을 수 없습니다.<br>");
		out.println("ClassNotFoundException: " + ex.getMessage());
	} catch (SQLException ex) {
		out.println("데이터베이스 연결이 실패되었습니다.<br>");
		out.println("SQLException: " + ex.getMessage());
	}
%>
