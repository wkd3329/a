<!DOCTYPE html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>

<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
</head>
<body>



<%
	String email = request.getParameter("num");
	
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","tkdwls#123");
	
        Class.forName("org.mariadb.jdbc.Driver");
        PreparedStatement pstmt = conn.prepareStatement("delete from USERS_TB where user_id= ?");
	pstmt.setString(1,email);	

	pstmt.executeQuery();
        conn.close();
        pstmt.close();
		
		response.sendRedirect("./memberMgt.jsp");
		
%>
</body>
</html>
