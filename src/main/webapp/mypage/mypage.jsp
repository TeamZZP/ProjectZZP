<%@page import="com.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	MemberDTO member=(MemberDTO) request.getAttribute("login");
	
	String userid=member.getUserid();
	String passwd=member.getPasswd();
	String username=member.getUsername();
	String email1=member.getEmail1();
	String email2=member.getEmail2();
	String phone=member.getPhone();
	String created_at=member.getCreated_at();
%>
<style>
</style>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		
	});//end ready
</script>
<div class="container col-md-8">
<div class="justify-content-center">
<div class="row">
<div class="col-md-5">
<%-- <img alt="" src="mypage/user.png" width="30px" height="30px">
	<input type="text" name="username" value="<%= username %>" readonly="readonly"/><br><!-- 수정 불가 or 퍼센트로 데이터 가져옴 -->
<br> --%>
	<div class="card" style="width: 16rem;">
	  <div style = "padding: 30px 30px 30px 30px;">
	  	<img src="mypage/user.png" class="card-img-top" alt="..."><!-- 이미지 작게 조절 -->
	  </div>
	  <div class="card-body">
	    <h5 class="card-title"><b><%= username %>님</b></h5>
	    <p class="card-text">프로필 메세지</p>
	  </div>
	</div>
</div>
<div class="col-md-7">
	<div style="padding-bottom: 70px;">
		<a href="#" class="btn btn-outline-success">입금, 결제</a>
		<a href="#" class="btn btn-outline-success">배송중</a>
		<a href="#" class="btn btn-outline-success">배송 완료</a>
		<a href="#" class="btn btn-outline-success">전체보기</a>
	</div>
	<div></div>
		<a href="#" class="btn btn-outline-success">1. 주문 내역</a>
		<a href="#" class="btn btn-outline-success">2. 반품/취소/교환 목록</a><br>
		<br>
		<a href="#" class="btn btn-outline-success">3. 내 챌린지</a>
		<a href="MyQuestionServlet" class="btn btn-outline-success">4. 내 문의 내역</a><br>
		<br>
		<a href="AddressListServlet" class="btn btn-outline-success">5. 배송지 관리</a>
		<a href="checkPasswd.jsp" class="btn btn-outline-success">6. 계정 관리</a><br>
		<br>
	</div>
</div>
</div>
</div>