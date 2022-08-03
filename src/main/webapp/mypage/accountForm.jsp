<%@page import="com.dto.AddressDTO"%>
<%@page import="com.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
/* 		$("button").on("click", function() {
			location.reload();
		}); */
		
		$("#changePasswd").on("click", function() {
			var popupX = (window.screen.width / 2) - (200 / 2);
			var popupY= (window.screen.height / 5) - (200 / 2);
			window.open("mypage/changePasswd.jsp","",'status=no, height=200, width=500, left='+ popupX + ', top='+ popupY);
			reload();
		});
		$("#changeEmail").on("click", function() {
			var popupX = (window.screen.width / 2) - (200 / 2);
			var popupY= (window.screen.height / 5) - (300 / 2);
			window.open("mypage/changeEmail.jsp","",'status=no, height=200, width=600, left='+ popupX + ', top='+ popupY);
			reload();
		});
		$("#changeAddress").on("click", function() {
			var popupX = (window.screen.width / 2) - (200 / 2);
			var popupY= (window.screen.height / 5) - (300 / 2);
			window.open("mypage/checkAddress.jsp","",'status=no, height=300, width=600, left='+ popupX + ', top='+ popupY);
		});
		$("#changeProfile").on("click", function() {
			var popupX = (window.screen.width / 2) - (200 / 2);
			var popupY= (window.screen.height / 5) - (300 / 2);
			window.open("mypage/changeProfile.jsp","",'status=no, height=500, width=400, left='+ popupX + ', top='+ popupY);
		});
		
/* 		$("#changeSubmit").on("click", function() {
			$("form").attr("action", "AccountChangeServlet");
			System.out.println("수정 버튼 클릭");
		}); */
	});//end ready
	function reload() {
		location.reload();
	}
</script>
<%
	MemberDTO member=(MemberDTO) session.getAttribute("login");
	AddressDTO address=(AddressDTO) session.getAttribute("address");
	
	String userid=member.getUserid();
	String passwd=member.getPasswd();
	String username=member.getUsername();
	String email1=member.getEmail1();
	String email2=member.getEmail2();
	String phone=member.getPhone();
	String created_at=member.getCreated_at();
	
	String address_name=address.getAddress_name();
	String receiver_name=address.getReceiver_name();
	String receiver_phone=address.getReceiver_phone();
	String post_num=address.getPost_num();
	String addr1=address.getAddr1();
	String addr2=address.getAddr2();
	int default_chk=address.getDefault_chk();
	
	if (addr2 == null) {
		addr2="상세 주소를 입력하세요.";
	}
%>
<div style = "padding: 5px 5px 5px 20px;">
<form action=" " method="post">
<input type="hidden" name="userid" id="userid" value="<%= userid %>"/>
<img alt="" src="mypage/user.png" width="30px" height="30px">
	<input type="text" name="username" value="<%= username %>" readonly="readonly"/><br><!-- 수정 불가 or 퍼센트로 데이터 가져옴 -->
<img alt="" src="mypage/passwd.png" width="30px" height="30px">
	<input type="password" name="passwd" value="<%= passwd %>" id="passwd" readonly="readonly">
	<button type="button" id="changePasswd" class="btn btn-outline-success">변경</button><br>
<br>
<img alt="" src="mypage/email.png" width="30px" height="30px">
	<input type="text" name="email1" id="email1" readonly="readonly" value="<%= email1 %>">@
	<input type="text" name="email2" placeholder="직접입력" id="email2" readonly="readonly" value="<%= email2 %>">
	<button id="changeEmail" class="btn btn-outline-success">변경</button><br>
<img alt="" src="mypage/address.png" width="30px" height="30px">
	<input type="text" name="post" id="sample4_postcode" placeholder="우편번호" readonly="readonly" value="<%= post_num %>"><br><!-- script 긁어서 자식창에 넣기 -->
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="text" name="addr1" id="sample4_roadAddress" placeholder="도로명주소" readonly="readonly" value="<%= addr1 %>" style="width: 450px">
	<input type="text" name="addr2" id="sample4_jibunAddress" placeholder="지번주소" readonly="readonly" value="<%= addr2 %>" style="width: 300px">
	<span id="guide" style="color:#999"></span>
	<button id="changeAddress" class="btn btn-outline-success">주소 관리</button><br>
<br>
<img alt="" src="mypage/membership.png" width="30px" height="30px">
	<input type="text" name="membership" value="멤버쉽" readonly="readonly"/><br>
<img alt="" src="mypage/userprofile.png" width="30px" height="30px">
	<input type="text" name="changeProfile" value="프로필 변경" readonly="readonly"/>
	<button id="changeProfile" class="btn btn-outline-success">변경</button><br>
<br>
<!-- <hr>
<button id="changeSubmit">수정</button> -->
</form>
</div>