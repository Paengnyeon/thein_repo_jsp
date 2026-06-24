<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>강사매출현황</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/style.css">
</head>
<body>
<%@ include file="topmenu.jsp" %>
<section>
    <div class="title">강사매출현황</div>
    <div class="wrapper">
        <table style="width: 500px;">
            <tr>
                <th>강사코드</th>
                <th>강의명</th>
                <th>강사명</th>
                <th>총매출</th>
            </tr>
            <%
            String sql = "SELECT c.teacher_code, t.class_name, t.teacher_name, "
                       + "('₩' || TO_CHAR(SUM(c.tuition), 'FM999,999,999')) AS total "
                       + "FROM tbl_class_202201 c "
                       + "JOIN tbl_teacher_202201 t ON c.teacher_code = t.teacher_code "
                       + "GROUP BY c.teacher_code, t.class_name, t.teacher_name "
                       + "ORDER BY c.teacher_code";

            try {
                Class.forName("org.postgresql.Driver");
                try (Connection con = DriverManager.getConnection(
                         "jdbc:postgresql://localhost:5432/postgres?currentSchema=golf", "postgres", "1234");
                     Statement stmt = con.createStatement();
                     ResultSet rs = stmt.executeQuery(sql)) {
                    while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getString("teacher_code") %></td>
                <td><%= rs.getString("class_name") %></td>
                <td><%= rs.getString("teacher_name") %></td>
                <td style="text-align: right;"><%= rs.getString("total") %></td>
            </tr>
            <%
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            %>
            <tr><td colspan="4" class="error">DB 연결 또는 조회에 실패했습니다: <%= e.getMessage() %></td></tr>
            <%
            }
            %>
        </table>
    </div>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>
