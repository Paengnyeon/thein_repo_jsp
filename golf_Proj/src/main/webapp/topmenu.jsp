<%@ page pageEncoding="UTF-8" %>
<header>골프연습장 회원관리 프로그램 ver 1.0</header>
<nav>
    <ul>
        <li><a href="<%= request.getContextPath() %>/teacher.jsp">강사조회</a></li>
        <li><a href="<%= request.getContextPath() %>/insert.jsp">수강신청</a></li>
        <li><a href="<%= request.getContextPath() %>/member.jsp">회원정보조회</a></li>
        <li><a href="<%= request.getContextPath() %>/result.jsp">강사매출현황</a></li>
        <li><a href="<%= request.getContextPath() %>/index.jsp">홈으로</a></li>
    </ul>
</nav>
