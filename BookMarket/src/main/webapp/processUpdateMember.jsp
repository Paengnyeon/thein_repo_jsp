<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");

	String sessionId = (String) session.getAttribute("sessionId");
	if (sessionId == null) {
		response.sendRedirect("login.jsp");
		return;
	}

	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");

	PreparedStatement pstmt = null;

	try {
		String sql = "UPDATE member SET passwd = ?, name = ? WHERE id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, passwd);
		pstmt.setString(2, name);
		pstmt.setString(3, sessionId);
		pstmt.executeUpdate();

		session.setAttribute("sessionName", name);
		response.sendRedirect("welcome.jsp");
	} finally {
		if (pstmt != null) pstmt.close();
		if (conn != null) conn.close();
	}
%>
