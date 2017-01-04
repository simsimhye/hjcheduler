<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>로그인</title>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="/hjscheduler/js/jquery-3.1.0.js"></script>
<script charset="UTF-8" src="https://apis.daum.net/maps/maps3.js?apikey=9d9302587708b1400c25a55a9697b492"></script>
<style>
body{position:relative; background-image: url("./images/71.jpg"); background-repeat:no-repeat;background-size:100%}
#login{position:absolute; background :rgba(255, 255, 255, 0.2);width:280px;height:50px;left:40%;top:300px;font-size:20px;border-radius: 10px;}
#login2{position:absolute; background :rgba(255, 255, 255, 0.2);width:280px;height:50px;left:40%;top:300px;font-size:20px;border-radius: 10px;}
img{position:absolute;margin-left:12px;margin-top:8px;left:40%;top:300px;}
a{text-decoration: none; color:white; font-weight:bold; margin-bottom:10px; padding-left:10px;}
#custom-login-btn{position:absolute;margin-top:-5px;margin-left:54px;margin-top:10px;}
</style>
</head>
<body>

<img src="/hjscheduler/images/kakao.jpg" alt="카카오톡로그인"><div id="login"><div id="login2"><a id="custom-login-btn" href="javascript:loginWithKakao();">카카오톡으로 로그인</a></div></div>
<img src="/hjscheduler/images/face_book_login.png" alt="페이스북 로그인">


<script type="text/javascript">

// 사용할 앱의 JavaScript 키를 설정해 주세요.
var authObj;
var res;
Kakao.init('1d9294d9807d2ecff8d0ca2bf14233ef');

// 카카오 로그인 버튼을 생성합니다.
function loginWithKakao() {
    Kakao.Auth.login({
		persistAccessToken: true, 
		persistRefreshToken: true,
      	success: function(authObj) {
      		getKakaotalkUserProfile(); 
      		/* //createKakaotalkLogout(); */ 
        },
      fail: function(err) {
        alert("실패",JSON.stringify(err));
      }
    });
  };

	function getKakaotalkUserProfile() {
		Kakao.API.request({
			url : '/v1/user/me',
			success : function(res) {				
				// alert(JSON.stringify(res));
			alert(res.properties.nickname+" 님 환영합니다!");
			login(res);
			},
			fail : function(error) {
				   alert(JSON.stringify(error)); 
			}
		});

	}
	
function login(res){
	
	$.ajax({
		url:"/hjscheduler/loginAuth.do",
		type:"POST", 
		data:{id : res.id},
		dataType:"json"
	})
	.done(function(result){
		link();		
	});	
	
}

function link(){		
	window.location.href=("/hjscheduler/schedule/day_schedule.do"); 
}	
	
	
</script>
</body>
</html>