<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<h1>공지사항 :></h1>
	<jsp:include page="common/header.jsp" flush="true"></jsp:include><br>
	<hr>
	<jsp:include page="notice/noticeDetail.jsp" flush="true"></jsp:include> <br>
	<jsp:include page="common/footer.jsp" flush="true"></jsp:include>
</body>
</html>