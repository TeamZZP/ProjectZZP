<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.dto.MemberDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<img src="images/ordering.jpg" width="850" height="350">
<%
MemberDTO mdto = (MemberDTO)session.getAttribute("login");
int p_id =Integer.parseInt(String.valueOf(request.getAttribute("p_id"))) ;
int p_amount = Integer.parseInt(String.valueOf(request.getAttribute("p_amount"))) ;
%>



</body>
</html> 