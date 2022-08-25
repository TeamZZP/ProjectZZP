<%@page import="com.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	MemberDTO dto=(MemberDTO) session.getAttribute("login");
	String passwd=dto.getPasswd();
	String userid=dto.getUserid();
	System.out.println(userid);
%>
<html>
<head>
<meta charset="UTF-8">
<title>ZZP</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#passwd").focus();
		$("#check").on("click", function() {
 			if ($("#passwd").val() != "<%= passwd %>") {
				event.preventDefault();
				console.log("비밀번호 불일치");	
				alert("비밀번호를 확인하세요.");
				$("#passwd").val("");
				$("#passwd").focus();
			}
		});//end fn
		$("#cancle").on("click", function() {
			location.href="mypage.jsp";
		});//end fn
	});//end ready
</script>
</head>
<body>
<jsp:include page="common/header.jsp" flush="true"></jsp:include><br>

<form action="AccountManagementServlet" method="post">
<div class="container col-md-4">
	<div class="justify-content-center">
		<div class="col-md-12">
			<input type="hidden" name="userid" id="userid" value="<%= userid %>">
			<h2>비밀번호를 입력해 주십시오</h2>
			<div style="padding-bottom: 45px"></div>
			기존 비밀번호 확인: <input type="password" name="passwd" id="passwd">
			<div style="padding-bottom: 45px"></div>

		</div>
		<div class="col-md-4">
			<div class=""><!-- 확인, 취소 버튼을 가운데로 -->
				<button id="check" class="btn btn-success">확인</button>
				<button type="button" id="cancle" class="btn btn-outline-success">취소</button>
			</div>
		</div>
	</div>
</div>
</form>

<jsp:include page="common/footer.jsp" flush="true"></jsp:include><br>
</body>
</html>