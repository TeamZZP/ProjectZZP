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
		$("#result1").css({"font-size":"13.5px", "font-weight":"bold"});
		$("#result2").css({"font-size":"13.5px", "background-color":"lightgreen", "font-weight":"bold"});
		
		//1. 비밀번호 입력 확인
		$("#checkPasswd").on("focus", function () {
			if ($("#changedPasswd").val().length == 0) {
				$("#result2").text("변경할 비밀번호를 입력하세요.");
				$("#checkPasswd").val("");
				$("#changedPasswd").focus();
			}
		});//end fn
		$("#changedPasswd").on("keyup", function() {
			if ($(this).val().length != 0) {
				$("#result2").text("");
			} else {//2-1. 변경 데이터 삭제시 확인 데이터 삭제
				$("#checkPasswd").val("");
				$("#result2").text("");
			}
		});//end fn
		
		//2. 비밀번호 일치 확인
		$("#checkPasswd").on("keyup", function() {
			if ($("#changedPasswd").val().length != 0
					&& $(this).val() == $("#changedPasswd").val()) {
				$("#result2").text("비밀번호 일치");
			} else {
				$("#result2").text("비밀번호 불일치");
			}
		});//end fn
		
		//3. 이메일 select
		$("#emailSel").on("change", function() {
			$("#email2").val($(this).val());
		});//end fn
		
		//4. 폼 제출, db 업데이트
		$("form").on("submit", function() {
			if ($("#changedPasswd").val().length != 0) {//4-1. 비밀번호 변경 데이터가 있을 때
				var pwChk = /^(?=.*[a-zA-Z])(?=.*[!@#$%^&*+=-_])(?=.*[0-9]).{8,25}$/;
				if (!pwChk.test($("#changedPasswd").val())){//비밀번호 유효성 검사
//				if (false) {//비밀번호 유효성 검사--맞게 입력해도 alert 출력
					alert("비밀번호를 형식에 맞게 입력해주세요 :<");
					$("#changedPasswd").val("");
					$("#checkPasswd").val("");
					$("#result2").text("");
					$("#changedPasswd").focus();
					event.preventDefault();
				} else if ($("#result2").text() == "비밀번호 불일치" || $("#result2").text().length == 0) {//비밀번호 미검증
					event.preventDefault();
					console.log("비번 체크");
					alert("변경할 비밀번호를 확인하세요.");
					$("#checkPasswd").focus();
					$("#checkPasswd").val("");
				} else if ($("#email1").val().length == 0 || $("#email2").val().length == 0) {//이메일 공백
					event.preventDefault();
					alert("이메일 주소를 입력하세요.");
					$("#email1").focus();
				} else {//주소는 readonly 상태--새로 입력하지 않는 이상 삭제 불가능해서 따로 공백 검사 안 함--아냐 해야 됨..
					event.preventDefault();
					if ($("#sample4_jibunAddress").val().length == 0) {//null 방지->서블릿에 데이터 넘길 때 null 예방 필요
						$("#sample4_jibunAddress").val("상세 주소를 입력하세요.");
					}
					console.log("유효성 검사 통과, 비밀번호 검증 완료, 비번, 이메일, 주소 update");
					//*****ajax
					$.ajax({
						type : "post",
						url : "AccountChangeServlet",//페이지 이동 없이 해당 url에서 작업 완료 후 데이터만 가져옴
						dataType : "text",
						data : {//서버에 전송할 데이터
							userid : $("#userid").val(),
							passwd : $("#passwd").val(),
							changedPasswd : $("#changedPasswd").val(),
							email1 : $("#email1").val(),
							email2 : $("#email2").val(),
							post : $("#sample4_postcode").val(),
							addr1 : $("#sample4_roadAddress").val(),
							addr2 : $("#sample4_jibunAddress").val()
						},
		 				success : function(data, status, xhr) {//data :
							alert(data);
							location.href="main.jsp";//수정 후 메인페이지 이동
						},
						error: function(xhr, status, error) {
							console.log(error);
						}						
					});//end ajax
				}
			} else {//4-2. 비밀번호 변경 데이터가 없을 때
				event.preventDefault();
				if ($("#sample4_jibunAddress").val().length == 0) {//null 방지->서블릿에 데이터 넘길 때 null 예방 필요
					$("#sample4_jibunAddress").val("상세 주소를 입력하세요.");
				}
				console.log("이메일, 주소 update");
				//*****ajax
				$.ajax({
					type : "post",
					url : "AccountChangeServlet",//페이지 이동 없이 해당 url에서 작업 완료 후 데이터만 가져옴
					dataType : "text",
					data : {//서버에 전송할 데이터
						userid : $("#userid").val(),
						email1 : $("#email1").val(),
						email2 : $("#email2").val(),
						post : $("#sample4_postcode").val(),
						addr1 : $("#sample4_roadAddress").val(),
						addr2 : $("#sample4_jibunAddress").val()
					},
	 				success : function(data, status, xhr) {//data : 
						alert(data);
						location.href="main.jsp";//수정 후 메인페이지 이동
					},
					error: function(xhr, status, error) {
						console.log(error);
					}						
				});//end ajax
			};//end if
		});//end fn
		
		//5. 회원 탈퇴
		$("#delAccount").on("click", function() {
			console.log("회원 탈퇴 버튼 클릭");
			location.href="accountDelete.jsp";//회원 탈퇴 페이지 이동
		});
	});//end ready
