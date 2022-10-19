<!doctype html>


<html lang="ko">
  <head>
    <meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
    <title>K call</title>

<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>

  <script type="text/javascript"></script>
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.12.1.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>

<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>


</head>

<div class="modal modal-signin position-static d-block bg-secondary py-5" tabindex="-1" role="dialog" id="modalSignin">
  <div class="modal-dialog" role="document">
    <div class="modal-content rounded-5 shadow">
  <body class="text-center">
<center>

<br><br><br><br><br><br>

    <img class="mb-4" src="tomcat.svg" alt="" width="150" height="100">
    <h1 class="h3 mb-3 fw-normal">K call</h1>
    <br>


<div id="naver_id_login"></div>
<script type="text/javascript">


                var clientId = "oft9N2ZrNVrvDVRqxRmc";
                var callbackUrl = "http://115.85.182.154:8080/login.jsp";
                var naver_id_login = new naver_id_login(clientId, callbackUrl);
                var state = naver_id_login.getUniqState();
                naver_id_login.setButton("green", 10, 47);
                naver_id_login.setDomain("http://115.85.182.154:8080/login.jsp");
                naver_id_login.setState(state);
                naver_id_login.init_naver_id_login();

		naver_id_login.get_naver_userprofile("naverSignInCallback()");
		function naverSignInCallback() {
    			email = naver_id_login.getProfileData('email');
		setCookie("email",email);    	
		location.href="/checkLogin.jsp";
  		}
</script>

<br>

<a id="kakao-login-btn"></a>
<a href="http://developers.kakao.com/logout"></a>
<script type='text/javascript'>
    Kakao.init('159fa5507b1e443bdc9ea3ac625e6302');  //여기서 아까 발급받은 키 중 javascript키를 사용해준다.


 Kakao.Auth.createLoginButton({
    container: '#kakao-login-btn',
    success: function(authObj) {
      Kakao.API.request({
        url: '/v2/user/me',
        success: function(result) {
	
	var nikk = result.properties.nickname;
                setCookie("email",nikk);

 location.href="/checkLogin.jsp";
},
        fail: function(error) {
          alert(
            'login success, but failed to request user information: ' +
              JSON.stringify(error)
          )
        },
      })
    },
    fail: function(err) {
      alert('failed to login: ' + JSON.stringify(err))
    },
  })

</script>

<script>
var setCookie = function(name, value, exp) {      
	var date = new Date();
      date.setTime(date.getTime() + exp*24*60*60*1000);
      document.cookie = name + '=' + value + ';expires=' + date.toUTCString() + ';path=/';  };


</script>

</div></div></div>

</center>
  </body>
</html>


