<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 프로필</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#close").on("click", function() {
			close();
		});//end fn
	});//end ready
</script>
</head>
<body>
<form action=" " method="post">
<img alt="" src="peng.jpg" width="250px" height="250px"><br><!-- 이쁘게 동그랗게 보이면 좋겠다 -->
프로필 소개<br>
<input type="text" name="profileMesg" style="width: 300px; height: 150px" value="프로필 메세지를 작성하세요 *-*"><br><!-- DB에 없음 -->
<button id="submit">확인</button>&nbsp;&nbsp;<button id="close">창 닫기</button>
</form>
</body>
</html>