</script>
<div style = "padding: 5px 5px 5px 20px;">
<form action=" " method="post">
<input type="hidden" name="userid" id="userid" value="<%= userid %>"/>
<input type="hidden" name="passwd" id="passwd" value="<%= passwd %>"/>
<img alt="" src="mypage/user.png" width="30px" height="30px">
	<input type="text" name="username" value="<%= username %>" readonly="readonly"/><br><!-- 수정 불가 -->
<br>
<img alt="" src="mypage/passwd.png" width="30px" height="30px">
	<input type="password" name="changedPasswd" id="changedPasswd" placeholder="변경할 비밀번호를 입력하세요." style="width: 250px">
	&nbsp;<span id="result1">영문자, 숫자, 특수문자를 포함하여 8~25자리를 입력하세요 :></span><br>
	<input type="password" name="checkPasswd" id="checkPasswd" placeholder="비밀번호를 한번 더 입력하세요." style="width: 250px">
	&nbsp;<span id="result2"></span><br>
<br>
<img alt="" src="mypage/email.png" width="30px" height="30px">
	<input type="text" name="email1" id="email1" value="<%= email1 %>"> @
	<input type="text" name="email2" placeholder="직접입력" id="email2" value="<%= email2 %>">
	<select id="emailSel">
		<option value="" selected disabled>이메일 선택</option>
		<option value="daum.net">daum.net</option>
		<option value="naver.com">naver.com</option>
		<option value="google.com">google.com</option>
	</select><br>
<img alt="" src="mypage/address.png" width="30px" height="30px">
	<input type="text" name="post" id="sample4_postcode" placeholder="우편번호" readonly="readonly" value="<%= post_num %>"><!-- script 긁어서 자식창에 넣기 -->
	<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" class="btn btn-outline-success"><br>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="text" name="addr1" id="sample4_roadAddress" placeholder="도로명 주소" readonly="readonly" value="<%= addr1 %>" style="width: 450px">
	<input type="text" name="addr2" id="sample4_jibunAddress" placeholder="상세 주소를 입력하세요." value="<%= addr2 %>" style="width: 300px">
	<span id="guide" style="color:#999"></span><br>
<br>
<button class="btn btn-outline-success">변경</button><br>
<br><br>
<button type="button" id="delAccount">회원 탈퇴</button>
</form>
</div>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function sample4_execDaumPostcode() {
		new daum.Postcode({
			oncomplete: function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
				var extraRoadAddr = ''; // 도로명 조합형 주소 변수

				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
					extraRoadAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if(data.buildingName !== '' && data.apartment === 'Y'){
					extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
				// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if(extraRoadAddr !== ''){
					extraRoadAddr = ' (' + extraRoadAddr + ')';
				}
				// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
				if(fullRoadAddr !== ''){
					fullRoadAddr += extraRoadAddr;
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
				document.getElementById('sample4_roadAddress').value = fullRoadAddr;
				document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

				// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
				if(data.autoRoadAddress) {
					//예상되는 도로명 주소에 조합형 주소를 추가한다.
					var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
					document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
				} else if(data.autoJibunAddress) {
					var expJibunAddr = data.autoJibunAddress;
					document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
				} else {
					document.getElementById('guide').innerHTML = '';
				}
			}
		}).open();
	}
</script>