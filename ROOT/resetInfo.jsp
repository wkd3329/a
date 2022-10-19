
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>


<%
	String[] ar={"서울 ","부산 ","대구 ","인천 ","광주 ","대전 ","울산 ","세종 ","경기도 ","강원도 ","충청북도 ","충청남도 ","전라북도 ","전라남도 ","경상북도 ","경상남도 ","제주도 "};
        String[] cc={"기아 ","르노삼성 ","미니 ","벤츠 ","볼보 "," 쉐보레 "," 쌍용 ","아우디 ","제네시스 ","캐딜락 ","테슬라 ","포르쉐 ","현대","BMW "};

	Cookie[] cookies = request.getCookies() ;
	String cName="";
	String cValue="";
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
	
	String flat = " ";
	if(cValue.contains("@naver.com")){	
		flat = "1";
	}
	else
	{
		flat = "0"; 
	}
	String phone = request.getParameter("phone");
 int  area = Integer.parseInt(request.getParameter("area"));
        String dong = request.getParameter("dong");
        String arr=ar[area]+dong;

	String msg = request.getParameter("msgcb");
	String car = request.getParameter("ccar");
int  cf = Integer.parseInt(request.getParameter("car"));
        String carName = cc[cf]+car;

	

	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","tkdwls#123");

        Class.forName("org.mariadb.jdbc.Driver");

	String sql =  "update USERS_TB set user_phone= ? ,  user_message= ?,  user_area=?, user_car1=? where user_id= ?";
		
	// 쿼리
	PreparedStatement stmt =conn.prepareStatement(sql );
	stmt.setString(5,cValue);
        stmt.setString(1,phone);
        stmt.setString(2,msg);
        stmt.setString(3,arr);
    	stmt.setString(4,carName);
  	  stmt.executeUpdate();

	stmt.close();
	conn.close();

	response.sendRedirect("./main.jsp");

%>
</body>

</html>
