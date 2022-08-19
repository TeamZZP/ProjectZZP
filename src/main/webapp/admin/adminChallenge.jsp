<%@page import="com.dto.ChallengeDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
List<ChallengeDTO> challList = (List<ChallengeDTO>) request.getAttribute("challList");
System.out.println("challList"+challList);
%>

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function () {
	$("body").on("click", ".writeBtn", function () {
		location.href = "AdminUIServlet?operate=challengeWrite";
		
		/* $.ajax({
			type: "post",
			url: "AdminUIServlet",
			data: {
				operate:"challengeWrite"
			},
			success: function(data) {
				$("#adminContent").html(data);
			},
			error: function() {
				alert("문제가 발생했습니다. 다시 시도해 주세요.");
			}
		});//ajax */
	});
	
	$("body").on("click", ".challengeDetail", function () {
		console.log($(this).attr("data-id"))
		$.ajax({
			type: "post",
			url: "AdminChallDetailServlet",
			data: {
				chall_id:$(this).attr("data-id")
			},
			success: function(data) {
				$("#adminContent").html(data);
			},
			error: function() {
				alert("문제가 발생했습니다. 다시 시도해 주세요.");
			}
		});//ajax
	});
});
</script>


<div class="container col-md-auto">

<div class="p-4 text-end">
<button class="writeBtn btn btn-success">이 달의 챌린지 등록하기</button>
</div>
<div class="row justify-content-md-center">
<div class="dropdown">
  <button class="btn btn-success btn-sm dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
    카테고리
  </button>
  <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
    <li><a class="dropdown-item" href="#">아이디</a></li>
    <li><a class="dropdown-item" href="#">이름</a></li>
    <li><a class="dropdown-item" href="#">이메일</a></li>
    <li><a class="dropdown-item" href="#">전화번호</a></li>
    <li><a class="dropdown-item" href="#">주소</a></li>
  </ul>
  <input type="text"/>
</div>
<br>
<table class="table table-sm">
	<tr>
		<th>게시글 번호</th>
		<th>아이디</th>
		<th>챌린지 제목</th>
		<th>도장 이름</th>
		<th>등록일</th>
		<th>관리</th>
	</tr>
<%
	for (ChallengeDTO dto : challList) {
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
%>

<form>
	<tr id="list">
		<td class="challengeDetail" data-id="<%= chall_id %>"><%= chall_id %></td>
		<td class="challengeDetail" data-id="<%= chall_id %>"><%= userid %></td>
		<td class="challengeDetail" data-id="<%= chall_id %>"><%= chall_title %></td>
		<td></td>
		<td><%= chall_created %></td>
		<td>
			<!-- Modal -->
			<div class="modal fade" id="deleteMember" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="staticBackdropLabel">회원 삭제</h5>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			        <%-- 회원 <%= userid %>님을 삭제하시겠습니까?--첫번째 데이터가 출력됨 --%>
			        선택한 회원을 삭제하시겠습니까?
			      </div>
			      <div class="modal-footer">
			        <button type="button" id="delete<%= userid %>" class="btn btn-success">삭제</button>
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
			      </div>
			    </div>
			  </div>
			</div>
			<!-- Button trigger modal -->
			<button type="button" id="change<%= userid %>" data-edit="<%= userid %>" class="btn btn-outline-success btn-sm">수정</button>
			<button type="button" id="checkDelete<%= userid %>" data-id="<%= userid %>" class="btn btn-outline-dark btn-sm" data-bs-toggle="modal" data-bs-target="#deleteMember">
				삭제
			</button><!-- open modal -->
		</td>
<%
	}
%>

	</tr>
</form>
</table>
</div>
</div>