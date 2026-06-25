<%@ page contentType="text/html; charset=utf-8"%>
<%
	String id = request.getParameter("id");
	if (id == null || id.trim().equals("")) {
		id = (String) session.getAttribute("sessionId");
	}
	if (id == null || id.trim().equals("")) {
		id = "admin";
	}
	String name = (String) request.getAttribute("name");
	if (name == null || name.trim().equals("")) {
		Object sessionName = session.getAttribute("sessionName");
		name = sessionName == null ? id : sessionName.toString();
	}
%>
<html>
<head>
<link href="../resources/css/bootstrap.min.css" rel="stylesheet">
<title>게시글 작성</title>
</head>
<body>
<div class="container py-4">
	<%@ include file="../menu.jsp"%>

	<div class="p-5 mb-4 bg-body-tertiary rounded-3">
		<div class="container-fluid py-5">
			<h1 class="display-5 fw-bold">게시글 작성</h1>
		</div>
	</div>

	<form action="../BoardWriteAction.do" method="post">
		<input type="hidden" name="id" value="<%=id%>">
		<div class="mb-3">
			<label class="form-label">작성자</label>
			<input type="text" name="name" class="form-control" value="<%=name%>" required>
		</div>
		<div class="mb-3">
			<label class="form-label">제목</label>
			<input type="text" name="subject" class="form-control" required>
		</div>
		<div class="mb-3">
			<label class="form-label">내용</label>
			<textarea name="content" class="form-control" rows="8" required></textarea>
		</div>
		<button class="btn btn-primary" type="submit">등록</button>
		<a class="btn btn-secondary" href="../BoardListAction.do?pageNum=1">목록</a>
	</form>

	<%@ include file="../footer.jsp"%>
</div>
</body>
</html>
