
<!doctype html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<html lang="ko">
  <head>
    <meta charset="ko">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
    <title>k call</title>

    


    <!-- Bootstrap core CSS -->
<link href="bootstrap.min.css" rel="stylesheet">


<%
	String email="";
        String id="";
        String cName="";
	int useCnt=0;
        Cookie[] cks = request.getCookies();
        if(cks != null){
                for(int i=0; i < cks.length; i++){
                        if(cks[i].getName().equals("matchId")){
                        cName = cks[i].getName();
                        id = cks[i].getValue();
                        }
                }
        }
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


	PreparedStatement pstmt = conn.prepareStatement(  "select match_start_time, charge_amount, charging_fee from MATCH_LOG_TB where match_id= ?");
        pstmt.setString(1,id);
	
	ResultSet rs = pstmt.executeQuery();
  
        pstmt.close();

        rs.next();
	//date=rs.getInt(1);
	//float amount=rs.getFloat(2);
	//int fee=rs.getInt(3);	

	rs.close();
%>


    <style>
.star-rating {
  display:flex;
  flex-direction:
   row-reverse;
  font-size:3em;
  justify-content:space-around;
  padding:0 .2em;
  text-align:center;
  width:5em;
}

.star-rating input {
  display:none;
}

.star-rating label {
  color:#ccc;
  cursor:pointer;
}

.star-rating :checked ~ label {
  color:#0d0af0;
}

.star-rating label:hover,
.star-rating label:hover ~ label {
  color:#0d0af0;
}

    </style>

  </head>
  <body>
    
<main>



<br>
<center>
<div>
<img class="mb-4" src="tomcat.svg" alt="" width="72" height="57">
<h1 class="h3 mb-3 fw-normal">K call</h1>

</div>

</center>

    
  <div class="container py-4">
    <div class="p-5 mb-8 rounded-3" style="background-color:#c8e0bd">
      <div class="container-fluid " style="text-align : center">
        <h2 class="fw-bold">이용해주셔서 감사합니다.</h2>
	<br>
	<h5>
	소요시간 : 
	<br>
	정산금액 : 
	<br>
	충전량 :
	</h5> 
      </div>
    </div>
	<br>   
<form action="endMatch.jsp?tpye=0" submit="post">  
<div class="rounded-3" style="background-color:#c8e0bd; text-align : center">
        <br> 
	<h5 class="fw-bold">만족도를 평가해주세요!</h5>
	<center>
	<div class="star-rating">
	  <input type="radio" id="5-stars" name="rating" value="0.5" >
	  <label for="5-stars" class="star">&#9733;</label>
	  <input type="radio" id="4-stars" name="rating" value="0.4" >
	  <label for="4-stars" class="star">&#9733;</label>
	  <input type="radio" id="3-stars" name="rating" value="0.3" checked="checked">
	  <label for="3-stars" class="star">&#9733;</label>
	  <input type="radio" id="2-stars" name="rating" value="0.2" >
	  <label for="2-stars" class="star">&#9733;</label>
	  <input type="radio" id="1-star" name="rating" value="0.1" >
	  <label for="1-star" class="star">&#9733;</label>
	</div>
        <br>		
	</center>
	<input type="hidden" name="type" value=0>   
</div>
<br>
<center>
<div class="gap-8 d-sm-fiex justify-content-sm-center">
	
	<button type="button" onclick="location.href='writeReport.jsp'"  class="btn btn-outline-secondary btn-sm px-4">신고하기</button>
        <button type="button" onclick="location.href='writeInquiry.jsp'" class="btn btn-outline-secondary btn-sm px-4">문의하기</button>

	
      </div>
<br>

<button type="submit" class="btn btn-primary btn-lg px-4 gap-3" style="text-align:center">홈으로</button>
</form>
</center>
</div>
 </div> 
    <footer class="pt-3 mt-4 text-muted border-top">
      &copy; k call
    </footer>
  </div>
</main>


    
  </body>
</html>

