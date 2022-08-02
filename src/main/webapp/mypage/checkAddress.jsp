<%@page import="com.dto.OrderDTO"%>
<%@page import="com.dto.AddressDTO"%>
<%@page import="com.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<%
	MemberDTO dto=(MemberDTO) session.getAttribute("login");
	AddressDTO address=(AddressDTO) session.getAttribute("address");
	OrderDTO orders=(OrderDTO) session.getAttribute("orders");
	
	String username=dto.getUsername();
	String post_num=address.getPost_num();
	String addr1=address.getAddr1();
	String addr2=address.getAddr2();
	
	String order_request=orders.getOrder_request();
%>
<html>
<head>
<meta charset="UTF-8">
<title>주소 관리</title>
<link type="text/css" rel="stylesheet" href="<c:url value='/bootstrap/css/bootstrap.css'/>"/>    
<link type="text/css" rel="stylesheet" href="<c:url value='/bootstrap/css/bootstrap.min.css'/>"/>    
<script src="<c:url value='/bootstrap/js/bootstrap.js'/>" type="text/javascript"></script>
<script src="<c:url value='/bootstrap/js/bootstrap.min.js'/>" type="text/javascript"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
	});//end ready
</script>
</head>
<body>
<form action="changeAddress.jsp">
<b>이름</b><br>
<%= username %><br>
<br>
<b>주소</b><br>
우편번호: <input type="text" name="post" id="sample4_postcode" placeholder="우편번호" readonly="readonly" value="<%= post_num %>"><br>
도로명 주소: <input type="text" name="addr1" id="sample4_roadAddress" placeholder="도로명주소" readonly="readonly" value="<%= addr1 %>" style="width: 450px"><br>
상세 주소: <input type="text" name="addr2" id="sample4_jibunAddress" placeholder="지번주소" readonly="readonly" value="<%= addr2 %>" style="width: 300px"><br>
<span id="guide" style="color:#999"></span><br>
<b>배송 요청사항</b><br>
<input type="text" name="orderrequest" placeholder="<%= order_request %>" readonly="readonly" style="width: 450px"/><br>
<br>
<button class="btn btn-success">수정</button>
</form>
</body>
</html>