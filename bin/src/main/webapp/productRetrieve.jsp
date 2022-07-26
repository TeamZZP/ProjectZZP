<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.dto.ProductDTO"%>
<%@page import="java.util.List"%>
<link type="text/css" rel="stylesheet" href="<c:url value='/bootstrap/css/bootstrap.css'/>"/>    
<link type="text/css" rel="stylesheet" href="<c:url value='/bootstrap/css/bootstrap.min.css'/>"/>    
<script src="<c:url value='/bootstrap/js/bootstrap.js'/>" type="text/javascript"></script>
<script src="<c:url value='/bootstrap/js/bootstrap.min.js'/>" type="text/javascript"></script>

<title>ZZP</title>
<div id="prodTop">
	<jsp:include page="common/header.jsp" flush="true"></jsp:include><br>
	<jsp:include page="product/productRetrieve.jsp" flush="true"></jsp:include><br>
</div>
<div class="row">
	<div class="btn-group" role="group" aria-label="Basic example">
		<a class="btn btn-outline-success" href="#prodDetail" role="button" style="text-decoration: none; color: green;">제품상세</a>
		<a class="btn btn-outline-success" href="#prodReview" role="button" style="text-decoration: none; color: green;">구매후기</a>
		<a class="btn btn-outline-success" href="#prodQA" role="button" style="text-decoration: none; color: green;">QnA</a>
	</div>
</div>
<div id="prodDetail">
	<jsp:include page="product/prodDetail.jsp" flush="true"></jsp:include><br>
</div>
<div id="prodReview">
	<jsp:include page="product/prodReview.jsp" flush="true"></jsp:include><br>
</div>
<div id="prodQA">
	<jsp:include page="product/prodQA.jsp" flush="true"></jsp:include><br>
</div>
<hr>
<div style="text-align: right; padding-right: 50px;">
	<a class="btn btn-outline-success" href="#prodTop" role="button" style="text-decoration: none; color: green;">위로가기</a>
</div>
<jsp:include page="common/footer.jsp" flush="true"></jsp:include><br>