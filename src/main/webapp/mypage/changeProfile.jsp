<%@ page import="com.dto.MemberDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	MemberDTO dto=(MemberDTO) session.getAttribute("login");
	String userid=dto.getUserid();
%>
<html>
<head>
<meta charset="UTF-8">
<title>내 프로필</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("img").on("click", function() {
			console.log("click");
			//프로필 이미지 변경
		});//end fn
		
		$("#profile_txt").on("click", function() {
			$(this).val("");
		});//end fn
		
		$("#submit").on("click", function() {
			$("form").attr("action", "../AccountChangeServlet");
		});//end fn
		
		$("#close").on("click", function() {
			close();
		});//end fn
	});//end ready
</script>
</head>
<body>
<form action=" " method="post" enctype="multipart/form-data">
<input type="hidden" name="userid" id="userid" value="<%= userid %>">
<img alt="none" src="peng.jpg" width="250px" height="250px"><br><!-- 이쁘게 동그랗게 보이면 좋겠다 -->
<%-- <img alt="none" src="upload/${path}" width="250px" height="250px"><br> --%>
<input type="file" name="profile_img"><br>
<br>
<b>프로필 소개</b><br>
<input type="text" name="profile_txt" id="profile_txt" style="width: 300px; height: 150px" value="프로필 메세지를 작성하세요 *-*"><br><!-- DB에 없음 -->
<br>
<button id="submit">확인</button>&nbsp;&nbsp;<button id="close">창 닫기</button>
</form>
</body>
</html>