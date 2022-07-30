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
			if ($(this).val()=="<%= passwd %>") {//비밀번호 일치 확인
				$("#result").text("비밀번호 일치");
				$(".pw").removeAttr("readonly");//일치하면 변경 가능
			} else {
				$("#result").text("비밀번호 불일치");
				$(".pw").attr("readonly", "readonly");//불일치하면 변경 불가//readonly 상태로
/* 				$(".pw").on("click", function() {//err check
					alert("기존 비밀번호를 확인해주세요.");
					$(".pw").removeAttr("alert");//경고창 한번만 출력--keyup 때문에 입력 문자 길이만큼 출력 err
					$("#passwd").focus();//기존 비밀번호 입련란으로 focus
				}); */
			}
		});//end fn
		$(".pw").on("click", function() {//alert 출력
			if ($(".pw").attr("readonly", "readonly")) {
				console.log("불일치");//console에 안 찍힘... 작은 창 console은 별개임..
				alert("기존 비밀번호를 확인해주세요.");
				$(".pw").removeAttr("alert");//경고창 한번만 출력
				$("#passwd").focus();//기존 비밀번호 입련란으로 focus
			}
		});
		$("#checkPasswd").on("keyup", function() {
			if ($(this).val()==$("#chagnePasswd").val()) {//비밀번호 일치 확인
				$("#result2").text("비밀번호 일치");
			} else {
				$("#result2").text("비밀번호 불일치");
			}
		});//end fn
		$("form").on("submit", function() {
			//데이터 입력 후 submin
			if ($("#passwd").val().length==0) {
				alert("기존 비밀번호를 입력하세요.");
				event.preventDefault();
				$("#passwd").focus();
			} else if ($("#chagnePasswd").val().length==0) {
				alert("변경할 비밀번호를 입력하세요.");
				event.preventDefault();
				$("#chagnePasswd").focus();
			} else if ($("#checkPasswd").val().length==0) {
				alert("변경할 비밀번호를 확인하세요.");
				event.preventDefault();
				$("#checkPasswd").focus();
			} else {
				//새로운 비밀번호 확인 불일치시
				if ($("#chagnePasswd").val() != $("#checkPasswd").val()) {
					console.log("비번 체크");
					event.preventDefault();
					$("#checkPasswd").focus();
				} else {
					var pw=$("#chagnePasswd").val();
					console.log(pw);
					event.preventDefault();
					//창 닫기, 기존 마이페이지 화면 유지
					//window.close("mypage/changePasswd.jsp");
					sesesion.setAttribute("newPasswd", pw);//세션, 리퀘스트 not defined 콘솔 err...
					//response.sendRedirect("AccountChangeServlet");
				}
			}
		});//end fn
	});//end ready
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