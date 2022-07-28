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
	상단바 - 로그인 회원가입 <br>
	상단바 - 소개, 스토어, 챌린지, 게시판
	<hr>
	<jsp:include page="notice/noticeList.jsp" flush="true"></jsp:include>
</body>
</html>