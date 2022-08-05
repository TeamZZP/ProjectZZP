<%@page import="com.dto.ProductDTO"%>
<%@page import="com.dto.MemberDTO"%>
<%@page import="com.dto.ImagesDTO" %>
<%@page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  
  
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript"></script>


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

for(int i = 0; i <ilist.size();i++){

	int p_id = ilist.get(i).getP_id();
	String image_route = ilist.get(i).getImage_route();
	int image_rnk = ilist.get(i).getImage_rnk();
	String update_date = ilist.get(i).getUpdate_date();

%>
	

<html>
<head>
</head>

<body>

<img src="images/p_image/life01.jpg" class="img-thumbnail" >



	
 <%} %> 
</body>
</html>