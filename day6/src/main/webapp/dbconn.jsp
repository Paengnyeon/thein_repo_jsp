<%@ page import="java.sql.*"%>

<%
    Connection conn = null;

    String url = "jdbc:postgresql://localhost:5432/postgres";
    String user = "postgres";
    String password = "1234";

    Class.forName("org.postgresql.Driver");
    conn = DriverManager.getConnection(url, user, password);
%>