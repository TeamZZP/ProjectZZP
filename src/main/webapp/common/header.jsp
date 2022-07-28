<%@page import="com.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link type="text/css" rel="stylesheet" href="<c:url value='/bootstrap/css/bootstrap.css'/>"/>    
<link type="text/css" rel="stylesheet" href="<c:url value='/bootstrap/css/bootstrap.min.css'/>"/>    
<script src="<c:url value='/bootstrap/js/bootstrap.js'/>" type="text/javascript"></script>
<script src="<c:url value='/bootstrap/js/bootstrap.min.js'/>" type="text/javascript"></script>
<style>
#main {
	color: green;
	font-family: 'Bebas Neue', cursive;
}
</style>	
<html>
<header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
      <a href="main.jsp" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
        <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap">
        <use xlink:href="#bootstrap"></use>
        <img alt="로고" src="common/main.png" width="50" height="50"><span id="main">ZZP</span> 
        </svg>
      </a>

      <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
        <li><a href="IntroductionUIServlet" class="nav-link px-2 link-secondary">소개</a></li>
        <li><a href="StoreUIServlet" class="nav-link px-2 link-dark">스토어</a></li>
        <li><a href="ChallengeListServlet" class="nav-link px-2 link-dark">챌린지</a></li>
        <li><a href="#" class="nav-link px-2 link-dark">게시판</a></li>
      </ul>
		
      <div class="col-md-3 text-end" id="header_login_bar">
<%
//로그인 시 회원인증 후 login 데이터 세션에 저장
MemberDTO dto = (MemberDTO)session.getAttribute("login");
	if(dto!=null){	
%>	
      	<button type="button" onclick="location.href='LogoutServlet';"  class="btn btn-success" id="button_logout">로그아웃</button>
		<button type="button" onclick="location.href='AccountManagementServlet';"  class="btn btn-success" id="button_mypage">마이페이지</button>
		<button type="button" onclick="location.href='CartListServlet';"  class="btn btn-success">장바구니</button>
<%
	} else {
%>
		<button type="button" onclick="location.href='LoginUIServlet';"  class="btn btn-success" id="button_login">로그인</button>
      	<button type="button" onclick="location.href='MemberUIServlet';"  class="btn btn-success" id="button_signin">회원가입</button>
      	<button type="button" onclick="location.href='CartListServlet';"  class="btn btn-success">장바구니</button>
<%
	} 
%>
      </div>
    </header>
