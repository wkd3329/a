
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
</head>
<body>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.1.min.js"></script>
<script type="text/javascript">
function setCar(comp){
var kia =["EV6","니로","봉고3"];
var sam=["SM3 ZE"];
var mini=["일렉트릭"];
var benz=["EQA","EQC","EQV","EQS"];
var vol=["XC"];
var sha=["볼트"];
var ssang=["코란도"];
var audi=["E-TRON"];
var gen=["GV60","G80"];
var cadil=["LYTIQ"];
var tesla=["모델3","모델Y","모델S","모델X"];
var por=["타이칸"];
var hyun=["아이오닉5","아이오닉6","포터2","코나"];
var bmw=["I3","IX3","IX"];

var t = document.getElementById("ccar");

if(comp.value=="0" ) var d=kia;
else if(comp.value=="1" ) var d=sam;
else if(comp.value=="2" ) var d=mini;
else if(comp.value=="3" ) var d=benz;
else if(comp.value=="4" ) var d=vol;
else if(comp.value=="5" ) var d=sha;
else if(comp.value=="6" ) var d=ssang;
else if(comp.value=="7" ) var d=audi;
else if(comp.value=="8" ) var d=gen;
else if(comp.value=="9" ) var d=cadil;
else if(comp.value=="10" ) var d=tesla;
else if(comp.value=="11" ) var d=por;
else if(comp.value=="12" ) var d=hyun;
else if(comp.value=="13" ) var d=bmw;

t.options.length=0;

for(x in d){
	var opt = document.createElement("option");
	opt.value=d[x];
	opt.innerHTML = d[x];
	t.appendChild(opt);
} 

}
function setArea(comp){
var se = ["종로구","중구","용산구","성동구","광진구","동대문구","중랑구","성북구","강북구","도봉구","노원구","은평구","서대문구","마포구","양천구","강서구","구로구","금천구","영등포구","동작구","관악구","서초구","강남구","송파구","강동구"];
var bs = ["중구","성구","동구","영도구","부산진구","동래구","남구","북구","해운대구","사하구","금정구","강서구","연제구","수영구","사상구","거장"];
var dg = ["중구","동구","서구","남구","북구","수성구","달서구","달성"];
var ic = ["중구","동구","미추홀구","연수구","남동구","부평구","계양구","서구","강화","옹진"];
var gj = ["동구","서구","남구","북구","광산구"];
var dj= ["동구","중구","서구","유성구","대덕구"];
var us =["중구","남구","동구","북구","울주"];
var sj =[ "조치원읍","금남","부강","서종","연기","연동","연서","장","전동","전의","고운동","다정동","대평동","도담동","반곡동","보람동","새롬동","소담동","아름동","종촌동","한솔동","해밀동"];
var gg =["고양","수원","용인","과천","광명","광주","구리","군포","김포","남양주","동두천","부천","성남","시흥","안산","산성","안양","양주","여주","오산","의왕","의정부","이천","파주","평택","포천","하남","화성","가평","양평","연천"];
var gw =[ "강릉","동해","삼척","속초","원주","춘천","태백","고성","양구","양양","영월","인제","정선","철원","평창","홍천","화천","횡성"];
var cb=["제천","청주","충주","괴산","단양","보은","영동","옥천","음성","증평","진천"];
var cn=["계룡","공주","논산","당진","보령","서산","아산","천안","금산","부여","서천","예산","청양","태안","홍성"];
var jb=["군산","김제","남우너","익산","전주","정읍","고창","무주","부안","순창","완주","임실","장수","진안구"];
var jn=["광양","나주","목포","순천","여수","강진","고흥","곡성","구례","담양","무안","보성","신안","영광","영암","완도","장성","장흥","진도","함평","해남","화순"];
var gb=["경산","경주","구미","김천","문경","상주","안동","영주","영천","포항","고령","군위","봉화","성주","영덕","영양","예천","울릉","울진","의성","청도","청송","칠곡"];
var gn =["창원","거제","김해","밀양","사천","양산","진주","통영","거창","고성","남해","산청","의령","창녕","하동","함안","함양","합천"];
var jj = ["제주시","서귀포"];

var t = document.getElementById("dong");

if(comp.value=="0") var d=se;
else if(comp.value=="1") var d=bs;
else if(comp.value=="2") var d=dg;
else if(comp.value=="3") var d=ic;
else if(comp.value=="4") var d=gj;
else if(comp.value=="5") var d=dj;
else if(comp.value=="6") var d=us;
else if(comp.value=="7") var d=sj;
else if(comp.value=="8") var d=gg;
else if(comp.value=="9") var d=gw;
else if(comp.value=="10") var d=cb;
else if(comp.value=="11") var d=cn;
else if(comp.value=="12") var d=jb;
else if(comp.value=="13") var d=jn;
else if(comp.value=="14") var d=gb;
else if(comp.value=="15") var d=gn;
else if(comp.value=="16") var d=jj;

t.options.length=0;

for(x in d){
        var opt = document.createElement("option");
        opt.value=d[x];
        opt.innerHTML = d[x];
        t.appendChild(opt);
}
}

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

