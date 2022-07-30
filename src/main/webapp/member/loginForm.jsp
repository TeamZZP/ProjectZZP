<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	//아이디 비밀번호 필수
	$("form").submit(function() {
		if ($("#userid").val().length == 0) {
			alert("userid 필수");
			$("#userid").focus();
			event.preventDefault();
		} else if ($("#passwd").val().length == 0) {
			alert("passwd 필수");
			$("#passwd").focus();
			event.preventDefault();
		}
	});
});
</script>
<form action="LoginServlet" method="post">
	아이디:<input type="text" name="userid" id="userid"><br>
	비밀번호:<input type="password" name="passwd" id="passwd"><br> <input
		type="submit" value="로그인"> <input type="reset" value="취소"><br>
</form>
<a>회원가입</a>
<a>아이디</a>
<a>회원가입</a><br>
<a id="custom-login-btn" href="javascript:loginWithKakao();">
<img src="//k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg"
	width="222" alt="카카오 로그인 버튼" />
</a><br>
<a id="naver-login-btn" href="#">
<img src="images/naverlogin.png"
	width="222" alt="네이버 로그인 버튼" />
</a>