<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%
	if (session.getAttribute("sessionId") == null) {
		response.sendRedirect("login.jsp");
		return;
	}
%>
<%@ include file="dbconn.jsp"%>
<%
	String bookId = request.getParameter("id");

	PreparedStatement pstmt = null;	
	
	String sql = "delete from book where b_id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, bookId);
	pstmt.executeUpdate();

	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
	
	response.sendRedirect("editBook.jsp?edit=delete");
%>