function ck() {
      var text = document.getElementById('phone').value;
      var regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
        if(regPhone.test(text) == true){
                return true;
        }
        else
        {
                alert("올바르지 않은 핸드폰 번호입니다.");
                return false;
        }
}


const hypenTel = (target) => {
 target.value = target.value
   .replace(/[^0-9]/g, '')
   .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
}

</script>


<%

	String email="";
        String cName="";
	Cookie[] cks = request.getCookies();
        if(cks != null){
                for(int i=0; i < cks.length; i++){
                        if(cks[i].getName().equals("email")){
                        cName = cks[i].getName();
                        email = cks[i].getValue();
                        }
                }
        }


	Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/test","root","tkdwls#123");

	Class.forName("org.mariadb.jdbc.Driver");
	PreparedStatement pstmt = conn.prepareStatement(  "select user_phone, user_car1, user_area from USERS_TB where user_id= ?");
	pstmt.setString(1,email);
        ResultSet rs = pstmt.executeQuery();
        conn.close();
        pstmt.close();
	
	rs.next();
	int num=0;
	String phone=rs.getString("user_phone");
        String car=rs.getString("user_car1");
        String area=rs.getString("user_area");
	String[] ar=area.split(" ");
	String[] ccar=car.split(" ");	
	String[] arr={"서울특별시 ","부산광역시 ","대구광역시 ","인천광역시 ","광주광역시 ","대전광역시 ","울산광역시 ","세종특별자치시 ","경기도 ","강원도 ","충청북도 ","충청남도 ","전라북도 ","전라남도 ","경상북도 ","경상남도 ","제주도 "};
	
	for(int i=0;i<17;i++){
		if(arr[i].equals(ar))
			num=i;
				
}
	rs.close();

%>




<form action="./resetInfo.jsp" method="post" onsubmit="return ck();">
	<br>
	<br>
	<br>
	<div class="container">
		<main>
		<div class="py-5 text-center">
			<img class="d-block mx-auto mb-4" src="kdnlogo.png" alt="" width="150" height="100">
			<br>
			<h1 class="h3 mb-3 fw-normal">개인정보수정</h1>
			<br>
		</div>
		<div class="col-md-7 col-lg-8">
			<div class="row g-3">
	           		 <div class="col-12">

					<label for="phone" class="form-label" required>전화번호</label>
					<input type="tel" class="form-control"  name="phone" id="phone" placeholder="010-0000-0000" value="<%=phone%>"  oninput="hypenTel(this)" maxlength="13">
				</div>
				<br>
				<div class="col-12">
				<label for="carName" class="form-label">제조사</label>
                                        <select  value="<%=ccar[0]%>"  class="form-control" name="car" id="car" onchange="setCar(this)" required>
                                                <option value="0">기아</option>
                                                <option value="1">르노삼성</option>
                                                <option value="2">미니</option>
                                                <option value="3">벤츠</option>
                                                <option value="4">볼보</option>
                                                <option value="5">쉐보레</option>
                                                <option value="6">쌍용</option>
                                                <option value="7">아우디</option>
                                                <option value="8">제네시스</option>
                                                <option value="9">캐딜락</option>
                                                <option value="10">테슬라</option>
                                                <option value="11">포르쉐</option>
                                                <option value="12">현대</option>
                                                <option value="13">BMW</option>
                                        </select>
                                        <label for="carName" class="form-label"></label>
                                        <select class="form-control" name="ccar" id="ccar" required>
                                                <option value="<%=ccar[1]%>"><%=ccar[1]%></option>
                                        </select>

				</div>
				<br>
				<div class="col-12">
					<label for="usrArar" class="form-label">권역</label>
					<select class="form-control" name="area" id="area" onchange="setArea(this)" required>
						<option value="<%=num%>"><%=ar[0]%></option>
                                                <option value="0">서울</option>
                                                <option value="1">부산</option>
                                                <option value="2">대구</option>
                                                <option value="3">인천</option>
                                                <option value="4">광주</option>
                                                <option value="5">대전</option>
                                                <option value="6">울산</option>
                                                <option value="7">세종</option>
                                                <option value="8">경기도</option>
                                                <option value="9">강원</option>
                                                <option value="10">충북</option>
                                                <option value="11">충남</option>
                                                <option value="12">전북</option>
                                                <option value="13">전남</option>
                                                <option value="14">경북</option>
                                                <option value="15">경남</option>
                                                <option value="16">제주</option>
                                        </select>
                                        <label for="dong" class="form-label"></label>
                                        <select class="form-control" name="dong" id="dong" required>
                                                <option value="<%=ar[1]%>"><%=ar[1]%></option>
                                        </select>
	
			</div>
                         <br>
			<center>
				<label for="usrMsg" class="form-label">도움요청 메세지 수신 여부</label>
				<input type="checkbox" name="msgcb" id="switch">
				</label>
			</center>
			</div>
		</div>
		<br>
		<br>
		<br>
		<center>
		<button class="w-100 btn btn-primary btn-lg" type="submit">저장</button>
		</center>
	</form>
</body>
</html>
