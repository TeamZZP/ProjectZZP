<%@page import="com.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	MemberDTO member=(MemberDTO) session.getAttribute("login");
	
	String userid=member.getUserid();
	String passwd=member.getPasswd();
	String username=member.getUsername();
	String email1=member.getEmail1();
	String email2=member.getEmail2();
	String phone=member.getPhone();
	String created_at=member.getCreated_at();
%>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$("#accountChange").on("click", function() {
			$("form").attr("action", "checkPasswd.jsp");
		});//end fn
		$("#shippingAddress").on("click", function() {
			$("form").attr("action", "addressList.jsp");
		});//end fn
	});//end ready
</script>
<div style = "padding: 5px 5px 5px 20px;">
<form action=" " method="post">
<input type="hidden" name="userid" id="userid" value="<%= userid %>"/>
<img alt="" src="mypage/user.png" width="30px" height="30px">
	<input type="text" name="username" value="<%= username %>" readonly="readonly"/><br><!-- 수정 불가 or 퍼센트로 데이터 가져옴 -->
<br>
<button type="button" class="btn btn-outline-success">1. 주문 내역</button><br>
<br>
<button type="button" class="btn btn-outline-success">2. 반품, 취소 , 교환 목록</button><br>
<br>
<button type="button" class="btn btn-outline-success">3. 내 챌린지</button><br>
<br>
<button type="button" class="btn btn-outline-success">4. 내 문의 내역</button><br>
<br>
<button id="accountChange" class="btn btn-outline-success">5. 계정 관리</button><br>
<br>
<button id="shippingAddress" class="btn btn-outline-success">6. 배송지 관리</button><br>
<br>
</form>
</div>