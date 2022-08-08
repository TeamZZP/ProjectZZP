<%@page import="com.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">   
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<style>
#main {
	color: green;
	font-family: 'Bebas Neue', cursive;
}
#headerColor{
	background-color: white;
}
#header_login_bar{
	background-color: white;
}
</style>	
<html>
<header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom"
	id="headerColor">
      <a href="MainServlet" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
        <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap">
        <use xlink:href="#bootstrap"></use>
        <img alt="로고" src="images/header/main.png" width="50" height="50">&nbsp;<span id="main" style="font-weight: bold;">ZZP</span> 
        </svg>
      </a>

      <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
        <li><a href="IntroductionUIServlet" class="nav-link px-2 link-dark">소개</a></li>
        <li><a href="StoreUIServlet" class="nav-link px-2 link-dark">스토어</a></li>
        <li><a href="ChallengeListServlet" class="nav-link px-2 link-dark">챌린지</a></li>
        <li><a href="NoticeListServlet" class="nav-link px-2 link-dark">공지사항</a></li>
        <li><a href="QuestionListServlet" class="nav-link px-2 link-dark">문의</a></li>
      </ul>

<div class="col-md-3 text-end" id="header_login_bar" style="background-color: white;">
<%
//로그인 시 회원인증 후 login 데이터 세션에 저장
MemberDTO dto = (MemberDTO)session.getAttribute("login");
	if(dto!=null){	
		if(dto.getRole()==0){
%>	
      	<button type="button" onclick="location.href='LogoutServlet';"  class="btn btn-success" id="button_logout">로그아웃</button>
		<button type="button" onclick="location.href='MypageServlet';"  class="btn btn-success" id="button_mypage">마이페이지</button>
		<button type="button" onclick="location.href='CartListServlet';" class="btn btn-success" style="margin-right: 10px;">장바구니</button>
<%
		} else {
%>	
		<button type="button" onclick="location.href='LogoutServlet';"  class="btn btn-success" id="button_logout">로그아웃</button>
		<button type="button" onclick="location.href='AdminpageServlet';"  class="btn btn-success" id="button_adminpage">관리자페이지</button>
<%	
		}
	
		} else {
%>
		<button type="button" onclick="location.href='LoginUIServlet';"  class="btn btn-success" id="button_login">로그인</button>
      	<button type="button" onclick="location.href='MemberUIServlet';"  class="btn btn-success" id="button_signin">회원가입</button>
      	<button type="button" onclick="location.href='CartListServlet';" class="btn btn-success" style="margin-right: 10px;">장바구니</button>
<%
	} 
%>

		
      </div>
      <!-- 검색창 -->
		<div class="container-fluid" style="margin-top: 5px;">
			<form class="d-flex" style="float: right; display: inline-block;" action="ProductSearchServlet">
				<input class="form-control me-2" type="search" placeholder="상품 검색" aria-label="Search"  style="width:200px;" name="searchValue">
				<button class="btn btn-outline-success" type="submit">검색</button>
			</form>
		</div>
    </header>