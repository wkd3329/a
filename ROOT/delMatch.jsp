<%

	String nun = request.getParameter("num");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","tkdwls#123");

        Class.forName("org.mariadb.jdbc.Driver");
        PreparedStatement pstmt = conn.prepareStatement("delete from MATCH_LOG_TB where match_id= ?");
	pstmt.setString(1,num);	

	pstmt.executeQuery();
        conn.close();
        pstmt.close();
	response.sendRedirect("./ex.jsp");
%>
