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
		padding-bottom: 10px;
	}
	.input-group {
		padding-bottom: 10px;
	}
</style>
<%
 	MemberDTO member=(MemberDTO) request.getAttribute("login");
	AddressDTO address=(AddressDTO) request.getAttribute("address");//기본 배송지 출력
	
	String userid=member.getUserid();
	String passwd=member.getPasswd();
	String username=member.getUsername();
	String email1=member.getEmail1();
	String email2=member.getEmail2();
	String phone=member.getPhone();
	String created_at=member.getCreated_at();
	
	int address_id=address.getAddress_id();
	String address_name=address.getAddress_name();
	String receiver_name=address.getReceiver_name();
	String receiver_phone=address.getReceiver_phone();
	String post_num=address.getPost_num();
	String addr1=address.getAddr1();
	String addr2=address.getAddr2();
	int default_chk=address.getDefault_chk();
%>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script>
	$(document).ready(function() {
		//4. 폼 제출, db 업데이트
		
		//5. 취소
		$("#cancle").on("click", function() {
			location.href="";
		});//
		//6. 회원 삭제
		$("#delAccount").on("click", function() {
			console.log("회원 삭제 버튼 클릭");
			location.href="";
		});
	});//end ready
</script>
<div class="container">
<div class="row justify-content-center">
	<div class="col-md-4">
		<div class="card">
			<div class="card-header" style="text-align: center; font-weight: bold; font-size: x-large;">회원 정보 수정</div>
			<div class="card-body">
				<form class="form-horizontal" method="post" action="AccountChangeServlet">
					<!-- 관리자 : 수정 가능 -->
					<!-- username -->
					<div class="form-group">
						<label for="username" class="cols-sm-2 control-label" style="font-weight: bold;">이름</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
								<input type="text" class="form-control" name="username" value="<%= username %>"/>
							</div>
						</div>
					</div>
					<!-- 비밀번호 -->
					<!-- 이메일 -->
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
					<div class="form-group" style="margin-top: 10px; text-align: center;">
						<input type="submit" value="변경" class="btn btn-success">
						<input type="reset" value="변경 취소" class="btn btn-success" id="cancle">
					</div>
					<div class="d-grid gap-2 d-md-flex justify-content-md-end">
						<button class="btn btn-light btn-sm" type="button" id="delAccount">회원 삭제</button>
					</div>
					<!--  <div class="login-register">
					</div> -->
				</form>
			</div>
			</div>
		</div>
	</div>
</div>