<%@page import="com.dto.AddressDTO"%>
<%@page import="com.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$("#result1").css({"font-size":"13.5px", "background-color":"lightgreen", "font-weight":"bold"});
		
		//비밀번호 일치 확인
		$("#checkPasswd").on("click", function () {
			if ($("#changedPasswd").val().length == 0) {
				$("#result2").css({"font-size":"13.5px", "background-color":"lightgreen", "font":"bold"});
				$("#result2").text("변경할 비밀번호를 입력하세요.");
				$("#checkPasswd").val("");
				$("#changedPasswd").focus();
			}
		});//end fn
		$("#checkPasswd").on("keyup", function() {
			if ($("#changedPasswd").val().length != 0
					&& $(this).val() == $("#changedPasswd").val()) {
				$("#result").text("비밀번호 일치");
			} else {
				$("#result").text("비밀번호 불일치");
			}
		});//end fn
		
		$("form").on("submit", function() {
			
		});//end submit
	});//end ready
</script>
<div style = "padding: 5px 5px 5px 20px;">
<form action=" " method="post">
<input type="hidden" name="userid" id="userid" value="<%= userid %>"/>
<img alt="" src="mypage/user.png" width="30px" height="30px">
	<input type="text" name="username" value="<%= username %>" readonly="readonly"/><br><!-- 수정 불가 or 퍼센트로 데이터 가져옴 -->
<br>
<img alt="" src="mypage/userprofile.png" width="30px" height="30px">
	<input type="text" name="changeProfile" value="프로필 변경" readonly="readonly"/>
	<button id="changeProfile" class="btn btn-outline-success">변경</button><br>
<br>
<img alt="" src="mypage/passwd.png" width="30px" height="30px">
	<input type="text" class="pw" name="changedPasswd" id="changedPasswd" placeholder="변경할 비밀번호를 입력하세요." style="width: 250px">
	&nbsp;<span id="result1">영문자, 숫자, 특수문자를 포함하여 8~25자리를 입력하세요 :></span><br>
	<input type="text" class="pw" name="checkPasswd" id="checkPasswd" placeholder="비밀번호를 한번 더 입력하세요." style="width: 250px">
	&nbsp;<span id="result2"></span><br>
<br>
<img alt="" src="mypage/email.png" width="30px" height="30px">
	<input type="text" name="email1" id="email1" readonly="readonly" value="<%= email1 %>"> @
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
<button class="btn btn-outline-success">변경</button><br>
</form>
</div>