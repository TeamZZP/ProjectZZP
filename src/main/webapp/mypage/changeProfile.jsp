<%@page import="com.dto.MemberDTO"%>
<%@page import="java.lang.reflect.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ZZP</title>
<%
	MemberDTO member=(MemberDTO) request.getAttribute("login");
	String username=member.getUsername();
%>
<script type="text/javascript">
</script>
</head>
<body>
<jsp:include page="../common/header.jsp" flush="true"></jsp:include><br>

<form action="">
	<div class="container col-md-6">
		<div class="justify-content-center">
		<div class="row">
			<div class="col-md-6">
				<div class="card" style="width: 16rem;">
				  <div class="img" style="padding: 30px 30px 30px 30px;">
				  	<a>
				  		<img src="images/user.png" class="card-img-top">
				  	</a>
				  </div>
				  <div class="card-body">
				    <h5 class="card-title"><b><%= username %>님</b></h5>
				    <p class="card-text">프로필 메세지</p>
				  </div>
				</div>
			</div>
			<div class="col-md-6">
				<button type="button" id="" class="btn btn-outline-success" data-bs-toggle="modal" data-bs-target="#changeImg">
					사진 선택
				</button><br><br>
				<!-- open modal -->
				<button type="button" id="" class="btn btn-outline-success" data-bs-toggle="modal" data-bs-target="#changeMesg">
					프로필 메세지 수정
				</button>
				<!-- open modal -->
			</div>
		</div>
		</div>
	</div>
</form>
<!-- Modal -->
	<div class="modal fade" id="changeImg" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">프로필 이미지 변경</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					프로필 이미지
				</div>
				<div class="modal-footer">
					<button type="button" id="selectImg" class="btn btn-success">수정</button>
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
<!-- end modal -->
<!-- Modal -->
	<div class="modal fade" id="changeMesg" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">프로필 메세지 변경</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<input type="text"/>
				</div>
				<div class="modal-footer">
					<button type="button" id="writeMesg" class="btn btn-success">수정</button>
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
<!-- end modal -->

<jsp:include page="../common/footer.jsp" flush="true"></jsp:include><br>
</body>
</html>