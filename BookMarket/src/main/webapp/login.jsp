<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="mvc.database.DBConnection"%>
<%
	request.setCharacterEncoding("UTF-8");

	if ("POST".equalsIgnoreCase(request.getMethod())) {
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = DBConnection.getConnection();
			String sql = "SELECT name FROM member WHERE id = ? AND passwd = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, passwd);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				session.setAttribute("sessionId", id);
				session.setAttribute("sessionName", rs.getString("name"));
				response.sendRedirect("welcome.jsp");
				return;
			} else {
				response.sendRedirect("login.jsp?error=1");
				return;
			}
		} finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
	}
%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>Login</title>
</head>
 <body >
<div class="container py-4">
   <%@ include file="menu.jsp"%>	

   <div class="p-5 mb-4 bg-body-tertiary rounded-3">
      <div class="container-fluid py-5">
        <h1 class="display-5 fw-bold">로그인</h1>
        <p class="col-md-8 fs-4">Login</p>      
      </div>
    </div>

 	<div class="row align-items-md-stretch   text-center">
      <div class="row justify-content-center align-items-center ">
        <div class="h-100 p-5 col-md-6">
         		 <h3>Please sign in</h3>    
      		<%
				String error = request.getParameter("error");
				if (error != null) {
					out.println("<div class='alert alert-danger'>");
					out.println("아이디와 비밀번호를 확인해 주세요");
					out.println("</div>");
				}
			%>
          	<form class="form-signin" action="login.jsp" method="post">
   
    			<div class="form-floating  mb-3 row">     
      				<input type="text"  class="form-control" name="id" required autofocus>
      				<label for="floatingInput">ID</label>      
    			</div>
    			<div class="form-floating  mb-3 row">      
     	 			<input type="password" class="form-control" name="passwd" >
    				<label for="floatingInput">Password</label>
			 	</div>
   
  				<button class="btn btn-lg btn-success" type="submit">로그인</button>
   				
  			</form>
         </div>  
       </div>   
 	</div> 
		<%@ include file="footer.jsp"%>   
  </div>
  </body>			
	
</html>
