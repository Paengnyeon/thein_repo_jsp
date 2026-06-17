<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
request.setCharacterEncoding("UTF-8");
 // 1. 파라미터 꺼내기
    String n1 = request.getParameter("num1");
    String n2 = request.getParameter("num2");
    String op = request.getParameter("op");
    // 2. String → double 형 변환
    double num1 = Double.parseDouble(n1);
    double num2 = Double.parseDouble(n2);
    double result = 0;
    String error = "";
    	// 3. 연산자에 따라 계산
    	switch (op) {
    	case "+":
    		result = num1 + num2;
    		break;
    	case "-":
    		result = num1 - num2;
    		break;
    	case "*":
    		result = num1 * num2;
    		break;
    	case "/":
    		if (num2 == 0) {
    			error = "0으로 나눌 수 없어요!!";
    		} else {
    			result = num1 / num2;
    		}
    		break;
    	}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계산 결과</title>
</head>
<body>
<h2>계산 결과</h2>

	<%
	if (!error.isEmpty()) {
	%>
	<p style="color: red"><%=error%></p>
	<%
	} else {
	%>
	<p><%=num1%>
		<%=op%>
		<%=num2%>
		= <strong><%=result%></strong>
	</p>
	<%
	}
	%>

	<a href="calc.jsp">다시 계산하기</a>


</body>
</html>