<%@page import="com.dto.AddressDTO"%>
<%@page import="com.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	MemberDTO dto=(MemberDTO) session.getAttribute("login");
	AddressDTO address=(AddressDTO) session.getAttribute("address");
	
	String username=dto.getUsername();
	String post=address.getPost_num();
	String addr1=address.getAddr1();
	String addr2=address.getAddr2();
%>
<html>
<head>
<meta charset="UTF-8">
<title>주소 관리</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
	});//end ready
</script>
</head>
<body>
<form action="changeAddress.jsp">
이름:<%= username %><br>
주소:<%= post %><br>
	<%= addr1 %><br>
	<%= addr2 %><br>
배송요청 사항:<br>
<button>수정</button>
</form>
</body>
</html>