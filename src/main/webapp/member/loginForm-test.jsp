<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	Kakao.init("6967e0449063c04f2ba9d396e18a25a6");
	Kakao.isInitialized();
	console.log(Kakao.Auth.getAccessToken());
	console.log(Kakao.isInitialized());
	$("#header_login_bar").hide();
	
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

function loginWithKakao() {
	Kakao.Auth.authorize({
		redirectUri : 'http://localhost:8088/ProjectZZP/main.jsp',
	});
}
</script>
<form action="LoginServlet" method="post">
	아이디:<input type="text" name="userid" id="userid"><br>
	비밀번호:<input type="text" name="passwd" id="passwd"><br> <input
		type="submit" value="로그인"> <input type="reset" value="취소"><br>
</form>
<a id="custom-login-btn" href="javascript:loginWithKakao();"> <img
	src="//k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg"
	width="222" alt="카카오 로그인 버튼" />
</a>
<jsp:include page="../common/footer.jsp" flush="true"></jsp:include>