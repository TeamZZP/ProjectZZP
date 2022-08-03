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
<title>ZZP</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("button").on("click", function() {
			if ($("#passwd").val() != <%= passwd %>) {
				event.preventDefault();
				console.log("비밀번호 불일치");	
				alert("비밀번호를 확인하세요.");
				$("#passwd").val("");
				$("#passwd").focus();
			}
		});//end fn
	});//end ready
</script>
</head>
<body>
<jsp:include page="../common/header.jsp" flush="true"></jsp:include><br>

<div style = "padding: 15px 5px 5px 20px;">
<form action="../AccountManagementServlet" method="post">
<input type="hidden" name="userid" id="userid" value="<%= userid %>">
<h2>비밀번호를 입력해 주십시오</h2>
기존 비밀번호 확인: <input type="text" name="passwd" id="passwd">
<br><br>
<button class="btn btn-success">확인</button>
</form>
</div>

<jsp:include page="../common/footer.jsp" flush="true"></jsp:include><br>
</body>
</html>