
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>개인정보 입력</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.88.1">
<link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/checkout/">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">
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


<%
        String a=request.getParameter("fg");
%>

</head>
<body>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.1.min.js"></script>
<script type="text/javascript">




function getCookie(cookie_name) {
  var x, y;
  var val = document.cookie.split(';');
  for (var i = 0; i < val.length; i++) {
    x = val[i].substr(0, val[i].indexOf('='));
    y = val[i].substr(val[i].indexOf('=') + 1);
    x = x.replace(/^\s+|\s+$/g, ''); // 앞과 뒤의 공백 제거하기
    if (x == cookie_name) {
 return unescape(y); // unescape로 디코딩 후 값 리턴
    }
  }
}

</script>


<form action="./submitNotice.jsp" method="post" onsubmit="return ck();">
        <br>
        <br>
        <br>
        <br>
        <div class="container">
                <main>
<div class="py-5 text-center">
                        <img class="d-block mx-auto mb-4" src="tomcat.svg" alt="" width="72" height="57">
                        <br>
                        <h1 class="h3 mb-3 fw-normal">K call</h1>

 <br>
                </div>
                <div class="col-md-7 col-lg-8">
                        <div class="row g-3">
    <label for="tit" class="form-label" required><h3>제목</h3></label>
                                         <input type="text"class="form-control"  name="tit" id="tit" placeholder="내용을 입력해주세요" required>
                           
                                <br>
                                <div class="col-12">
                                        <label for="cont" class="form-label" required><h3>내용</h3></label>
                                        <input type="text" style="height:40%"class="form-control"  name="cont" id="cont" placeholder="내용을 입력해주세요">
                                </div>
                                

                               <br><br> 
                <center>
                <button class="w-100 btn btn-primary btn-lg" type="submit">제출</button>

                <button class="w-100 btn btn-primary btn-lg" type="button" onclick="location.href='noticeMgt.jsp'">뒤로</button>


                </center>
        </form>
</body>
</html>
