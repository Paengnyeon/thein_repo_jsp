<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import ="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>

<!-- Bootstrap CSS CDN : Bootstrap 기본 CSS 사용 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Bootstrap Icons CDN : Apple 아이콘 사용 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">

<style>
/* 전체 기본 설정 */
body {
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
    background-color: #ffffff;
}

/* 전체를 감싸는 박스 */
.root {
    width: 900px;
    margin: 30px auto;
}

/* 상단 전체 영역 */
header {
    border-bottom: 1px solid #ddd;
}

/* HOME 메뉴 영역 */
.top-menu {
    height: 50px;
    display: flex;
    align-items: center;
    font-size: 18px;
    font-weight: 500;
    color: #333;
    border-bottom: 1px solid #ddd;
}

/* 애플 아이콘 */
.top-menu i {
    font-size: 24px;
    margin-right: 8px;
}

/* 메인 제목 박스 */
.title {
    background-color: gray;
    height: 220px;
    padding: 50px;
    box-sizing: border-box;
    border-radius: 8px;
    margin-top: 20px;
}

/* 큰 제목 */
.title h1 {
    margin: 0 0 20px 0;
    font-size: 42px;
    font-weight: bold;
    color: #222;
}

/* 부제목 */
.title h3 {
    margin: 0;
    font-size: 24px;
    font-weight: 400;
    color: #333;
}

/* 가운데 내용 영역 */
.container {
    height: 160px;
    display: flex;
    align-items: center;
    justify-content: center;
}

/* 가운데 문구 */
.container h3 {
    font-size: 24px;
    font-weight: 400;
    color: #333;
}

/* 하단 영역 */
footer {
    border-top: 1px solid #ddd;
    padding-top: 20px;
    font-size: 16px;
    color: #555;
}
</style>

</head>
<body>

<%!
/* JSP 선언부 : 페이지에서 사용할 문자열 변수 선언 */
String greeting = "Welcome to Book Shopping Mall";
String tagline = "Welcome to Web Market!";
%>

<div class="root">

    <header>
    
        <!-- 상단 HOME 메뉴 -->
        <div class="top-menu">
            <i class="bi bi-apple"></i>
            HOME
        </div>
        
        <!-- 메인 제목 영역 -->
        <div class="title">
            <h1><%= greeting %></h1>
            <h3><%= tagline %></h3>
        </div>
        
    </header>
    
    <!-- 가운데 내용 영역 -->
    <section class="container">
        <h3><%= tagline %></h3>
          <div class="row align-items-md-stretch text-center">
        <div class="col-md-12">
            <h3><%= tagline %></h3>
        </div>
    </div>
    </section>
    <%
    Date day=new java.util.Date();
    String am_pm;
    int hour=day.getHours();
    int minute=day.getMinutes();
    int second=day.getSeconds();
    if(hour/12==0){
    	am_pm="AM";
    }else{
    	am_pm="PM";
    	hour=hour -12;
    	
    }
    String CT=hour +":"+minute+":"+second+" " + am_pm;out.println("현재 접속 시각 :"+CT+"\n");
    %>
    <!-- 하단 영역 -->
    <footer>
     <!-- footer.jsp 불러오기 -->
    <%@ include file="footer.jsp" %>
    </footer>
    
</div>

</body>
</html>