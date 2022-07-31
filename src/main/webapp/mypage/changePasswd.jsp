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
<title>비밀번호 변경</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		//1. 기존 비밀번호 입력--일치 여부 확인
		$("#passwd").on("keyup", function() {
			if ($(this).val() == "<%= passwd %>") {
				$("#result").text("비밀번호 일치");
				$(".pw").removeAttr("readonly");//일치하면 변경 가능
			} else {
				$("#result").text("비밀번호 불일치");
				$(".pw").attr("readonly", "readonly");//불일치하면 변경 불가//readonly 상태로
			}
		});//end fn
		
		//2. 기존 비밀번호와 불일치--경고창 출력//??? 기존 비번 값과 db 값이 일치하면 true--일치하면 수정 가능해지고 클릭시 경고창이 출력됨..
		$(".pw").on("click", function() {
			//if ($(".pw").attr("readonly", "readonly")) {//#Fail_기존 설정이 readonly여서 항상 경고창이 출력됨
			if ($("#result").text() == "비밀번호 불일치" || $("#result").text().length == 0) {//완료
				alert("기존 비밀번호를 확인해주세요.");
				//$(".pw").removeAttr("alert");//경고창 한번만 출력
				$("#passwd").focus();//기존 비밀번호 입련란으로 focus
			}
		});//end fn
		
		//3. 새로운 비밀번호 일치 여부 확인
		$("#checkPasswd").on("keyup", function() {
			if ($("#chagnePasswd").val().length == 0) {
				$("#result2").text("변경할 비밀번호를 입력하세요.");
				$("#chagnePasswd").focus();
			} else if ($("#chagnePasswd").val().length != 0
					&& $(this).val() == $("#chagnePasswd").val()) {
				$("#result2").text("비밀번호 일치");
			} else {
				$("#result2").text("비밀번호 불일치");
			}
		});//end fn
		//3+. 비밀번호 재확인 후 다시 변경할 비밀번호 입력시 처리 추가
		
		$("#submit").on("click", function() {
			//4-1. 데이터 입력 후 submit
			if ($("#passwd").val().length == 0) {
				alert("기존 비밀번호를 입력하세요.");
				event.preventDefault();
				$("#passwd").focus();
			} else if ($("#chagnePasswd").val().length == 0) {
				alert("변경할 비밀번호를 입력하세요.");
				event.preventDefault();
				$("#chagnePasswd").focus();
			} else if ($("#checkPasswd").val().length == 0) {
				alert("변경할 비밀번호를 확인하세요.");
				event.preventDefault();
				$("#checkPasswd").focus();
			} 
 			else {//3가지 다 입력 완료
				//4-2. 변경된 비밀번호 데이터 베이스에 업데이트//#Fail_action 실행 안 됨, 데이터 전달 못 함--if문에서 문제가 생긴 듯
				//새로운 비밀번호 확인 불일치
				if ($("#chagnePasswd").val() != $("#checkPasswd").val()) {
					//console.log("비번 체크");
					event.preventDefault();
					alert("변경할 비밀번호를 확인하세요.");
					$("#checkPasswd").focus();
					$("#checkPasswd").val("");
				} else if ($("#result").text() == "비밀번호 불일치") {//기존 비밀번호를 뒤늦게 바꾸는 경우--입력 데이터 다 삭제--처음부터 재설정
					//console.log("기존 비번 체크");
					event.preventDefault();
					alert("기존 비밀번호를 확인하세요.");
					$("#passwd").val("");
					$("#chagnePasswd").val("");
					$("#checkPasswd").val("");
					$("#result").text("");
					$("#result2").text("");
					$("#passwd").focus();
				} else {//새로운 비밀번호 확인 일치 && 기존 비번 일치 상태
					var pw=$("#chagnePasswd").val();
					console.log(pw);//이 데이터를 어떻게 넘기지?
					//변경 완료 alert, 창 닫기, 기존 마이페이지 화면 유지
					alert("비밀번호가 변경되었습니다.");
/* 					setTimeout(function() {//창 안 닫힘
						window.close();
					}, 100); */
					//window.close("mypage/changePasswd.jsp");//창 닫으면 action 실행 안되고 데이터 전송이 불가
				}
			}//end if
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
<h2>변경할 비밀번호를 입력해 주십시오</h2>
기존 비밀번호 입력: <input type="text" name="passwd" id="passwd">
	<b><span id="result"></span></b><br>
변경할 비밀번호: <input type="text" class="pw" name="chagnePasswd" id="chagnePasswd" readonly="readonly"><br>
비밀번호 재확인: <input type="text" class="pw" name="checkPasswd" id="checkPasswd" readonly="readonly">
	<b><span id="result2"></span></b><br>
<button id="submit">확인</button>&nbsp;&nbsp;<button id="close">창 닫기</button>
</form>
</body>
</html>