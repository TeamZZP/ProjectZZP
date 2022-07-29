<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$("#changePasswd").on("click", function() {
			var popupX = (window.screen.width / 2) - (200 / 2);
			var popupY= (window.screen.height / 2) - (300 / 2);
			window.open("mypage/changePasswd.jsp","",'status=no, height=300, width=200, left='+ popupX + ', top='+ popupY);
		});
		$("#changeEmail").on("click", function() {
			var popupX = (window.screen.width / 2) - (200 / 2);
			var popupY= (window.screen.height / 2) - (300 / 2);
			window.open("mypage/changeEmail.jsp","",'status=no, height=300, width=200, left='+ popupX + ', top='+ popupY);
		});
		$("#changeAddress").on("click", function() {
			var popupX = (window.screen.width / 2) - (200 / 2);
			var popupY= (window.screen.height / 2) - (300 / 2);
			window.open("mypage/checkAddress.jsp","",'status=no, height=300, width=200, left='+ popupX + ', top='+ popupY);
		});
		$("#changeProfile").on("click", function() {
			var popupX = (window.screen.width / 2) - (200 / 2);
			var popupY= (window.screen.height / 2) - (300 / 2);
			window.open("mypage/changeProfile.jsp","",'status=no, height=300, width=200, left='+ popupX + ', top='+ popupY);
		});
	});
</script>
<form>
마이페이지 accountFrom.jsp<br>
이름:<input type="text" name="username" value="이름" readonly="readonly"/><br><!-- 수정 불가 or 퍼센트로 데이터 가져옴 -->
비밀번호:<input type="text" name="passwd" value="비밀번호" readonly="readonly">
	<button id="changePasswd">변경</button><br>
<br>
이메일:<input type="text" name="email1" readonly="readonly">@
	<input type="text" name="email2" placeholder="직접입력" id="email2" readonly="readonly">
	<select id="emailSel">
		<option value="daum.net">daum.net</option>
		<option value="naver.com">naver.com</option>
		<option value="google.com">google.com</option>
	</select>
	<button id="changeEmail">변경</button><br>
주소:<input type="text" name="post" id="sample4_postcode" placeholder="우편번호" readonly="readonly"><br><!-- script 긁어서 자식창에 넣기 -->
	<input type="text" name="addr1" id="sample4_roadAddress" placeholder="도로명주소" readonly="readonly">
	<input type="text" name="addr2" id="sample4_jibunAddress" placeholder="지번주소" readonly="readonly">
	<span id="guide" style="color:#999"></span>
	<button id="changeAddress">주소 관리</button><br>
<input type="text" name="membership" value="멤버쉽" readonly="readonly"/><br>
<input type="text" name="changeProfile" value="프로필 변경" readonly="readonly"/>
	<button id="changeProfile">변경</button><br>
</form>