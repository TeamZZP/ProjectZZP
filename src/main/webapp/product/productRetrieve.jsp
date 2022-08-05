<%@page import="com.dto.ProductDTO"%>
<%@page import="com.dto.MemberDTO"%>
<%@page import="com.dto.ImagesDTO" %>
<%@page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

ProductDTO pdto = (ProductDTO)request.getAttribute("ProductRetrieveDTO");

pdto.getC_id();
pdto.getP_content();
pdto.getP_cost_price();
pdto.getP_created();
pdto.getP_discount();
pdto.getP_id();
pdto.getP_name();
pdto.getP_selling_price();
pdto.getP_stock();

%>  

<%
List<ImagesDTO> ilist = (List<ImagesDTO>)request.getAttribute("ImagesRetrieveList");

for(int i = 0; i <ilist.size();i++){%>
	
	
	
	
	
	
<%} %>

  
  
  
  
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript"></script>





<html>
<head>
</head>

<body>




</body>
</html>