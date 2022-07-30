<%@page import="com.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	MemberDTO dto=(MemberDTO) session.getAttribute("login");
	String passwd=dto.getPasswd();
%>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	span {
		color: red;
	}
</style>
<title>비밀번호 변경</title>

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#passwd").on("keyup", function() {
			if ($(this).val()=="<%= passwd %>") {
				$("#result").text("비밀번호 일치");//일치하면 변경 가능//기존과 다른 비번으로 변경
				$(".pw").removeAttr("readonly");
			} else {
				$("#result").text("비밀번호 불일치");//불일치하면 변경 불가//readonly로 설정하고 속성을 변경? 알람창 띄울까
			}
		});
		$("#checkPasswd").on("keyup", function() {
			if ($(this).val()==$("#chagnePasswd").val()) {
				$("#result2").text("비밀번호 일치");
			} else {
				$("#result2").text("비밀번호 불일치");
			}
		});
	});
</script>
</head>

<body>
<form action="../AccountChangeServlet" method="get">
<h2>변경할 비밀번호를 입력해 주십시오</h2>
기존 비밀번호 입력: <input type="text" name="passwd" id="passwd">
	<b><span id="result"></span></b><br>
변경할 비밀번호: <input type="text" class="pw" name="chagnePasswd" id="chagnePasswd" readonly="readonly"><br>
비밀번호 재확인: <input type="text" class="pw" name="checkPasswd" id="checkPasswd" readonly="readonly">
	<b><span id="result2"></span></b><br>
<button>확인</button>
</form>
</body>
</html>