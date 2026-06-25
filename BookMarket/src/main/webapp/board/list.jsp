<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="mvc.model.BoardDTO"%>
<%
	ArrayList<BoardDTO> boardlist = (ArrayList<BoardDTO>) request.getAttribute("boardlist");
	Integer pageNumObj = (Integer) request.getAttribute("pageNum");
	Integer totalPageObj = (Integer) request.getAttribute("total_page");
	Integer totalRecordObj = (Integer) request.getAttribute("total_record");
	int pageNum = pageNumObj == null ? 1 : pageNumObj.intValue();
	int totalPage = totalPageObj == null ? 1 : totalPageObj.intValue();
	int totalRecord = totalRecordObj == null ? 0 : totalRecordObj.intValue();
%>
<html>
<head>
<link href="../resources/css/bootstrap.min.css" rel="stylesheet">
<title>게시판</title>
</head>
<body>
<div class="container py-4">
	<%@ include file="../menu.jsp"%>

	<div class="p-5 mb-4 bg-body-tertiary rounded-3">
		<div class="container-fluid py-5">
			<h1 class="display-5 fw-bold">게시판</h1>
			<p class="col-md-8 fs-4">총 <%=totalRecord%>개의 글이 있습니다.</p>
		</div>
	</div>

	<div class="mb-3 text-end">
		<a class="btn btn-primary" href="../BoardWriteForm.do?id=<%=session.getAttribute("sessionId") == null ? "admin" : session.getAttribute("sessionId")%>">글쓰기</a>
	</div>

	<table class="table table-hover">
		<thead>
			<tr>
				<th style="width: 80px;">번호</th>
				<th>제목</th>
				<th style="width: 140px;">작성자</th>
				<th style="width: 180px;">작성일</th>
				<th style="width: 80px;">조회</th>
			</tr>
		</thead>
		<tbody>
		<%
			if (boardlist == null || boardlist.isEmpty()) {
		%>
			<tr><td colspan="5" class="text-center">등록된 글이 없습니다.</td></tr>
		<%
			} else {
				for (BoardDTO board : boardlist) {
		%>
			<tr>
				<td><%=board.getNum()%></td>
				<td><a href="../BoardViewAction.do?num=<%=board.getNum()%>&pageNum=<%=pageNum%>"><%=board.getSubject()%></a></td>
				<td><%=board.getName()%></td>
				<td><%=board.getRegist_day()%></td>
				<td><%=board.getHit()%></td>
			</tr>
		<%
				}
			}
		%>
		</tbody>
	</table>

	<nav>
		<ul class="pagination justify-content-center">
		<%
			for (int i = 1; i <= totalPage; i++) {
		%>
			<li class="page-item <%=i == pageNum ? "active" : ""%>">
				<a class="page-link" href="../BoardListAction.do?pageNum=<%=i%>"><%=i%></a>
			</li>
		<%
			}
		%>
		</ul>
	</nav>

	<%@ include file="../footer.jsp"%>
</div>
</body>
</html>
