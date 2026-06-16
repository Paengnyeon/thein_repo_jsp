<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core" %><!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL Test</title>
</head>
<body>

<c:forEach var="k" begin="1" end="10" step="1">
    <c:out value="${k}" />
    <br>
</c:forEach>

</body>
</html>