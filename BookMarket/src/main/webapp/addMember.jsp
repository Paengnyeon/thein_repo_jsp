<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<link href="./resources/css/bootstrap.min.css" rel="stylesheet">
<title>회원 가입</title>
</head>
<body>
<div class="container py-4">
	<%@ include file="menu.jsp"%>

	<div class="p-5 mb-4 bg-body-tertiary rounded-3">
		<div class="container-fluid py-5">
			<h1 class="display-5 fw-bold">회원 가입</h1>
			<p class="col-md-8 fs-4">BookMarket Join</p>
		</div>
	</div>

	<%
		String error = request.getParameter("error");
		if ("duplicate".equals(error)) {
	%>
	<div class="alert alert-danger">이미 사용 중인 아이디입니다.</div>
	<%
		}
	%>

	<form action="processAddMember.jsp" method="post" class="mx-auto" style="max-width: 480px;">
		<div class="mb-3">
			<label class="form-label">아이디</label>
			<input type="text" name="id" class="form-control" required>
		</div>
		<div class="mb-3">
			<label class="form-label">비밀번호</label>
			<input type="password" name="passwd" class="form-control" required>
		</div>
		<div class="mb-3">
			<label class="form-label">이름</label>
			<input type="text" name="name" class="form-control" required>
		</div>
		<button type="submit" class="btn btn-primary">가입하기</button>
		<a href="login.jsp" class="btn btn-secondary">로그인</a>
	</form>

	<%@ include file="footer.jsp"%>
</div>
</body>
</html>
