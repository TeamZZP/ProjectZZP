<%@page import="com.dto.AddressDTO"%>
<%@page import="com.dto.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<!-- Required meta tags -->
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style>
	label {
		padding: 5px 0 5px 0;
	}
</style>
<%
 	MemberDTO dto=(MemberDTO) session.getAttribute("login");
//	System.out.println("jsp에서 관리자 : "+dto);
 	MemberDTO member=(MemberDTO) request.getAttribute("member");
// 	System.out.println("jsp에서 회원 : "+member);
 	
	String userid=member.getUserid();
	String passwd=member.getPasswd();
	String username=member.getUsername();
	String email1=member.getEmail1();
	String email2=member.getEmail2();
	String phone=member.getPhone();
	String created_at=member.getCreated_at();
%>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script>
	$(document).ready(function() {
		//폼 제출, db 업데이트
		$("form").on("submit", function() {
			var username=$("#username").val();
			var phone=$("#phone").val();
			console.log(username+"의 연락처 : "+phone);
			
			var numChk = /^[0-9]*.{11}$/; 
			if (username.length == 0 || phone.length == 0) {
				event.preventDefault();
				alert("변경할 회원 정보를 입력하세요.");
				$("#username").focus();
			} else if (username.length > 3) {
				event.preventDefault();
				alert("이름은 한글 3글자 이내로 입력하세요.");
				$("#username").val("");
				$("#username").focus();
			} else if (!numChk.test(phone) || phone.length > 11) {
				event.preventDefault();
				alert("전화번호를 형식에 맞게 입력하세요.");
				$("#phone").val("");
				$("#phone").focus();
			} else {
				console.log("공백 확인, 이름 3글자 이내, 전화번호 유효성 검사 완료--update");
			}
		})
		//취소
		$("#cancle").on("click", function() {
			location.href="AdminMainServlet";
		});//
		//회원 삭제
		$("#delete").on("click", function() {
			event.preventDefault();
			var id=$(this).attr("data-id");
			console.log("삭제할 회원 아이디 : "+id);
			//*****ajax
			$.ajax({
				type : "post",
				url : "AccountDeleteServlet",//페이지 이동 없이 해당 url에서 작업 완료 후 데이터만 가져옴
				dataType : "text",
				data : {//서버에 전송할 데이터
					userid : id
				},
				success : function(data, status, xhr) {
					alert("해당 회원이 삭제되었습니다.");
					$("#deleteMember").modal("hide");
					$(".modal-backdrop").hide();//모달창 닫고 백드롭 hide
					console.log("success");
					location.href="AdminMainServlet";//삭제 후 관리자 페이지 메인으로 이동
				},
				error: function(xhr, status, error) {
					console.log(error);
				}						
			});//end ajax
		});
	});//end ready
</script>
<div class="container">
<div class="row justify-content-center">
	<div class="col-12">
		<div class="card">
			<div class="card-header" style="text-align: center; font-weight: bold; font-size: x-large;"><%= userid %>님 회원 정보</div>
			<div class="card-body">
				<form class="form-horizontal" method="post" action="AccountChangeServlet">
				<input type="hidden" name="userid" id="userid" value="<%= userid %>"/>
					<!-- username -->
					<div class="form-group">
						<label for="username" class="cols-sm-2 control-label" style="font-weight: bold;">이름</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
								<input type="text" class="form-control" name="username" id="username" value="<%= username %>"/>
							</div>
						</div>
					</div>
					<!-- 비밀번호 -->
					
					<!-- 이메일 -->
					<div class="form-group">
						<label for="type" class="col-sm-3 control-label" style="font-weight: bold;">이메일</label>
							<div class="row g-3">
							<div class="col-sm-6">
								<input type="text" name="email1" id="email1" class="form-control" value="<%= email1 %>" readonly="readonly">
							</div>
							<div class="col-sm-6">
								<div class="input-group">
									<div class="input-group-text">@</div>
									<input type="text" name="email2"  placeholder="직접입력" id="email2" class="form-control" value="<%= email2 %>" readonly="readonly">
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
								<input type="text" class="form-control" name="phone" id="phone" value="<%= phone %>"/>
							</div>
						</div>
					</div>
					<!-- 주소 -->
					
					<!--  -->
					<!-- Modal -->
					<div class="modal fade" id="deleteMember" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="staticBackdropLabel">회원 삭제</h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <div class="modal-body">
					        선택한 회원을 삭제하시겠습니까?
					      </div>
					      <div class="modal-footer">
					        <button type="button" id="delete" data-id="<%= userid %>" name="delete" class="btn btn-success">삭제</button>
					        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
					      </div>
					    </div>
					  </div>
					</div>
					<div class="form-group" style="margin-top: 10px; text-align: center;">
						<input type="submit" value="변경" class="btn btn-success">
						<input type="reset" value="변경 취소" class="btn btn-success" id="cancle">
					</div>
					<div class="d-grid gap-2 d-md-flex justify-content-md-end" style="padding-top: 15px;">
						<button class="btn btn-light btn-sm" type="button" id="chkDelete" data-bs-toggle="modal" data-bs-target="#deleteMember">회원 삭제</button>
					</div>
					<!--  <div class="login-register">
					</div> -->
				</form>
			</div>
			</div>
		</div>
	</div>
</div>