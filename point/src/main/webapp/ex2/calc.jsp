<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계산기</title>
</head>
<body>
<h2>간단 계산기</h2>

	<form action="result.jsp" method="post">
		숫자 1 : <input type="number" name="num1"> <br>
		<br> 숫자 2 : <input type="number" name="num2"> <br>
		<br> 연산자 : <select name="op">
			<option value="+">+ 더하기</option>
			<option value="-">- 빼기</option>
			<option value="*">* 곱하기</option>
			<option value="/">/ 나누기</option>
		</select> <br>
		<br> <input type="submit" value="계산하기">
	</form>

</body>
</html>