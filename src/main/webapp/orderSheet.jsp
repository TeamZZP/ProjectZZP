<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="com.dto.OrderDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
주문완료
<%
OrderDTO orderdto = (OrderDTO)request.getAttribute("orderdto");
%>
</body>
</html>