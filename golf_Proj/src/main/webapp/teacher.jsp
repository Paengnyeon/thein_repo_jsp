<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>강사조회</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/style.css">
</head>
<body>
<%@ include file="topmenu.jsp" %>
<section>
    <div class="title">강사조회</div>
    <div class="wrapper">
        <table style="width: 700px;">
            <tr>
                <th>강사코드</th>
                <th>강사명</th>
                <th>강의명</th>
                <th>수강료</th>
                <th>강사자격취득일</th>
            </tr>
            <%
            String sql = "SELECT teacher_code, teacher_name, class_name, "
                       + "('₩' || TO_CHAR(class_price, 'FM999,999,999')) AS class_price, "
                       + "(SUBSTR(teacher_regist_date, 1, 4) || '년 ' "
                       + "|| SUBSTR(teacher_regist_date, 5, 2) || '월 ' "
                       + "|| SUBSTR(teacher_regist_date, 7, 2) || '일') AS teacher_regist_date "
                       + "FROM tbl_teacher_202201 ORDER BY teacher_code";

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
                <td><%= rs.getString("teacher_name") %></td>
                <td><%= rs.getString("class_name") %></td>
                <td><%= rs.getString("class_price") %></td>
                <td><%= rs.getString("teacher_regist_date") %></td>
            </tr>
            <%
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            %>
            <tr><td colspan="5" class="error">DB 연결 또는 조회에 실패했습니다: <%= e.getMessage() %></td></tr>
            <%
            }
            %>
        </table>
    </div>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>
