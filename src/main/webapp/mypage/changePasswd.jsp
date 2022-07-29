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
<title>비밀번호 변경</title>
</head>
<body>
<form action="../AccountChangeServlet" method="get">
<h2>변경할 비밀번호를 입력해 주십시오</h2>
기존 비밀번호 입력: <input type="text" name="passwd"><br>
<span id="result">비밀번호 검사 결과 출력</span><br>
변경할 비밀번호: <input type="text" name="chagnePasswd"><br>
비밀번호 재확인: <input type="text" name="checkPasswd"><br>
<button>확인</button>
</form>
</body>
</html>