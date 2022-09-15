<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.List" %>
<%@page import="com.dto.CategoryDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ZZP</title>
<link type="text/css" rel="stylesheet" href="<c:url value='/bootstrap/css/bootstrap.css'/>"/>    
<link type="text/css" rel="stylesheet" href="<c:url value='/bootstrap/css/bootstrap.min.css'/>"/>    
<script src="<c:url value='/bootstrap/js/bootstrap.js'/>" type="text/javascript"></script>
<script src="<c:url value='/bootstrap/js/bootstrap.min.js'/>" type="text/javascript"></script>

<style type="text/css">
li{
display: block;
list-style: none;

}
#category{
float: left;
padding-right: 11%;
}

.categorycss{
	text-decoration: none;
	color: black;
}
</style>

  <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript"> 

		
function getCategoryProduct(id){  //category.jsp에서 비동기처리로 product.jsp의 $("#categoryProductContainer") 바꾸기     

	 $.ajax({
	        
         type: "post",
         
         data:  {
             "c_id":id ,
             },
         url: "CategoryServlet",
         dataType : "text",
         success : function(data,status,xhr){
         	 $("#prodForm").empty();
        	 $("#prodForm").append(data);
        	<%--  ("<%if(request.getAttribute("c_id").equals("6")){%>  <!-- 타임세일 타이머 -->
        			 
        	<% } %>"+data); --%>
        	 console.log("카테고리 변경 완료");
               },error : function (xhr,status,error){
            	   console.log(error);
               }


    }); 
	
               }//end getCategoryProduct
	        
 </script>
</head>
<body>
<jsp:include page="common/header.jsp" flush="true"></jsp:include><br>
<%@include file="category/category.jsp" %>
<img alt="" src="images/main/banner_sale.png">
<jsp:include page="product/product.jsp" flush="true"></jsp:include><br>
<jsp:include page="common/footer.jsp" flush="true"></jsp:include><br>
</body>