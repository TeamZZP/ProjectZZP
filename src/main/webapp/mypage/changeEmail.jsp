<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	span {
		color: red;
	}
</style>
<title>이메일 변경</title>
</head>
<body>
<form action="../AccountChangeServlet" method="get">
<h2>변경할 이메일을 입력해 주십시오</h2>
기존 비밀번호 입력: <input type="text" name="passwd"><br>
<span id="result">비밀번호 검사 결과 출력</span><br>
이메일: <input type="text" name="email1">@
	<input type="text" name="email2" placeholder="직접입력" id="email2">
	<select id="emailSel">
		<option value="daum.net">daum.net</option>
		<option value="naver.com">naver.com</option>
		<option value="google.com">google.com</option>
	</select>
<button>확인</button>
</form>
</body>
</html>