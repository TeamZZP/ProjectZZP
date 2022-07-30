<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ZZP</title>
<%
	String mesg=(String) session.getAttribute("notMypage");
	if (mesg != null){
%>
<script type="text/javascript">
	alert("<%= mesg %>");
</script>
<%
	session.removeAttribute("mesg");
	}
%>
</head>
<body>
<jsp:include page="common/header.jsp" flush="true"></jsp:include><br>
<div>
<jsp:include page="member/loginForm4.jsp" flush="true"></jsp:include> 
</div>
<jsp:include page="common/footer.jsp" flush="true"></jsp:include><br>
</body>
</html>