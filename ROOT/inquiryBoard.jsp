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
	
	String sql_select = "SELECT * FROM INQUIRIES_TB";
%>    
<!DOCTYPE html>
<html lang = "ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="bootstrap.min.css">
<title>List Page</title>
<style>

</style>
</head>
<body>
<%
	try{
		Class.forName("org.mariadb.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","tkdwls#123");
		pstmt = conn.prepareStatement(sql_select);
		rs = pstmt.executeQuery();

%>
<br>
<br><center>
	<h2>문의 내역</h2>
<br></center>
<div style="margin:15px">
		<table class="table table-striped" style=" table-layout:fixed; word-break: break-all">

		<tr>
                <td>문의날짜</td>
                <td colspan=5>내용</td>
                <td>처리상태</td>


<%
	while(rs.next()) {
		
		String stat=rs.getString("inquiry_status");	
		String cont =rs.getString("inquiry_content"); 
		Date d = rs.getDate("inquiry_date");
		String ans = rs.getString("inquiry_answer");
		
		out.println("<tr>");
		out.println("<td colspan=1>"+d +"</td>");
	    out.println("<td colspan=5>"+cont +"</td>");
		out.println("<td colspan=1>"+stat +"</td>");
		out.println("</tr>");
		out.println("<tr>");
		out.println("<td colspan=1>답변</td>");
		out.println("<td colspan=6>"+ans+"</td>");
			
			
		out.println("</tr>");
			

	}


%>			
			
		
	</table>
	</div>




<br><center>


	
	<div class="gap-4 d-sm-flex justify-content-sm-center">
	<button type="button" onclick = "location.href = '/reportBoard.jsp'" class="btn btn-primary btn-sm px-4" >신고내역</button>	
	<button type="button"  onclick = "location.href = '/main.jsp'" class="btn btn-primary btn-sm px-4" >뒤로가기</button>	
	</div>
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
