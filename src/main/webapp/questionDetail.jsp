<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="common/header.jsp" flush="true"></jsp:include><br>
	<h1>게시물 상세보기 :></h1>
	<jsp:include page="question/questionDetail.jsp" flush="true"></jsp:include> <br>
	<jsp:include page="common/footer.jsp" flush="true"></jsp:include>
</body>
</html>