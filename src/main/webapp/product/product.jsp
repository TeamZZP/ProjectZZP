<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.dto.ImagesDTO" %>
    <%@page import="com.dto.ProductDTO" %>
    <%@page import="com.dto.CategoryDTO" %>
    <%@page import="java.util.List" %>
    
    <%
    
    List<ImagesDTO> ilist = (List<ImagesDTO>)request.getAttribute("ImagesList");
    List<ProductDTO> plist = (List<ProductDTO>)request.getAttribute("productList");
    List<CategoryDTO> clist = (List<CategoryDTO>)request.getAttribute("categoryList");

    %>
    
    <%=ilist%><br>
    <%=plist%><br>
    <%=clist%><br>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 파싱 category, product, Images -->
</body>
</html>