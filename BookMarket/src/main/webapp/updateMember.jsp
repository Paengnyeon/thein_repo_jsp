<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");

	String loginId = (String) session.getAttribute("sessionId");
	if (loginId == null) {
		response.sendRedirect("login.jsp");
		return;
	}
%>
<%@ include file="dbconn.jsp"%>
<%

	String passwd = "";
	String name = "";
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	try {
		String sql = "SELECT passwd, name FROM member WHERE id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, loginId);
		rs = pstmt.executeQuery();

		if (rs.next()) {
			passwd = rs.getString("passwd");
			name = rs.getString("name");
		}
	} finally {
		if (rs != null) rs.close();
		if (pstmt != null) pstmt.close();
		if (conn != null) conn.close();
	}
%>
<html>
<head>
<link href="./resources/css/bootstrap.min.css" rel="stylesheet">
<title>회원 수정</title>
</head>
<body>
<div class="container py-4">
	<%@ include file="menu.jsp"%>

	<div class="p-5 mb-4 bg-body-tertiary rounded-3">
		<div class="container-fluid py-5">
			<h1 class="display-5 fw-bold">회원 수정</h1>
			<p class="col-md-8 fs-4">BookMarket Member Update</p>
		</div>
	</div>

	<form action="processUpdateMember.jsp" method="post" class="mx-auto" style="max-width: 480px;">
		<div class="mb-3">
			<label class="form-label">아이디</label>
			<input type="text" name="id" class="form-control" value="<%=loginId%>" readonly>
		</div>
		<div class="mb-3">
			<label class="form-label">비밀번호</label>
			<input type="password" name="passwd" class="form-control" value="<%=passwd%>" required>
		</div>
		<div class="mb-3">
			<label class="form-label">이름</label>
			<input type="text" name="name" class="form-control" value="<%=name%>" required>
		</div>
		<button type="submit" class="btn btn-primary">수정하기</button>
		<a href="welcome.jsp" class="btn btn-secondary">취소</a>
	</form>

	<%@ include file="footer.jsp"%>
</div>
</body>
</html>
