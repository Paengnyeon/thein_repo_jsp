<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    int id = Integer.parseInt(request.getParameter("id"));

    String url    = "jdbc:postgresql://localhost:5432/postgres";
    String dbUser = "postgres";
    String dbPass = "1234";

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("org.postgresql.Driver");
        conn = DriverManager.getConnection(url, dbUser, dbPass);

        String sql = "DELETE FROM board WHERE id = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, id);
        pstmt.executeUpdate();

    } catch (Exception e) {
        out.println("오류: " + e.getMessage());
    } finally {
        if (pstmt != null) try { pstmt.close(); } catch(Exception e) {}
        if (conn  != null) try { conn.close();  } catch(Exception e) {}
    }

    response.sendRedirect("list.jsp");
%>
