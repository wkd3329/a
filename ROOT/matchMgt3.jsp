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
	String num = request.getParameter("num");
        String sql_select = "SELECT * FROM MATCH_LOG_TB where match_id = "+num;

	Class.forName("org.mariadb.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","tkdwls#123");
        pstmt = conn.prepareStatement(sql_select);
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

</table>     
  <div class="table-responsive">
         <table class="table table-striped table-sm">
         
     
<%
		rs.next();
		String mId=rs.getString("match_id");
                String cId=rs.getString("consumer_id");
                String pId=rs.getString("provider_id");
		String step= rs.getString("match_end_step");
                String cStar= rs.getString("consumer_grade");
                String pStar= rs.getString("provider_grade");
                

		Date mst = rs.getDate("match_start_time");
                Date cft = rs.getDate("consumer_fix_time");	
                Date cat = rs.getDate("consumer_arr_time");
                Date pat = rs.getDate("provider_arr_time");
                Date cst = rs.getDate("charge_start_time");
                Date met = rs.getDate("charge_end_time");

                String cloc=rs.getString("consumer_location");
                String ploc=rs.getString("provider_location");
                String mloc=rs.getString("match_location");

 				
                String cAmount= rs.getString("charge_amount");
                String cFee= rs.getString("charging_fee");
                String cCar= rs.getString("consumer_car");
                String pCar= rs.getString("provider_charger");

	
%>

		<tr style="text-align:center">
                 <td>매치ID</td>
                 <td>소비자ID</td>
                 <td>공급자ID</td>
                 <td>매치단계</td>
                 <td>소비자별점</td>
                 <td>공급자별점</td>
		</tr>

	        <tr style="text-align:center">
                 <td><%=mId%></td>
                 <td><%=cId%></td>
 		 <td><%=pId%></td>
                 <td><%=step%></td>
                 <td><%=cStar%></td>
   		 <td><%=pStar%></td>
                </tr>

                <tr style="text-align:center">
                  <td>매치시작시간</td>
                  <td>매치확정시간</td>
                  <td>소비자도착시간</td>
                  <td>공급자도착시간</td>
                  <td>충전시작시간</td>
                  <td>매치종료시간</td> 
		</tr>

		<tr style="text-align:center">
                 <td><%=mst%></td>
                 <td><%=cft%></td>
                 <td><%=cat%></td>
                 <td><%=pat%></td>
                 <td><%=cst%></td>
                 <td><%=met%></td>
                 </tr>

                 <tr style="text-align:center">
                  <td colspan=2>소비자출발위치</td>
                  <td colspan=2>공급자출발위치</td>
                  <td colspan=2>충전위치</td>
		</tr>

		<tr style="text-align:center">
                 <td colspan=2><%=cloc%></td>
                 <td colspan=2><%=ploc%></td>
                 <td colspan=2><%=mloc%></td>
                </tr>

                <tr style="text-align:center">
                 <td>충전량</td>
                 <td>충전요금</td>
                 <td colspan=2>소비자 차종</td>
                 <td colspan=2>공급자 차종</td>
		</tr>
 
		<tr style="text-align:center">
                 <td><%=cAmount%></td>
                 <td><%=cFee%></td>
                 <td colspan=2><%=cCar%></td>
                 <td colspan=2><%=pCar%></td>
                 </tr>


         
<%
	  if(rs != null) rs.close();
          if(stmt != null) stmt.close();
          if(pstmt != null) pstmt.close();
          if(conn != null) conn.close();

%>



	</table>
	
 
                  <button class="w-100 btn btn-primary btn-lg" type="button" onclick="history.back()">뒤로가기</button>


      </div>
    </main>
  </div>
</div>


<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>


      <script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js" integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE" crossorigin="anonymous"></script><script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js" integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha" crossorigin="anonymous"></script><script src="dashboard.js"></script>
  </body>
</html>

