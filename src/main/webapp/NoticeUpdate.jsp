<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ZZP</title>
</head>
<body>
<!-- 공지사항 수정 -->
	<jsp:include page="common/header.jsp" flush="true"></jsp:include><br>
	<h1>공지사항 수정 :></h1>
	<jsp:include page="notice/noticeUpdate.jsp" flush="true"></jsp:include><br>
	<jsp:include page="common/footer.jsp" flush="true"></jsp:include>
</body>
</html>