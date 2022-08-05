<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.dto.ProductDTO"%>
<%@page import="com.dto.MemberDTO"%>
<%@page import="com.dto.ImagesDTO" %>
<%@page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


  
  
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

System.out.println("productRetrieve.jsp에서 파싱한 pdto=="+pdto);
System.out.println("productRetrieve.jsp에서 파싱한 ilist=="+ilist);

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

<img src="images/p_image/<%= image_route%>.png"  >



	
 <%} %> 
</body>
</html>