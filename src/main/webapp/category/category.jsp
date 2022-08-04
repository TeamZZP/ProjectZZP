<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.List" %>
    <%@page import="com.dto.CategoryDTO" %>
    <%System.out.println("category폴더 안 category.jsp"); %>
    
    <%
    List<CategoryDTO> list = (List<CategoryDTO>)request.getAttribute("CategoryDTO_List");
    
    for( int i = 0; i< list.size(); i++){
    	
    	list.get(i).getC_id();
    }
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