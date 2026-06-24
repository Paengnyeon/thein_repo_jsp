<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%
request.setCharacterEncoding("UTF-8");

String registMonth = request.getParameter("regist_month");
String cNo = request.getParameter("c_no");
String classArea = request.getParameter("class_area");
String tuition = request.getParameter("tuition");
String teacherCode = request.getParameter("teacher_code");

int result = 0;
try {
    Class.forName("org.postgresql.Driver");
    String sql = "INSERT INTO tbl_class_202201 "
               + "(regist_month, c_no, class_area, tuition, teacher_code) "
               + "VALUES (?, ?, ?, ?, ?)";

    try (Connection con = DriverManager.getConnection(
             "jdbc:postgresql://localhost:5432/postgres?currentSchema=golf", "postgres", "1234");
         PreparedStatement pstmt = con.prepareStatement(sql)) {
        pstmt.setString(1, registMonth);
        pstmt.setString(2, cNo);
        pstmt.setString(3, classArea);
        pstmt.setInt(4, Integer.parseInt(tuition));
        pstmt.setString(5, teacherCode);
        result = pstmt.executeUpdate();
    }
} catch (Exception e) {
    e.printStackTrace();
}

if (result == 1) {
%>
<!DOCTYPE html>
<html lang="ko"><head><meta charset="UTF-8"><title>수강신청 결과</title></head>
<body><script>
alert("수강신청이 정상적으로 완료되었습니다!");
location.href = "<%= request.getContextPath() %>/index.jsp";
</script></body></html>
<%
} else {
%>

<title>수강신청 결과</title></head>
<body><script>
alert("수강신청에 실패했습니다. 입력값과 서버 로그를 확인해주세요.");
history.back();
</script></body></html>
<%
}
%>
