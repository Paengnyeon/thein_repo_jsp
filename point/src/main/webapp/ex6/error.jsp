<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오류</title>
<style>
body {
	font-family: sans-serif;
	padding: 20px;
}

.msg {
	color: #c00;
	background: #fff0f0;
	border: 1px solid #fcc;
	padding: 12px;
	border-radius: 4px;
}

a {
	color: #333;
	text-decoration: none;
}

.btn {
	padding: 5px 12px;
	border: 1px solid #999;
	border-radius: 3px;
}
</style>
</head>
<body>
	<h2>오류가 발생했습니다</h2>
	<p class="msg">${errorMsg}</p>
	<br>
	<a class="btn" href="member">목록으로 돌아가기</a>
</body>
</html>
