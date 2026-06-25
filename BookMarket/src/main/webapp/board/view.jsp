<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="mvc.model.BoardDTO"%>
<%
	BoardDTO board = (BoardDTO) request.getAttribute("board");
	Integer pageObj = (Integer) request.getAttribute("page");
	int pageNum = pageObj == null ? 1 : pageObj.intValue();
%>
<html>
<head>
<link href="../resources/css/bootstrap.min.css" rel="stylesheet">
<title>게시글 보기</title>
</head>
<body>
<div class="container py-4">
	<%@ include file="../menu.jsp"%>

	<div class="p-5 mb-4 bg-body-tertiary rounded-3">
		<div class="container-fluid py-5">
			<h1 class="display-5 fw-bold">게시글 보기</h1>
		</div>
	</div>

	<%
		if (board == null) {
	%>
	<div class="alert alert-warning">게시글을 찾을 수 없습니다.</div>
	<a class="btn btn-secondary" href="../BoardListAction.do?pageNum=1">목록</a>
	<%
		} else {
	%>
	<table class="table">
		<tr><th style="width: 120px;">번호</th><td><%=board.getNum()%></td></tr>
		<tr><th>제목</th><td><%=board.getSubject()%></td></tr>
		<tr><th>작성자</th><td><%=board.getName()%></td></tr>
		<tr><th>작성일</th><td><%=board.getRegist_day()%></td></tr>
		<tr><th>조회수</th><td><%=board.getHit()%></td></tr>
		<tr><th>내용</th><td><pre style="white-space: pre-wrap;"><%=board.getContent()%></pre></td></tr>
	</table>

	<form action="../BoardUpdateAction.do" method="post">
		<input type="hidden" name="num" value="<%=board.getNum()%>">
		<input type="hidden" name="pageNum" value="<%=pageNum%>">
		<input type="hidden" name="name" value="<%=board.getName()%>">
		<div class="mb-3">
			<label class="form-label">제목 수정</label>
			<input type="text" name="subject" class="form-control" value="<%=board.getSubject()%>">
		</div>
		<div class="mb-3">
			<label class="form-label">내용 수정</label>
			<textarea name="content" class="form-control" rows="5"><%=board.getContent()%></textarea>
		</div>
		<button class="btn btn-primary" type="submit">수정</button>
		<a class="btn btn-danger" href="../BoardDeleteAction.do?num=<%=board.getNum()%>&pageNum=<%=pageNum%>" onclick="return confirm('삭제할까요?')">삭제</a>
		<a class="btn btn-secondary" href="../BoardListAction.do?pageNum=<%=pageNum%>">목록</a>
	</form>
	<%
		}
	%>

	<%@ include file="../footer.jsp"%>
</div>
</body>
</html>
