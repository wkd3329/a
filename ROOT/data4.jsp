
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
	String idSql= "select consumer_id, porvider_id from MATCH_LOG_TB where match_id = ?";
	PreparedStatement stmt1 =conn.prepareStatement(idSql );
	stmt1.setString(1,cId);
	ResultSet rs = stmt1.executeQuery();
	rs.next();
	String conId=rs.getString("consumer_id");
	String proId=rs.getString("porvider_id");
	rs.close();
	stmt1.close();
	if(cValue.equals(conId)){
		cValue=conId;
		conId=proId;
	}
	else{
		cValue=proId;
	}
				

	String sql =  "update REPORTS_TB set report_num=?,report_match_id=?,reporter_id=?, reported_id=?, report_content=?, report_status=?";

	
	// 쿼리
	PreparedStatement stmt =conn.prepareStatement(sql );
        stmt.setString(1,num);
	stmt.setString(2,cId);
        stmt.setString(3,cValue);
        stmt.setString(4,conId);
    	stmt.setString(5,cont);
        stmt.setString(6,state);
  	stmt.executeUpdate();

	stmt.close();
	conn.close();

	response.sendRedirect("./end.jsp");

%>
</body>

</html>
