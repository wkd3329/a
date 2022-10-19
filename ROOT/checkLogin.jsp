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
	String email="";	
	String cName="";

 	Cookie[] cks = request.getCookies();
	if(cks != null){
    		for(int i=0; i < cks.length; i++){
    			if(cks[i].getName().equals("email")){
	       		cName = cks[i].getName();
	        	email = cks[i].getValue();  
    			}
    		}
	}
	

	
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","tkdwls#123");

        Class.forName("org.mariadb.jdbc.Driver");
        PreparedStatement pstmt = conn.prepareStatement(  "select * from USERS_TB where user_id= ?");
	pstmt.setString(1,email);	

	ResultSet rs = pstmt.executeQuery();
      	conn.close();
	pstmt.close(); 
	
		
   	
	if(rs.next()){
		String id=rs.getString("user_id");
		rs.close();	
			if(id.equals("wkd3329@naver.com")||id.equals("lsh_0327@naver.com"))
				response.sendRedirect("./dashboard.jsp");
			else	
				response.sendRedirect("./main.jsp");
		
	}
	else
	{	
		rs.close();
		response.sendRedirect("./info.jsp");
	}


%>
</body>
</html>
