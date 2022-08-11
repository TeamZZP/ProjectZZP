<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.List" %>
    <%@page import="com.dto.CategoryDTO" %>
    <%System.out.println("category폴더 안 category.jsp"); %>
   
   
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
li{
display: block;
list-style: none;
}
#category{
float: left;
padding-right: 11%;
}

a{
	text-decoration: none;
	color: black;
}
</style>
<meta charset="UTF-8">
<title>Category</title>
</head>
<body>

	<div id="category">
			<ul>
				<li><a href="ProductListServlet">베스트</a></li>
			</ul>
		</div>
    <%
    List<CategoryDTO> list = (List<CategoryDTO>)request.getAttribute("categoryList");
    request.setAttribute("categoryList", list);
    
    for( int i = 0; i< list.size(); i++){
    	
    	int c_id = list.get(i).getC_id();
    	String c_name = list.get(i).getC_name();
    	int c_rnk = list.get(i).getC_rnk();
    	String userid = list.get(i).getUserid();
    	String c_created_date = list.get(i).getC_created_date();
    	
		System.out.println(c_id+c_name);
    %>
		<div id="category">
			<ul>
				<li><a href="ProductListServlet?c_id=<%=c_id %>"><%=c_name %></a></li>
			</ul>
		</div>
		
	<% } %>
	
	
	
</body>
</html>