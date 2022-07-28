<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link type="text/css" rel="stylesheet" href="<c:url value='/bootstrap/css/bootstrap.css'/>"/>    
<link type="text/css" rel="stylesheet" href="<c:url value='/bootstrap/css/bootstrap.min.css'/>"/>    
<script src="<c:url value='/bootstrap/js/bootstrap.js'/>" type="text/javascript"></script>
<script src="<c:url value='/bootstrap/js/bootstrap.min.js'/>" type="text/javascript"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<!DOCTYPE html>
<html>
<script type="text/javascript">
$(document).ready(function() {
	Kakao.init("6967e0449063c04f2ba9d396e18a25a6");
	var token = new URL(window.location.href).searchParams.get("code");
	Kakao.Auth.setAccessToken(token);
	if(Kakao.Auth.getAccessToken() != null && Kakao.Auth.getAccessToken() != ""){
		$("#button_login").hide();
		$("#button_signin").hide();
		$("#button_logout").show();
		$("#button_myInfo").show();
	} else {
		$("#button_login").show();
		$("#button_signin").show();
		$("#button_logout").hide();
		$("#button_myInfo").hide();
	}
});
</script>
<head>
<meta charset="UTF-8">
<title>ZZP</title>
<% 
String mesg = (String)session.getAttribute("memberAdd");
if(mesg!=null){
%>
<script type="text/javascript">
	alert("<%= mesg %>");
</script>
<%
session.removeAttribute("memberAdd");
}
%>
</head>
<body>
<input type="hidden" id="kakao_token"/>
<jsp:include page="common/header.jsp" flush="true"></jsp:include><br>
<jsp:include page="main/banner.jsp" flush="true"></jsp:include><br>
<jsp:include page="common/footer.jsp" flush="true"></jsp:include><br>
</body>
</html>