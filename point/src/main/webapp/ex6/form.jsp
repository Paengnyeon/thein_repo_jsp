<%@page import="ex6.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    MemberVO member = (MemberVO) request.getAttribute("member");
    boolean isEdit = (member != null);
    String pageTitle = isEdit ? "회원 수정" : "회원 등록";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%= pageTitle %></title>
<style>
  body { font-family: sans-serif; padding: 20px; }
  h2 { border-bottom: 2px solid #333; padding-bottom: 8px; }
  table { border-collapse: collapse; width: 420px; margin-top: 10px; }
  th, td { border: 1px solid #ccc; padding: 10px 14px; }
  th { background-color: #f5f5f5; width: 100px; text-align: left; }
  input[type=text], input[type=password] { width: 240px; padding: 4px; }
  a { color: #333; text-decoration: none; }
  .btn { padding: 5px 12px; border: 1px solid #999; border-radius: 3px; font-size: 13px; cursor: pointer; }
  .btn-submit { background: #333; color: white; border-color: #333; }
</style>
</head>
<body>
<h2><%= pageTitle %></h2>
<form method="post" action="member">
  <% if (isEdit) { %>
  <input type="hidden" name="action" value="update">
  <input type="hidden" name="id"     value="<%= member.getId() %>">
  <% } else { %>
  <input type="hidden" name="action" value="insert">
  <% } %>

  <table>
    <tr>
      <th>아이디 *</th>
      <td><input type="text" name="userid"
                 value="<%= isEdit ? member.getUserid() : "" %>" required></td>
    </tr>
    <tr>
      <th>비밀번호 *</th>
      <td><input type="password" name="password"
                 value="<%= isEdit ? member.getPassword() : "" %>" required></td>
    </tr>
    <tr>
      <th>이름 *</th>
      <td><input type="text" name="username"
                 value="<%= isEdit ? member.getUsername() : "" %>" required></td>
    </tr>
    <tr>
      <th>이메일</th>
      <td><input type="text" name="email"
                 value="<%= (isEdit && member.getEmail() != null) ? member.getEmail() : "" %>"></td>
    </tr>
  </table>
  <br>
  <input class="btn btn-submit" type="submit" value="<%= isEdit ? "수정 완료" : "등록" %>">
  <a class="btn" href="member">취소</a>
</form>
</body>
</html>