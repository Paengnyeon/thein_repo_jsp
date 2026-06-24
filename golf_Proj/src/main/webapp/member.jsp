<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>회원정보조회</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/style.css">
</head>
<body>
<%@ include file="topmenu.jsp" %>
<section>

	<div class="title">회원정보조회</div>
	<div class="wrapper">
	<table style="width: 700px;">
		<tr>
			<th>수강월</th>
			<th>회원번호</th>
			<th>회원명</th>
			<th>강의명</th>
			<th>강의장소</th>
			<th>수강료</th>
			<th>등급</th>
		</tr>
		<%
		try{
			Class.forName("org.postgresql.Driver");
			Connection con = DriverManager.getConnection
			                 ("jdbc:postgresql://localhost:5432/postgres?currentSchema=golf", "postgres", "1234");

			Statement stmt = con.createStatement();

			request.setCharacterEncoding("UTF-8");
			String sql = "SELECT ";
			       sql+= "(SUBSTR(C.regist_month,1,4) ";
		           sql+= "|| '년' ";
		           sql+= "|| SUBSTR(C.regist_month,5,2) ";
		           sql+= "|| '월') AS regist_month, ";
			       sql+= "C.c_no, ";
			       sql+= "M.c_name, ";
			       sql+= "T.class_name, ";
			       sql+= "C.class_area, ";
			       sql+= "('₩' || TO_CHAR(C.tuition,'FM999,999,999')) AS tuition, ";
			       sql+= "M.grade ";
			       sql+= "FROM TBL_TEACHER_202201 T, TBL_MEMBER_202201 M, TBL_CLASS_202201 C ";
			       sql+= "WHERE C.c_no = M.c_no ";
			       sql+= "AND C.teacher_code = T.teacher_code ";
			       sql+= "ORDER BY C.regist_month, C.c_no";

			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){%>
		<tr>
			<td><%=rs.getString("regist_month") %></td>
			<td><%=rs.getString("c_no") %></td>
			<td><%=rs.getString("c_name") %></td>
			<td><%=rs.getString("class_name") %></td>
			<td><%=rs.getString("class_area") %></td>
			<td><%=rs.getString("tuition") %></td>
			<td><%=rs.getString("grade") %></td>
		</tr>
		<%}
			rs.close();
			stmt.close();
			con.close();

		}catch(Exception e){
			e.printStackTrace();
		%>
		<tr>
			<td colspan="7" class="error">DB 연결 또는 조회에 실패했습니다: <%=e.getMessage()%></td>
		</tr>
		<%
		}
		%>

	</table>
	</div>

</section>
<%@ include file="footer.jsp" %>
</body>
</html>
