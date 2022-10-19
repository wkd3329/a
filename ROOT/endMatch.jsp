
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>


<%

	Cookie[] cookies = request.getCookies() ;
	String cName="";
	String cId="";
	
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
	
	String typeArr[] = {"consumer_id","provider_id"};
	String gradeArr[] = {"provider_grade","consumer_grade"};
	float star = Float.parseFloat(request.getParameter("rating"));
	int candp = Integer.parseInt(request.getParameter("type"));
	Class.forName("org.mariadb.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","tkdwls#123");

	PreparedStatement pstmt = conn.prepareStatement("select "+typeArr[candp]+"  from MATCH_LOG_TB where match_id= ?");
	pstmt.setString(1,cId);
	ResultSet rs = pstmt.executeQuery();
	
	pstmt.close();
	
	
	String idSql= "update MATCH_LOG_TB set "+ gradeArr[candp]+"="+star+" where match_id= ?";
	PreparedStatement stmt1 =conn.prepareStatement(idSql );
	stmt1.setString(1,cId);
	stmt1.executeUpdate();
	stmt1.close();
	rs.next();
	

	String memSql = "update USERES_TB set user_grade+"+star+" where user_id = "+ rs.getString(1);
	PreparedStatement stmt2 =conn.prepareStatement(memSql );
	stmt2.executeUpdate();
	stmt2.close();
	if(rs!=null) rs.close();
	conn.close();

	response.sendRedirect("./main.jsp");

%>
</body>

</html>
