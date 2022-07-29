<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.dto.ProductDTO"%>
<%@page import="java.util.List"%>
<link type="text/css" rel="stylesheet" href="<c:url value='/bootstrap/css/bootstrap.css'/>"/>    
<link type="text/css" rel="stylesheet" href="<c:url value='/bootstrap/css/bootstrap.min.css'/>"/>    
<script src="<c:url value='/bootstrap/js/bootstrap.js'/>" type="text/javascript"></script>
<script src="<c:url value='/bootstrap/js/bootstrap.min.js'/>" type="text/javascript"></script>


<jsp:include page="common/header.jsp" flush="true"></jsp:include><br>
<jsp:include page="category.jsp" flush="true"></jsp:include><br>
<jsp:include page="product/product.jsp" flush="true"></jsp:include><br>
<jsp:include page="common/footer.jsp" flush="true"></jsp:include><br>