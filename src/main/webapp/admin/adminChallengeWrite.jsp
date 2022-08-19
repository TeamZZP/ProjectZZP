<%@page import="com.dto.StampDTO"%>
<%@page import="com.dto.MemberDTO"%>
<%@page import="com.dto.ChallengeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
#challDetailContent {
	width: 700px;
	margin: 0 auto;
	align-items: center;
	position: relative;
}
.uploadBtn:hover, #deleteBtn:hover, .uploadBtn-stamp:hover {
	cursor: pointer;
	filter: opacity(70%);
}
#updateBtn {
	position: absolute;
	top: 585px;
    left : 85px; 
}
#deleteBtn {
	position: absolute;
	top: 585px;
	left : 160px; 
}

</style>
<%
/* 
	request에 저장된 dto가 있을 경우: 글 수정 페이지
	저장된 dto가 없을 경우: 글쓰기 페이지
 */
	ChallengeDTO dto = (ChallengeDTO) request.getAttribute("dto");
	int chall_id = 0;
	String chall_category = null;
	String chall_title = null;
	String chall_img = null;
	String chall_content = null;
	
	StampDTO stampDTO = (StampDTO) request.getAttribute("stampDTO");
	String stamp_img = null;
	String stamp_name = null;
	
	//dto의 존재 유무에 따라 어떤 동작을 할 것인지 전송해 준다.
	String operate = "upload";
	
	if (dto != null && stampDTO != null) {
		chall_id = dto.getChall_id();
		chall_category = dto.getChall_category();
		chall_title = dto.getChall_title();
		chall_img = dto.getChall_img();
		chall_content = dto.getChall_content();
		operate = "update";
		
		stamp_img = stampDTO.getStamp_img();
		stamp_name = stampDTO.getStamp_name();
	}
	
	//session에 저장된 userid 읽어오기 
	MemberDTO member = (MemberDTO) session.getAttribute("login"); 
	String currUserid = null;
	if (member != null) {
		currUserid = member.getUserid();
	}
%>

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function () {
		
		//글쓰기 취소
		$(".cancelBtn").on("click", function () {
			if (confirm("페이지를 나가시겠습니까?")) {
				history.back();
			}
		});
		//폼 제출시 조건 검사
		$("form").on("submit", function () {
			if ($("#chall_title").val().length == 0) {
				event.preventDefault();
				alert("제목을 입력해 주세요.");
			} else if (($("#old_file").val() == "null" || $("#old_file").val().length == 0) 
						&& $("#chall_img")[0].files[0] == null) {
				event.preventDefault();
				alert("사진을 업로드해 주세요.");
			} else if (($("#old_stamp").val() == "null" || $("#old_stamp").val().length == 0) 
						&& $("#stamp_img")[0].files[0] == null) {
				event.preventDefault();
				alert("도장 사진을 업로드해 주세요.");
			} else if ($("#chall_img").val() != 0 && !checkFileExtension()) {
				event.preventDefault();
			} else if ($("#stamp_img").val() != 0 && !checkStampExtension()) {
				event.preventDefault();
			} else if ($("#chall_content").val().length == 0) {
				event.preventDefault();
				alert("본문을 입력해 주세요.");
			} 
		});
		//파일업로드 이미지 클릭시 input type="file" 클릭
		$("#challDetailContent").on("click", ".uploadBtn", function () {
			$("#chall_img").trigger("click");
		});
		//파일업로드 취소
		$("#challDetailContent").on("click", "#deleteBtn", function () {
			$("#chall_img").val("");
			$("#old_file").val("");
			
			let preview = $(".thumb");
			preview.attr("src", "images/uploadarea.png");
			
			$("#uploadarea").addClass("uploadBtn");
			$("#updateBtn").css("display", "none");
			$("#deleteBtn").css("display", "none");
		});
		//이미지 미리보기
		$("#challDetailContent").on("change", "#chall_img", function (e) {
			console.log("변경감지");
			console.log($(this).val().length);
			if ($(this).val().length!=0 && checkFileExtension()) {
				let preview = $(".thumb");
				preview.attr("src", URL.createObjectURL(e.target.files[0]));
				
				preview.on("load", function () {
					URL.revokeObjectURL(preview.attr("src"));
					console.log("메모리에서 해제됨");
				});
				
				$("#uploadarea").removeClass("uploadBtn");
				$("#updateBtn").css("display", "");
				$("#deleteBtn").css("display", "");
				
				$("#old_file").val("");
			}
		});
		
		//도장 파일업로드 이미지 클릭시 input type="file" 클릭
		$("#challDetailContent").on("click", ".uploadBtn-stamp", function () {
			$("#stamp_img").trigger("click");
		});
		//도장 이미지 미리보기
		$("#challDetailContent").on("change", "#stamp_img", function (e) {
			console.log("변경감지");
			console.log($(this).val().length);
			if ($(this).val().length!=0 && checkStampExtension()) {
				let preview = $(".thumb-stamp");
				preview.attr("src", URL.createObjectURL(e.target.files[0]));
				
				preview.on("load", function () {
					URL.revokeObjectURL(preview.attr("src"));
					console.log("메모리에서 해제됨");
				});
				
				$("#old_stamp").val("");
			}
		});
		
	//이미지 확장자 검사
	function checkFileExtension(){ 
		let fileValue = $("#chall_img").val(); 
		let reg = /(.*?)\.(jpg|jpeg|png|gif)$/;
		if (fileValue.match(reg)) {
			return true;
		} else {
			alert("jpg, jpeg, png, gif 파일만 업로드 가능합니다.");
			return false;
		}
	}
	//도장 이미지 확장자 검사
	function checkStampExtension(){ 
		let fileValue = $("#stamp_img").val(); 
		let reg = /(.*?)\.(jpg|jpeg|png|gif)$/;
		if (fileValue.match(reg)) {
			return true;
		} else {
			alert("jpg, jpeg, png, gif 파일만 업로드 가능합니다.");
			return false;
		}
	}
		
	
	});//end ready
