<%@page import="com.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	MemberDTO dto=(MemberDTO) session.getAttribute("login");
	String passwd=dto.getPasswd();
	String userid=dto.getUserid();
%>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	span {
		color: red;
	}
</style>
<title>이메일 변경</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		//1. 기존 비밀번호 입력--일치 여부 확인
		$("#passwd").on("keyup", function() {
			if ($(this).val() == "<%= passwd %>") {
				$("#result").text("비밀번호 일치");
				$(".email").removeAttr("readonly");//일치하면 변경 가능
			} else {
				$("#result").text("비밀번호 불일치");
				$(".email").attr("readonly", "readonly");//불일치하면 변경 불가//readonly 상태로
				//select도 막기
			}
		});//end fn
		$(".email").on("click", function() {//기존 비밀번호 불일치--alert
			if ($("#result").text() == "비밀번호 불일치" || $("#result").text().length == 0) {
				alert("기존 비밀번호를 확인해주세요.");
			}
		});//end fn
		$("#emailSel").on("change", function () {
			$("#email2").val($("#emailSel").val());
		});//end fn
		$("#submit").on("click", function() {
			if ($("#email1").val().length == 0 || $("#email2").val().length == 0) {//두 가지 데이터 중 공백이 있을 경우
				event.preventDefault();
				alert("새로운 이메일 주소를 입력해주세요.");
				$("#email1").focus();
			} else {
				if ($("#result").text() == "비밀번호 불일치") {//기존 비밀번호를 뒤늦게 바꾸는 경우--입력 데이터 다 삭제--처음부터 재설정
					event.preventDefault();
					alert("기존 비밀번호를 확인하세요.");
					$("#passwd").val("");
					$("#email1").val("");
					$("#email2").val("");
					//select도 리셋
					$("#result").text("");
					$("#result2").text("");
					$("#passwd").focus();
				} else {//기존 비번 일치 상태
					var email1=$("#email1").val();
					var email2=$("#email2").val();
					//console.log(email1+"@"+email2);
					opener.$("#email1").val(email1);//부모창에 업데이트
					opener.$("#email2").val(email2);//부모창에 업데이트
					$("form").attr("action", "../AccountChangeServlet");
					//변경 완료 alert//창 닫기, 기존 마이페이지 화면 유지--창을 닫으면 action이 안되는 듯
					alert("이메일이 변경되었습니다.");
					//window.close("mypage/changeEmail.jsp");
					//action 실행 됨
				}
			}
		});//end fn
		$("#close").on("click", function() {
			close();
		});//end fn
	});//end ready
</script>
</head>
<body>
<form action=" " method="post">
<input type="hidden" name="userid" id="userid" value="<%= userid %>">
<h2>변경할 이메일을 입력해 주십시오</h2>
기존 비밀번호 입력: <input type="text" name="passwd" id="passwd">
	<b><span id="result"></span></b><br>
이메일: <input type="text" class="email" name="email1" id="email1" readonly="readonly">@
	<input type="text" class="email" name="email2" placeholder="직접입력" id="email2" readonly="readonly">
	<select id="emailSel">
		<option value="" selected disabled hidden>이메일선택</option>
		<option value="daum.net">daum.net</option>
		<option value="naver.com">naver.com</option>
		<option value="google.com">google.com</option>
	</select><br>
	<br>
<button id="submit">확인</button>&nbsp;&nbsp;<button id="close">창 닫기</button>
</form>
</body>
</html>