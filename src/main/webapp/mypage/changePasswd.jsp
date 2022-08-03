<%@page import="com.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<link type="text/css" rel="stylesheet" href="<c:url value='/bootstrap/css/bootstrap.css'/>"/>    
<link type="text/css" rel="stylesheet" href="<c:url value='/bootstrap/css/bootstrap.min.css'/>"/>    
<script src="<c:url value='/bootstrap/js/bootstrap.js'/>" type="text/javascript"></script>
<script src="<c:url value='/bootstrap/js/bootstrap.min.js'/>" type="text/javascript"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		//1. 기존 비밀번호 입력--일치 여부 확인
		$("#passwd").on("keyup", function() {
			console.log($("#userid").val());
			console.log($("#passwd").val());
			$.ajax({
				type : "get",
				url : "../PasswdCheckServlet",//페이지 이동 없이 해당 url에서 작업 완료 후 데이터만 가져옴
				dataType : "text",
				data : {//서버에 전송할 데이터
					userid : $("#userid").val(),
					passwd : $("#passwd").val()
				},
 				success : function(data, status, xhr) {//data=mesg : 같을 경우, 다를 경우 저장된 메세지 데이터 출력
 					console.log(data);
 					$("#result").text(data);
 					if (data == "비밀번호 일치") {
 						$(".pw").removeAttr("readonly");//일치하면 변경 가능
 					} else {
 						$(".pw").attr("readonly", "readonly");//불일치하면 변경 불가//readonly 상태로
					}
				},
				error: function(xhr, status, error) {
					console.log(error);
				}				
			});//end ajax
		});//end fn
		
		//2. 기존 비밀번호와 불일치--경고창 출력//??? 기존 비번 값과 db 값이 일치하면 true--일치하면 수정 가능해지고 클릭시 경고창이 출력됨..
			//ajax 수정 불필요
		$(".pw").on("click", function() {
			//if ($(".pw").attr("readonly", "readonly")) {//#Fail_기존 설정이 readonly여서 항상 경고창이 출력됨
			if ($("#result").text() == "비밀번호 불일치" || $("#result").text().length == 0) {//완료
				alert("기존 비밀번호를 확인해주세요.");
				//$(".pw").removeAttr("alert");//경고창 한번만 출력
				$("#passwd").focus();//기존 비밀번호 입련란으로 focus
			}
		});//end fn
		
		//3. 새로운 비밀번호 일치 여부 확인
			//ajax 수정 불필요
		$("#checkPasswd").on("keyup", function() {
			if ($("#changedPasswd").val().length == 0) {
				$("#result2").text("변경할 비밀번호를 입력하세요.");
				$("#checkPasswd").val("");
				$("#changedPasswd").focus();
			} else if ($("#changedPasswd").val().length != 0
					&& $(this).val() == $("#changedPasswd").val()) {
				$("#result2").text("비밀번호 일치");
			} else {
				$("#result2").text("비밀번호 불일치");
			}
		});//end fn
		
		$("#submit").on("click", function() {
			//4-1. 데이터 입력 후 submit
			if ($("#passwd").val().length == 0) {
				alert("기존 비밀번호를 입력하세요.");
				event.preventDefault();
				$("#passwd").focus();
			} else if ($("#changedPasswd").val().length == 0) {
				alert("변경할 비밀번호를 입력하세요.");
				event.preventDefault();
				$("#changedPasswd").focus();
			} else if ($("#checkPasswd").val().length == 0) {
				alert("변경할 비밀번호를 확인하세요.");
				event.preventDefault();
				$("#checkPasswd").focus();
			} 
 			else {//3가지 다 입력 완료
				//4-2. 변경된 비밀번호 데이터 베이스에 업데이트
				//새로운 비밀번호 확인 불일치
				if ($("#changedPasswd").val() != $("#checkPasswd").val()) {
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
					$("#changedPasswd").val("");
					$("#checkPasswd").val("");
					$("#result").text("");
					$("#result2").text("");
					$("#passwd").focus();
				} else {//새로운 비밀번호 확인 일치 && 기존 비번 일치 상태
					//*****ajax
					event.preventDefault();
					$.ajax({
						type : "get",
						url : "../PasswdChangeServlet",//페이지 이동 없이 해당 url에서 작업 완료 후 데이터만 가져옴
						dataType : "text",
						data : {//서버에 전송할 데이터
							userid : $("#userid").val(),
							passwd : $("#passwd").val(),
							changedPasswd : $("#changedPasswd").val()
						},
		 				success : function(data, status, xhr) {//data : 
							alert(data);
							opener.$("#passwd").val($("#changedPasswd").val());//부모창에 업데이트
							window.close();
						},
						error: function(xhr, status, error) {
							console.log(error);
						}						
					});//end ajax
				}
			}//end if
		});//end fn
	});//end ready
</script>
</head>
<body>
<div style = "padding: 15px 5px 5px 20px;">
<form action=" " method="post">
<input type="hidden" name="userid" id="userid" value="<%= userid %>">
<h2>변경할 비밀번호를 입력해 주십시오</h2>
기존 비밀번호 입력: <input type="text" name="passwd" id="passwd">
	<b><span id="result"></span></b><br>
변경할 비밀번호: <input type="text" class="pw" name="changedPasswd" id="changedPasswd" readonly="readonly"><br>
비밀번호 재확인: <input type="text" class="pw" name="checkPasswd" id="checkPasswd" readonly="readonly">
	<b><span id="result2"></span></b><br>
	<br>
<button id="submit" class="btn btn-success">확인</button>
</form>
</div>
</body>
</html>