</script>


<div class="container pt-5">
<div id="challDetailContent">

<form action="AdminChallUploadServlet?userid=<%= currUserid %>&operate=<%= operate %>" method="post" enctype="multipart/form-data">
<input type="hidden" name="chall_id" value="<%= chall_id %>">
<input type="hidden" name="userid" value="<%= currUserid %>">
<input type="hidden" name="chall_this_month" value="1">

  <div class="row">
	<div class="d-flex w-25">
		<select name="chall_category" id="chall_category" class="form-select">
	 	  <option>이 달의 챌린지</option>
		</select>
	</div>
	<div class="w-75">
		<input type="text" name="chall_title" id="chall_title" class="form-control" placeholder="제목"
			<% if(chall_title!=null) {%>value="<%=chall_title%>"<%} %>>
	</div>
  </div>
  <div class="row">
    <div class="p-4 text-center">
	  <% if(chall_img==null) {%>
	  		<img src="images/uploadarea.png" class="thumb uploadBtn" id="uploadarea" width="600" height="600" />
	  		<img src="images/reload.png" class="uploadBtn" id="updateBtn" width="50" title="사진 다시 올리기" style="display: none;">
	 		<img src="images/trash.png" class="deleteBtn" id="deleteBtn" width="50" title="사진 삭제하기" style="display: none;">
	  	    <input type="file" accept="image/*" name="chall_img" id="chall_img" style="display: none;">
	  <%} else { %>
	 		<img src="/eclipse/upload/<%= chall_img %>" class="thumb" id="uploadarea" width="600" height="600">
	 		<img src="images/reload.png" class="uploadBtn" id="updateBtn" width="50" title="사진 다시 올리기">
	 		<img src="images/trash.png" class="deleteBtn" id="deleteBtn" width="50" title="사진 삭제하기">
	 		<input type="file" accept="image/*" name="chall_img" id="chall_img" value="<%= chall_img %>" style="display: none;">
	  <%} %>
	  		<input type="hidden" name="old_file" id="old_file" value="<%= chall_img %>">
	</div>
	<div class="row pt-2 pl-5 pb-5">
	  <div class="col-6 m-0 text-center">
	  <% if(stamp_img==null) {%>
		<img src="images/stamp.png" class="thumb-stamp uploadBtn-stamp" id="uploadarea-stamp" width="200" height="200">
		<input type="file" accept="image/*" name="stamp_img" id="stamp_img" style="display: none;">
	  <%} else { %>
	  
	  <%} %>
	    <input type="hidden" name="old_stamp" id="old_stamp" value="<%= stamp_img %>">
	  </div>
	  <div class="col-6 m-0">
	    <div class="float-start">
	    <br><br><br>
	    <input type="text" class="form-control" name="stamp_name" id="stamp_name" placeholder="도장 이름 입력">
	    </div>
	  </div>
	</div>
  </div>
  <div>
  	<textarea class="form-control" rows="10" name="chall_content" id="chall_content" placeholder="본문 입력">
<% if(chall_content!=null) {%><%=chall_content%><%} %></textarea>
  </div>
	  
  <div class="row p-4">
    <div class="col">
	  <a class="cancelBtn btn btn-success">취소</a>
	</div>
	<div class="col">
	  <div class="float-end">
	  <% if(dto==null) {%>
	 	<input type="submit" class="btn btn-success" value="글쓰기">
	  <%} else { %>
	  	<input type="submit" class="btn btn-success" value="수정하기">
	  <%} %>
	  </div>
	</div>
  </div>

</form>
</div>
</div>


