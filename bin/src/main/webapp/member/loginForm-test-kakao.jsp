<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
@import url(https://fonts.googleapis.com/css?family=Roboto:300);

.login-page {
  width: 360px;
  padding: 8% 0 0;
  margin: auto;
}
.form {
  position: relative;
  z-index: 1;
  background: #FFFFFF;
  max-width: 360px;
  margin: 0 auto 100px;
  padding: 45px;
  text-align: center;
  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
}
.form input {
  font-family: "Roboto", sans-serif;
  outline: 0;
  background: #f2f2f2;
  width: 100%;
  border: 0;
  margin: 0 0 15px;
  padding: 15px;
  box-sizing: border-box;
  font-size: 14px;
}
#resetBtn {
  margin-top: -300px;
  font-family: "Roboto", sans-serif;
  text-transform: uppercase;
  outline: 0;
  background: #4CAF50;
  width: 100%;
  border: 0;
  padding: 15px;
  color: #FFFFFF;
  font-size: 14px;
  -webkit-transition: all 0.3 ease;
  transition: all 0.3 ease;
  cursor: pointer;
}
.form button {
  font-family: "Roboto", sans-serif;
  text-transform: uppercase;
  outline: 0;
  background: #4CAF50;
  width: 100%;
  border: 0;
  padding: 15px;
  color: #FFFFFF;
  font-size: 14px;
  -webkit-transition: all 0.3 ease;
  transition: all 0.3 ease;
  cursor: pointer;
}
.form button:hover,.form button:active,.form button:focus {
  background: #43A047;
}
.form .message {
  margin: 15px 0 0;
  color: #b3b3b3;
  font-size: 12px;
}
.form .message a {
  color: #4CAF50;
  text-decoration: none;
}
.form .register-form {
  display: none;
}
.container {
  position: relative;
  z-index: 1;
  max-width: 300px;
  margin: 0 auto;
}
.container:before, .container:after {
  content: "";
  display: block;
  clear: both;
}
.container .info {
  margin: 50px auto;
  text-align: center;
}
.container .info h1 {
  margin: 0 0 15px;
  padding: 0;
  font-size: 36px;
  font-weight: 300;
  color: #1a1a1a;
}
.container .info span {
  color: #4d4d4d;
  font-size: 12px;
}
.container .info span a {
  color: #000000;
  text-decoration: none;
}
.container .info span .fa {
  color: #EF3B3A;
}
body {
   background: #76b852;   *//* fallback for old browsers */
   background: rgb(141,194,111); 
   background: linear-gradient(90deg, rgba(141,194,111,1) 0%, rgba(118,184,82,1) 50%); */
  font-family: "Roboto", sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;      
}
#link{
	margin-bottom: 10px;
}
#naver{
	margin-top: 0px;
}
</style>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	//아이디 비밀번호 필수
	$("form").submit(function() {
		if ($("#userid").val().length == 0) {
			alert("아이디를 입력해주세요!");
			$("#userid").focus();
			event.preventDefault();
		} else if ($("#passwd").val().length == 0) {
			alert("비밀번호를 입력해주세요!");
			$("#passwd").focus();
			event.preventDefault();
		}
	});
	
});
</script>

<div class="login-page">
  <div class="form">
    <form class="login-form" action="LoginServlet" method="post">
      <input type="text" name="userid" id="userid" placeholder="아이디" autofocus />
      <input type="password" name="passwd" id="passwd" placeholder="비밀번호"/>
      <button type="submit">로그인</button><br>
      <br>
      <button type="reset" id="resetBtn">취소</button>
      <p class="message">Not registered? <a href="MemberUIServlet">Create an account</a></p>
      <p class="message" id="link">
     	<a href="IdFindUIServlet">아이디찾기</a>
      	<a href="PwFindUIServlet">비밀번호찾기</a>
      </p>
    </form>
      <div id="kko">
	    <a id="custom-login-btn" href="javascript:kakaoLogin();">
			<img src="//k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg"
				width="222" alt="카카오 로그인 버튼" />
		</a>
	  </div>
	  <div id="naver">
		<a id="naver-login-btn" href="#">
			<img src="images/naverlogin.png"
				width="222" alt="네이버 로그인 버튼" />
		</a>
	  </div>
  </div>
</div>

<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">
	window.Kakao.init("6967e0449063c04f2ba9d396e18a25a6"); //js key세팅
	
	

</script>