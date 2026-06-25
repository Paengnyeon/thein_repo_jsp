<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");

	PreparedStatement pstmt = null;

	try {
		String sql = "INSERT INTO member(id, passwd, name) VALUES (?, ?, ?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, passwd);
		pstmt.setString(3, name);
		pstmt.executeUpdate();

		session.setAttribute("sessionId", id);
		session.setAttribute("sessionName", name);
		response.sendRedirect("welcome.jsp");
	} catch (SQLException ex) {
		if ("23505".equals(ex.getSQLState())) {
			response.sendRedirect("addMember.jsp?error=duplicate");
		} else {
			out.println("회원 가입이 실패했습니다.<br>");
			out.println("SQLException: " + ex.getMessage());
		}
	} finally {
		if (pstmt != null) pstmt.close();
		if (conn != null) conn.close();
	}
%>
