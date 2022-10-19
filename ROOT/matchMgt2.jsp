<!doctype html>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
    <title>amdin</title>
    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/dashboard/">
    <link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">



<%
        Connection conn = null;
        Statement  stmt = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

	String conArr[] = { "match_id","consumer_id","provider_id","match_start_time","match_end_step","match_location","charge_amount","charging_fee","consumer_car","provider_charger","consumer_grade","provide_grade"};
	String colName[] ={"매치번호","수요자ID","공급자ID","매치날짜","매치단계","매치장소","충전양","충전요금","수요자차종","공급자차종","수요자별점","공급자별점"}; 
	String order = request.getParameter("order");
	String con = request.getParameter("con");
	int col = Integer.parseInt(request.getParameter("col"));
	String sql="";

	if(order.equals("0")){
		sql = "SELECT * FROM MATCH_LOG_TB where "+conArr[col]+" like \'%"+con+"%\'";
	}
	else if (order.equals("1")){
                sql = "SELECT * FROM MATCH_LOG_TB where "+conArr[col]+" like \'%"+con+"%\' order by " +conArr[col] ;
	}
        else if (order.equals("2")){
		sql = "SELECT * FROM MATCH_LOG_TB where "+conArr[col]+" like \'%"+con+"%\' order by " +conArr[col] +" desc";
	}
	
	Class.forName("org.mariadb.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","tkdwls#123");
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();

%>



<script>

function logoutBtn(){
        deleteCookie("email");
}


</script>
    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>

    
    <!-- Custom styles for this template -->
    <link href="dashboard.css" rel="stylesheet">
  </head>
  <body>
    
<header class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
  <a class="navbar-brand col-md-3 col-lg-2 me-0 px-3" href="#">k call</a>
  <button class="navbar-toggler position-absolute d-md-none collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class=" w-100" ></div>
  </div>
</header>

<div class="container-fluid">
  <div class="row">
    <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
      <div class="position-sticky pt-3">
        <ul class="nav flex-column">
          <li class="nav-item">
            <a class="nav-link" href="dashboard.jsp">
              <span data-feather="home"></span>
              이용자통계 
            </a>
          </li>
	  <li class="nav-item">
            <a class="nav-link" href="/memberMgt.jsp">
              <span data-feather="users"></span>
             회원관리
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" aria-current="page"  href="matchMgt.jsp">
              <span data-feather="file"></span>
              매칭관리
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="reportMgt.jsp">
              <span data-feather="file-text"></span>
             신고내역 
            </a>
         </li>
	 <li class="nav-item">
            <a class="nav-link" href="inquiryMgt.jsp">
              <span data-feather="file-text"></span>
              문의내역
            </a>
          </li>
	  <li class="nav-item">
              <a class="nav-link" href="noticeMgt.jsp">
                <span data-feather="file-text"></span>
                공지사항
              </a>
           </li>

	  <li class="nav-item">
            <a onclick="logoutBtn" class="nav-link" href="ex.jsp">
              <span>  </span>
              로그아웃
            </a>
          </li>

        </ul>

      </div>
    </nav>

    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">매치로그</h1>
        <div class="btn-toolbar mb-2 mb-md-0">
          <div class="btn-group me-2">
          </div>
          </button>
        </div>
      </div>

 <table>
         <tr>
         <form action="./matchMgt2.jsp" method="post">
               <th scope="col"></th>
               <th scope="col"></th>
               <th scope="col">정렬기준</th>
               <th scope="col">
                 <select name="order" style="height:100%">
                         <option value="0">구분없음</option>
                         <option value="1">오름차순</option>
                         <option value="2">내림차순</option>
                 </select>
               </th>
               <th scopr="col">검색</th>
               <th scope="col">
                  <select name="col" style="height:100%">
                          <option value="0">매치번호</option>
                          <option value="1">수요자ID</option>
                          <option value="2">공급자ID</option>
                          <option value="3">매치날짜</option>
                          <option value="4">매치단계</option>
                          <option value="5">매치장소</option>
                          <option value="6">충전양</option>
                          <option value="7">충전요금</option>
                          <option value="8">수요자차종</option>
                          <option value="9">공급자차종</option>
                          <option value="10">수요자별점</option>
                          <option value="11">공급자별점</option>

                  </select>
                </th>

               <th scope="col" colsapn=><input name="con" type="text"></th>
               <th scope="col"><button type="submit" class="btn w-100 btn-outline-secondary btn-sm">적용</button>
               </th>
         </form>
          </tr>
 </table>
   <div class="table-responsive">
          <table class="table table-striped table-sm">
          <thead>

            <tr style="text-align:center">
              <th style="bored:1px" scope="col">기준:<%=colName[col]%></th>
              <th scope="col">수요자</th>
              <th scope="col">공급자</th>
	      <th scope="col">매치날짜</th>
              <th scope="col">단계</th>
	      <th scope="col">장소</th>
              <th scope="col">자세히</th>
            </tr>
          </thead>
        
<%
 	while(rs.next()) {
		String stdd=rs.getString(conArr[col]);
		String mId=rs.getString("match_id");
                String cId=rs.getString("consumer_id");
                String pId=rs.getString("provider_id");
                String loc=rs.getString("match_location");
                Date d = rs.getDate("match_start_time");
 		String step=rs.getString("match_end_step");	
	
%>
	        <tr style="text-align:center">
                <td><%=stdd%></td>
                <td><%=cId%></td>
		<td><%=pId%></td>
                <td><%=d%></td>
                <td><%=step%></td>
		<td><%=loc%></td>
		<th> <button class="btn btn-outline-secondary btn-sm" onclick="location.href='matchMgt3.jsp?num=<%=mId%>';">자세히</button></th>
                </tr>
 
         
<%
}
	  if(rs != null) rs.close();
          if(stmt != null) stmt.close();
          if(pstmt != null) pstmt.close();
          if(conn != null) conn.close();

%>



	</table>
      </div>
    </main>
  </div>
</div>


<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>


      <script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js" integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE" crossorigin="anonymous"></script><script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js" integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha" crossorigin="anonymous"></script><script src="dashboard.js"></script>
  </body>
</html>

