
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>


<%
	
	String tit=request.getParameter("tit");
	String cont=request.getParameter("cont");
	
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","tkdwls#123");
	
        Class.forName("org.mariadb.jdbc.Driver");
	String idSql= "insert into NOTICE_TB(title,contents) value (?,?)";
	
	PreparedStatement stmt1 =conn.prepareStatement(idSql );
	stmt1.setString(1,tit);
	stmt1.setString(2,cont);
	stmt1.executeQuery();
	stmt1.close();
	conn.close();
	response.sendRedirect("./noticeMgt.jsp");

%>
</body>

</html>
