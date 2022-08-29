<%@page import="com.dto.PageDTO"%>
<%@page import="com.dto.MemberDTO"%>
<%@page import="com.dto.ChallengeDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
PageDTO pDTO = (PageDTO) request.getAttribute("pDTO");
List<ChallengeDTO> list = pDTO.getList();
String searchName = (String) request.getAttribute("searchName");
String searchValue = (String) request.getAttribute("searchValue");
String sortBy = (String) request.getAttribute("sortBy");

//session에 저장된 userid 읽어오기 
MemberDTO member = (MemberDTO) session.getAttribute("login"); 
String currUserid = null;
if (member != null) {
	currUserid = member.getUserid();
}

//session에 저장된 메시지가 있는 경우 경고창 띄워주고 삭제하기
	String mesg = (String) session.getAttribute("mesg");
	if (mesg != null) {
%>
	<script type="text/javascript">
		alert("<%= mesg %>");
	</script>
<% } 
	session.removeAttribute("mesg");
%>

<style>
	.searchName, .searchValue {
		width: 140px; 
		display: inline;
	}
	a {
		text-decoration: none;
		color: black;
	}
	.challengeDetail {
		cursor: pointer;
	}
</style>

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function () {
	
	//챌린지 작성
	$(".writeBtn").on("click", function () {
		location.href = "AdminChallUIServlet";
	});
	//챌린지 상세보기
	$(".challengeDetail").on("click", function () {
		location.href = "AdminChallDetailServlet?chall_id="+$(this).attr("data-id");
	});
	
	//챌린지 삭제 모달
 	$("#deleteModal").on("shown.bs.modal", function (e) {
 		let button = e.relatedTarget;
		let cid = button.getAttribute("data-bs-cid")
		console.log(cid)
		$("#delchall_id").val(cid);
	});
	//챌린지 삭제
	$(".delChallBtn").on("click", function (e) {
		let chall_id = $("#delchall_id").val()
		location.href = "ChallengeDeleteServlet?chall_id="+chall_id+"&userid=<%= currUserid %>";
	});
	
});

</script>



<div class="container mt-2 mb-2">
	<div class="row">
		  <div class="col">
		    <form action="AdminCategoryServlet">
		  		<input type="hidden" name="category" value="challenge">
				  <select name="searchName" class="form-select searchName" data-style="btn-info" id="inputGroupSelect01">
					    <option selected disabled hidden>카테고리</option>
					    <option value="chall_title" <% if("chall_title".equals(searchName)) {%>selected<%} %>>제목</option>
					    <option value="chall_content" <% if("chall_content".equals(searchName)) {%>selected<%} %>>내용</option>
					    <option value="chall_created" <% if("chall_created".equals(searchName)) {%>selected<%} %>>등록일</option>
				  </select>
		  		<input type="text" class="form-control searchValue" name="searchValue" <% if(searchValue!=null && !searchValue.equals("null")) {%>value="<%=searchValue%>"<%} %>>
	      		<input type="submit" class="btn btn-success" value="검색" style="margin-top: -5px;"></input>
	         </form>
	      </div>
	      <div class="col">
	      	<div class="float-end">
	      	<button class="writeBtn btn btn-success">이 달의 챌린지 등록하기</button>
	      	</div>
	      </div>
	</div>
</div>



<div class="container col-md-auto">
<div class="row justify-content-md-center">
<table class="table table-hover table-sm">
	<tr>
		<th>게시글 번호</th>
		<th>아이디</th>
		<th>챌린지 제목</th>
		<th>등록일</th>
		<th>관리</th>
	</tr>
<%
	for (ChallengeDTO dto : list) {
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

	<tr id="list">
		<td class="challengeDetail" data-id="<%= chall_id %>"><%= chall_id %></td>
		<td class="challengeDetail" data-id="<%= chall_id %>"><%= userid %></td>
		<td class="challengeDetail" data-id="<%= chall_id %>"><%= chall_title %></td>
		<td class="challengeDetail" data-id="<%= chall_id %>"><%= chall_created %></td>
		<td>
			<button type="button" class="updateChallBtn btn btn-outline-success btn-sm" data-cid="<%= chall_id %>" >수정</button>
			<button type="button" class="btn btn-outline-dark btn-sm" 
					data-bs-toggle="modal" data-bs-target="#deleteModal" data-bs-cid="<%= chall_id %>">삭제</button>
		</td>
<%
	}
%>

	</tr>
</table>
</div>
</div>

	<!-- 페이징 -->
	  <div class="p-2 text-center">
	  <% 
		    int curPage = pDTO.getCurPage(); 
		    int perPage = pDTO.getPerPage(); 
		    int totalCount = pDTO.getTotalCount();
		    int totalPage = totalCount/perPage;
		    if (totalCount%perPage!=0) totalPage++;
		    for (int p=1; p<=totalPage; p++) {
		    	if (p==curPage) {
		    		out.print("<b>"+p+"</b>&nbsp;&nbsp;");
		    	} else {
		    		out.print("<a href='AdminCategoryServlet?curPage="+p
		    				+"&searchName="+searchName+"&searchValue="+searchValue
		    				+"&sortBy="+sortBy+"&category=challenge'>"+p+"</a>&nbsp;&nbsp;");
		    	} 
		    }
	  %>
	  </div>
	  




		<!-- Modal -->
			<div id="deleteModal" class="modal fade" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="staticBackdropLabel">게시글 삭제</h5>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			        선택한 게시글을 삭제하시겠습니까?
			      </div>
			      <div class="modal-footer">
			        <input type="hidden" id="delchall_id">
			        <button type="button" class="delChallBtn btn btn-success">삭제</button>
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
			      </div>
			    </div> 
			  </div>
			</div>