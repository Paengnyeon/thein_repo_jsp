<%@page import="ex6.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 상세</title>
<style>
  body { font-family: sans-serif; padding: 20px; }
  h2 { border-bottom: 2px solid #333; padding-bottom: 8px; }
  table { border-collapse: collapse; width: 420px; margin-top: 10px; }
  th, td { border: 1px solid #ccc; padding: 10px 14px; }
  th { background-color: #f5f5f5; width: 100px; text-align: left; }
  a { color: #333; text-decoration: none; }
  .btn { padding: 5px 12px; border: 1px solid #999; border-radius: 3px; font-size: 13px; }
  .btn-del { color: #c00; border-color: #c00; }
</style>
</head>
<body>
<h2>회원 상세</h2>
<%
    MemberVO member = (MemberVO) request.getAttribute("member");
    if (member == null) {
%>
  <p style="color:#c00;">회원을 찾을 수 없습니다.</p>
  <a class="btn" href="member">목록으로</a>
<%
    } else {
%>
<table>
  <tr><th>번호</th>  <td><%= member.getId() %></td></tr>
  <tr><th>아이디</th><td><%= member.getUserid() %></td></tr>
  <tr><th>이름</th>  <td><%= member.getUsername() %></td></tr>
  <tr><th>이메일</th><td><%= member.getEmail() != null ? member.getEmail() : "-" %></td></tr>
  <tr><th>가입일</th><td><%= member.getRegDate() %></td></tr>
</table>
<br>
<a class="btn" href="member">목록으로</a>
<a class="btn" href="member?action=edit&id=<%= member.getId() %>">수정</a>
<a class="btn btn-del" href="member?action=delete&id=<%= member.getId() %>"
   onclick="return confirm('정말 삭제하시겠습니까?')">삭제</a>
<%
    }
%>
</body>
</html>