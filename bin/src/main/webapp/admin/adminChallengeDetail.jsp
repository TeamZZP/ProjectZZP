<%@page import="com.dto.StampDTO"%>
<%@page import="com.dto.MemberDTO"%>
<%@page import="com.dto.ChallengeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ChallengeDTO dto = (ChallengeDTO) request.getAttribute("challDTO");
	StampDTO stampDTO = (StampDTO) request.getAttribute("stampDTO");

	int chall_id = dto.getChall_id();
	String userid = dto.getUserid();
	String chall_title = dto.getChall_title();
	String chall_content = dto.getChall_content();
	String chall_category = dto.getChall_category();
	int chall_hits = dto.getChall_hits();
	int chall_liked = dto.getChall_liked();
	String chall_created = dto.getChall_created();
	String chall_img = dto.getChall_img();
	int chall_comments = dto.getChall_comments();
	
	int stamp_id = stampDTO.getStamp_id();
	String stamp_img = stampDTO.getStamp_img();
	String stamp_name = stampDTO.getStamp_name();
	
	//session에 저장된 userid 읽어오기 
	MemberDTO member = (MemberDTO) session.getAttribute("login"); 
	String currUserid = null;
	if (member != null) {
		currUserid = member.getUserid();
	}
%>

<style>
#challDetailContent {
	width: 700px;
	margin: 0 auto;
	align-items: center;
	position: relative;
}
.img {
	display: block;
	margin-left: auto;
	margin-right: auto;
}
a {
	text-decoration: none;
	color: black;
}
</style>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function () {
		
		$(".category").click(function() {
			let category = $(this).attr("data-category");
			location.href="AdminCategoryServlet?category="+category;
		});
		
		
		//글 삭제시 컨펌창 띄우기 
		$("#deleteChallenge").on("click", function () {
			let mesg = "정말 삭제하시겠습니까? 한번 삭제한 글은 되돌릴 수 없습니다.";
			if (!confirm(mesg)) {
				event.preventDefault();
			}
		});
		//목록으로 돌아가기
		$(".backList").on("click", function () {
			let preUrl = document.referrer;
			//게시글 업데이트한 후 이동한 페이지에서는 글작성 페이지로 돌아가지 않도록 최신글 화면으로 이동한다.
			if (preUrl.includes("AdminUIServlet")) {
				location.href = "AdminCategoryServlet?category=challenge";
			} else {
				history.back();
			}
		});
		
	});
</script>


<div class="container">
	<form action="" method="post">
		<div class="row">
			<div class="btn-group" role="group" aria-label="Basic example">
				<button type="button" class="btn btn-outline-success category" data-category="member" id="memberManagement">회원관리</button>
				<button type="button" class="btn btn-outline-success category" data-category="product" id="productManagement">상품관리</button>
				<button type="button" class="btn btn-outline-success category" data-category="challenge" id="challengeManagement">챌린지관리</button>
			</div>
		</div>
	</form>
</div>


<div class="container pt-5">
	<div id="challDetailContent">
		<div class="row">
		    <div class="d-flex w-75">
				<div class="w-50"><%= chall_category %></div>
				<div class="w-50"><%= chall_title %></div>
			</div>
			<div class="w-25">
			  <div class="float-end">
				<a href="AdminUIServlet?chall_id=<%= chall_id %>&userid=<%= currUserid %>" class="btn btn-outline-success">수정</a> 
				<a href="ChallengeDeleteServlet?chall_id=<%= chall_id %>&userid=<%= currUserid %>" id="deleteChallenge" class="btn btn-outline-success">삭제</a>
			   </div>
			</div>
		</div>
		<div style="height: 10px"></div>
		<div class="row">
			<div class="col">
				<%= chall_created %>
			</div>
			<div class="col">
			  <div class="float-end">
				조회수 <%= chall_hits %>
			  </div>
			</div>
		</div>
		<div style="height: 10px"></div>
		<div class="row p-3">
			<div class="col">
				<a href="ProfileMainServlet?userid=<%= userid %>">
				   <img src="images/header/main.png" width="50" height="50"></a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="ProfileMainServlet?userid=<%= userid %>"><%= userid %></a>
			</div>
		</div>
		<div class="row p-3">
			<div class="col">
				<img src="/eclipse/upload/<%= chall_img %>" class="img"
					onerror="this.src='images/uploadarea.png'" width="600" height="600">
			</div>
		</div>
		<div class="row p-2 text-center">
			<div class="col" id="liked_area">
				<img src="images/like.png" width="40" height="40" class="liked">
				<%= chall_liked %>
			</div>
			<div class="col">
				<img src="images/bubble.png" width="37" height="35"> <span
					id="commentsNum"><%= chall_comments %></span>
			</div>
		</div>
		

		<div class="row p-4" style="height: 100px;">
			<%= chall_content %>
		</div>
		
		<div class="row pt-5 pl-5 pb-5">
		  <div class="col-6 m-0 text-center">
			<img src="/eclipse/upload/<%= stamp_img %>" class="thumb-stamp uploadBtn-stamp" id="uploadarea-stamp" width="300" height="300">
		  
		  </div>
		  <div class="col-6 m-0 my-auto">
		    <%= stamp_name %>
		  </div>
		</div>
		
	</div>
</div>