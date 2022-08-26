<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.dto.MemberDTO" %>
    <%@ page import="com.dto.CategoryProductDTO" %>
    <%@ page import="java.util.List" %>
    <%@ page import="java.util.HashMap" %>
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
List<CategoryProductDTO> list = (List<CategoryProductDTO>)request.getAttribute("list");
HashMap<String, Integer> map = (HashMap<String, Integer>)request.getAttribute("map");
%>

<%=list %>
<%=map %>


</body>
</html> 