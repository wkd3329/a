
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>


<%
	Cookie[] cookies = request.getCookies() ;
	String cName="";
	String cValue="";
	String cId="";
	if(cookies != null){
		
		for(int i=0; i < cookies.length; i++){
			Cookie c = cookies[i] ;
			cName = c.getName();
			if(cName.equals("email")){
				cValue = c.getValue() ;
				break;
			}
		}
	}
	
	 if(cookies != null){

                for(int i=0; i < cookies.length; i++){
                        Cookie c = cookies[i] ;
                        cName = c.getName();
                        if(cName.equals("matchID")){
                                cId = c.getValue() ;
                                break;
                        }
                }
        }
	

	String cont = request.getParameter("cont");
	String num="1";
	String state="0";

	

	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","tkdwls#123");

        Class.forName("org.mariadb.jdbc.Driver");

	String sql =  "insert into INQUIRIES_TB (inquiry_match_id, inquiry_id, inqurry_content,inquiry_status), values (?,?,?,?)";

	
	// 쿼리
	PreparedStatement stmt =conn.prepareStatement(sql );
	stmt.setString(1,cId);
        stmt.setString(2,cValue);
        stmt.setString(3,cont);
    	stmt.setString(4,"0");
  	stmt.executeUpdate();

	stmt.close();
	conn.close();

	response.sendRedirect("./end.jsp");

%>
</body>

</html>
