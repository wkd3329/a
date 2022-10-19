
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>


<%

	String cont = request.getParameter("answ");
	String num = request.getParameter("num");
	out.println(cont);
	out.println(num);
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","tkdwls#123");

        Class.forName("org.mariadb.jdbc.Driver");
	String idSql= "update REPORTS_TB set report_answer = ?  where report_num=?";
	PreparedStatement stmt1 =conn.prepareStatement(idSql );
	stmt1.setString(1,cont);
	stmt1.setString(2,num);
	stmt1.executeUpdate();
	stmt1.close();
	conn.close();

	response.sendRedirect("./reportMgt.jsp");


%>
