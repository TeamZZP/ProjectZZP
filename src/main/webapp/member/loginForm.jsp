<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> 
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">

window.kakao.init("6967e0449063c04f2ba9d396e18a25a6");

function kakaoLogin() {
	window.Kakao.Auth.login({
		scope: 'profile_nickname, account_email', //정보받아오기
		success: function(authObj) {
			console.log(authObj);
			window.Kakao.API.request({
				url:'/v2/user/me',
				success: res => {
					const Kakao_account res.Kakao_account;
					console.log(Kakao_account);
				}
			});
		}
	});
}

$(document).ready(function(){
	
//아이디 비밀번호 필수
$("form").submit(function() {
	if ($("#userid").val().length==0) {
		alert("userid 필수");
		$("#userid").focus();
		event.preventDefault();
	} else if ($("#passwd").val().length==0) {
		alert("passwd 필수");
		$("#passwd").focus();
		event.preventDefault();
	}
});

});

/* 
Kakao.init('6967e0449063c04f2ba9d396e18a25a6');
console.log( Kakao.isInitialized() );  */

</script>

<!-- <script type="text/javascript">
Kakao.init('6967e0449063c04f2ba9d396e18a25a6');
console.log( Kakao.isInitialized() ); 

  /* function loginWithKakao() {
    Kakao.Auth.login({
      success: function(authObj) {
        alert(JSON.stringify(authObj))
      },
      fail: function(err) {
        alert(JSON.stringify(err))
      },
    })
  } */
</script> -->

<form action="LoginServlet" method="post">
아이디:<input type="text" name="userid" id="userid"><br>
비밀번호:<input type="text" name="passwd" id="passwd"><br>
<input type="submit" value="로그인">
<input type="reset" value="취소"><br>
</form>
 <a id="custom-login-btn" href="javascript:kakaoLogin()">
  <img
    src="//k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg"
    width="222"
    alt="카카오 로그인 버튼"
  />
</a>