<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%
	Connection conn = null;
	Statement  stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String uid = "";
	
	String sql_select = "SELECT * FROM NOTICE_TB";
%>    
<!DOCTYPE html>
<html lang = "ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/modals/">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="bootstrap.min.css">
<title>List Page</title>
<style>

</style>
</head>
<body>
<%
	try{
		Class.forName("org.mariadb.jdbc.Driver");
		//out.println("드라이버 로딩 성공" + "<br>");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","tkdwls#123");
		//out.println("conn 성공" + "<br>");
		
		pstmt = conn.prepareStatement(sql_select);
		
		rs = pstmt.executeQuery();

%>
<br>
<br><center>
		<h2>공지사항</h2>
<br></center>
<div style="margin:15px">
		<table class="table table-striped" style=" table-layout:fixed; word-break: break-all">

<%
	while(rs.next()) {
		
		String title=rs.getString("title");	
		String cont =rs.getString("contents"); 
		Date d = rs.getDate("date");
		
		out.println("<tr>");
		out.println("<td colspan=1 text-align:center >제목</td>");
		out.println("<td colspan=4>"+title +"</td>");
 		out.println("<td colspan=1 text-align:center >등록일</td>");
	      	out.println("<td colspan=1>"+d +"</td>");
		out.println("</tr>");
		out.println("<tr>");
		out.println("<td colspan=1  text-align:center>내용</td>");
		out.println("<td colspan=6>"+cont +"</td>");
		out.println("</tr>");
			
	}

%>			
			
		
	</table>
	</div>




<br><center>


	<button onclick = "location.href = '/main.jsp'" class="w-20 btn btn-primary btn-lg" >뒤로가기</button>	
</center>
<%

	}catch(Exception e) {
		e.printStackTrace();
	}finally{
		try{
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
%>

</body>
</html>
