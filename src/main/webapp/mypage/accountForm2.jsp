<%@page import="com.dto.AddressDTO"%>
<%@page import="com.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<!-- Required meta tags -->
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script>
	$(document).ready(function() {
		//$("#result1").css({"font-size":"13.5px", "font-weight":"bold"});
		$("#result2").css({"font-size":"14px", "background-color":"lightgreen", "font-weight":"bold"});
		
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
					$("#checkPasswd").val("");
					$("#result2").text("");
					$("#checkPasswd").focus();
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
				if ($("#email1").val().length == 0 || $("#email2").val().length == 0) {//null 방지->서블릿에 데이터 넘길 때 null 예방 필요
					alert("이메일 주소를 입력하세요.");
					$("#email1").focus();
					event.preventDefault();				
				} else if ($("#sample4_jibunAddress").val().length == 0) {//null 방지->서블릿에 데이터 넘길 때 null 예방 필요
					$("#sample4_jibunAddress").val("상세 주소를 입력하세요.");
				} else {
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
				}	
			};//end if
		});//end fn
		
		//5. 회원 탈퇴
		$("#delAccount").on("click", function() {
			console.log("회원 탈퇴 버튼 클릭");
			location.href="accountDelete.jsp";//회원 탈퇴 페이지 이동
		});
	});//end ready
</script>
<div class="container">
<div class="row justify-content-center">
	<div class="col-md-8">
		<div class="card">
			<div class="card-header" style="text-align: center; font-weight: bold; font-size: x-large;">회원 정보 수정</div>
			<div class="card-body">
				<form class="form-horizontal" method="post" action=" ">
				<input type="hidden" name="userid" id="userid" value="<%= userid %>"/>
				<input type="hidden" name="passwd" id="passwd" value="<%= passwd %>"/>
					<!-- username -->
					<div class="form-group">
						<label for="username" class="cols-sm-2 control-label" style="font-weight: bold;">이름</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
								<input type="text" class="form-control" name="username" value="<%= username %>" readonly="readonly"/><!-- 수정 불가 -->
							</div>
						</div>
					</div>
					<!-- 비밀번호 -->
					<div class="form-group">
						<label for="changedPasswd" class="cols-sm-2 control-label" style="font-weight: bold;">변경할 비밀번호</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
								<input type="password" class="form-control" name="changedPasswd" id="changedPasswd" placeholder="영문자, 숫자, 특수문자를 포함하여 8~25자리를 입력하세요."/>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="checkPasswd" class="cols-sm-2 control-label" style="font-weight: bold;">비밀번호 확인</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
								<input type="password" class="form-control" name="checkPasswd" id="checkPasswd" placeholder="비밀번호를 한번 더 입력하세요."/>
							</div>
							<div style="text-align: right">
								<span id="result2"></span>
							</div>
						</div>
					</div>
					<!-- 이메일 -->
					<div class="form-group">
						<label for="type" class="col-sm-3 control-label" style="font-weight: bold;">이메일</label>
							<div class="row g-3">
							<div class="col-sm-4">
								<input type="text" name="email1" id="email1" class="form-control" value="<%= email1 %>">
							</div>
							<div class="col-sm-4">
								<div class="input-group">
									<div class="input-group-text">@</div>
									<input type="text" name="email2"  placeholder="직접입력" id="email2" class="form-control" value="<%= email2 %>">
								</div>
							</div>
							<div class="col-sm-4">
								<div class="col-sm">
									<label class="visually-hidden" for="autoSizingSelect">Preference</label>
									<select id="emailSel" class="form-select" aria-label="Default select example">
										<option value="" selected disabled hidden>이메일 선택</option>
										<option value="daum.net">daum.net</option>
										<option value="naver.com">naver.com</option>
										<option value="google.com">google.com</option>
									</select>
								</div>
							</div>
							</div>
					</div>
					<!-- 전화번호 -->
					<div class="form-group">
						<label for="phone" class="cols-sm-2 control-label" style="font-weight: bold;">전화번호</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
								<input type="text" class="form-control" readonly="readonly" name="phone" id="phone" value="<%= phone %>"/>
							</div>
						</div>
					</div>
					<!-- 주소 -->
					<div class="form-group">
						<label for="address" class="cols-sm-2 control-label" style="font-weight: bold;">주소</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
								<input type="text" name="post" id="sample4_postcode" placeholder="우편번호" class="form-control" readonly="readonly" value="<%= post_num %>">
								<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" class="btn btn-outline-success"><br>
							</div>
							<div class="row g-3" style="margin-top: -10px;">
								<div class="col-md-6">
									<input type="text" name="addr1" id="sample4_roadAddress" placeholder="도로명주소" class="form-control" readonly="readonly" value="<%= addr1 %>">
								</div>
								<div class="col-md-6">
									<input type="text" name="addr2" id="sample4_jibunAddress" placeholder="상세 주소를 입력하세요." class="form-control" value="<%= addr2 %>">
									<span id="guide" style="color:#999"></span>
								</div>                  
							</div>
						</div>
					</div>
					<!--  -->
					<div class="form-group" style="margin-top: 10px; text-align: center;">
						<input type="submit" value="변경" class="btn btn-success">
						<input type="reset" value="취소" class="btn btn-success">
					</div>
					<div class="d-grid gap-2 d-md-flex justify-content-md-end">
						<button class="btn btn-light btn-sm" type="button" id="delAccount">회원 탈퇴</button>
					</div>
					<!--  <div class="login-register">
					</div> -->
				</form>
			</div>
			</div>
		</div>
	</div>
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