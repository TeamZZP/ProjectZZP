<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.dto.MemberDTO"%>
    
    <%
    MemberDTO dto = new MemberDTO();
    dto = (MemberDTO)session.getAttribute("login");
    String userid = dto.getUserid();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>