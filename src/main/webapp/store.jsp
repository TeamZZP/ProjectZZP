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
#modalBtn{
	display: none;
}
.modal-body{
	text-align: center;
}
#mesg{
	margin: 0;
}
</style>
<%
	String mesg=(String) session.getAttribute("mesg");
	if (mesg != null){
%>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript"> 
$(document).ready(function() {
	$("#modalBtn").trigger("click");
	$("#mesg").text("<%= mesg %>");
});
		
function getCategoryProduct(id){  //category.jsp에서 비동기처리로 product.jsp의 $("#categoryProductContainer") 바꾸기     
	
	
	
	 $.ajax({
	        
         type: "post",
         
         data:  {
             "c_id":id 
             },
         url: "CategoryServlet",
         dataType : "text",
         success : function(data,status,xhr){
         	 $("#categoryClickChange").empty();
        	 $("#categoryClickChange").append(data);
        	 
               },error : function (xhr,status,error){
            	   console.log(error);
               }


    }); 
	
               }//end getCategoryProduct
	        
 </script>
 <%
session.removeAttribute("mesg");
}
%>
</head>
<body>
<div class="modal checkVal" id="checkVal" data-bs-backdrop="static">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">ZZP</h5>
      </div>
      <div class="modal-body">
        <p id="mesg"></p>
      </div>
      <div class="modal-footer">
        <button type="button"  id="closemodal" class="btn btn-success" data-bs-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
<button type="button" id="modalBtn" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#checkVal">modal</button>

<jsp:include page="common/header.jsp" flush="true"></jsp:include><br>
<%@include file="category/category.jsp" %>
<jsp:include page="product/product.jsp" flush="true"></jsp:include><br>
<jsp:include page="common/footer.jsp" flush="true"></jsp:include><br>
</body>