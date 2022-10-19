
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

    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/jumbotron/">

    


    <!-- Bootstrap core CSS -->
<link href="bootstrap.min.css" rel="stylesheet">


<%
        String email="";
        String cName="";
	int useCnt=0;
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


	PreparedStatement pstmt = conn.prepareStatement(  "select count(*) from MATCH_LOG_TB where consumer_id= ? or provider_id =?");
        pstmt.setString(1,email);
	pstmt.setString(2,email);
	
	ResultSet rs = pstmt.executeQuery();
  
        pstmt.close();

        if(rs.next()){
		useCnt=rs.getInt(1);
		rs.close();
	}
	else{
                rs.close();
		useCnt=0;
        }
	Statement stmt = conn.createStatement();
        String sql = "select title from NOTICE_TB order by num desc limit 1";
	ResultSet rs2 = stmt.executeQuery(sql);
	
	rs2.next();

	String title = rs2.getString(1);	
	rs2.close();
	stmt.close();
	
	float fee=0;
	Statement ipstmt = conn.createStatement();
	ResultSet rsa = ipstmt.executeQuery( "select fee_charge from FEE_TB" );
	rsa.next();
	fee=rsa.getInt(1);
	ipstmt.close();
	rsa.close();
	conn.close();
%>


    <style>


.sidenav {
  height: 100%;
  width: 0;
  position: fixed;
  z-index: 1;
  top: 0;
  right: 0;
  background-color: #111;
  overflow-x: hidden;
  transition: 0.4s;
  padding-top: 60px;
}

.sidenav a {
  padding: 8px 8px 8px 32px;

  white-space:nowrap;
   text-decoration: none;
  font-size: 25px;
  color: #a0a0a0;
  display: block;
  transition: 0.3s;

}

.sidenav a:hover {
  color: #ffffff;
}

.sidenav .closebtn {
  position: absolute;
  top: 0;
  right: 5px;
  font-size: 36px;
  margin-left: 50px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}

    </style>

    
  </head>
  <body>
    
<main>

<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a href="/reinfo.jsp">개인정보 수정</a>
  <a href="/reportBoard.jsp">문의 및 신고내역</a>	  
  <a href="login.jsp" onclick="logoutBtn()" >로그아웃</a>
  <a href="#" onclick="delCk()">탈퇴하기</a>
</div>

<span style="font-size:30px;cursor:pointer; float:right; margin: 10px" onclick="openNav()">&#9776;</span>

<script>
function openNav() {
  document.getElementById("mySidenav").style.width = "250px";
}

function closeNav() {
  document.getElementById("mySidenav").style.width = "0";
}

function callBtn(){
	location.href="/end.jsp";
}

function logoutBtn(){
	deleteCookie("email");
}

function getCookie(cName) {
      cName = cName + '=';
      var cookieData = document.cookie;
      var start = cookieData.indexOf(cName);
      var cValue = '';
      if(start != -1){
        start += cName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cValue = cookieData.substring(start, end);
      }
      return unescape(cValue);
}

function deleteCookie(name) {
        document.cookie = name + '=; expires=Thu, 01 Jan 1970 00:00:01 GMT;';
}

function delCk(){
	var result = confirm("탈퇴하시면 모든정보가 삭제됩니다. 정말 탈퇴하시겠습니까?");
	if(result ==true)
		location.href="delMember.jsp";
}

</script>


<br><br><br>
<center>
<div>
<img class="mb-4" src="tomcat.svg" alt="" width="72" height="57">
<h1 class="h3 mb-3 fw-normal">K call</h1>
<br>
</div>

</center>

    
  <div class="container py-4">
    <div class="p-5 mb-4 rounded-3" style="background-color:#c8e0bd" onclick="callBtn()">
      <div class="container-fluid " style="text-align : center">
        <h1 class="display-5 fw-bold">K CALL</h1>
    </div>
	</div>
    <div class="row align-items-sm-stretch">
      <div class="col-6">
        <div class="h-100 p-5 bg-light border rounded-3" style="text-align: center">
          <h4>이번달<br> 이용횟수<br><%=useCnt%>회</h4> 
        </div>
      </div>
      <div class="col-6">
        <div class="h-100 p-5 bg-light border rounded-3"  style="text-align: center">
			<br> <h4>충전요금</h4><h6><%=fee%></h6>
        </div>
      </div>
    </div>
     <br>

    <div class="mb-4 bg-light rounded-3 border"  onclick="location.href='/noticeBoard.jsp'">
      <div class="container-fluid" >
        <h6><%=title%></h6>
    </div>
	</div>

    <footer class="pt-3 mt-4 text-muted border-top">
      &copy; k call
    </footer>
  </div>
</main>


    
  </body>
</html>

