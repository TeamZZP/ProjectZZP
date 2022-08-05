<%@page import="java.util.HashMap"%>
<%@page import="com.dto.CommentsDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.dto.MemberDTO"%>
<%@page import="com.dto.ChallengeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	#challDetailContent {
		width: 800px;
		margin: 0 auto;
		align-items: center;
	}

    input { width: 80%; padding: 10px 20px; margin: 5px 0; box-sizing: border-box; }
	td {
		align-items: center;
	}
	a {
		text-decoration: none;
		color: black;
	}
</style>
<% 
	ChallengeDTO dto = (ChallengeDTO) request.getAttribute("dto");
	int chall_id = dto.getChall_id();
	String userid = dto.getUserid();
	String chall_title = dto.getChall_title();
	String chall_content = dto.getChall_content();
	String chall_category = dto.getChall_category();
	int chall_hits = dto.getChall_hits();
	int chall_liked = dto.getChall_liked();
	String chall_created = dto.getChall_created();
	String chall_img = dto.getChall_img();
	
	//session에 저장된 userid 읽어오기 
	MemberDTO member = (MemberDTO) session.getAttribute("login"); 
	String currUserid = null;
	if (member != null) {
		currUserid = member.getUserid();
	}
	
	//이 글에 속한 댓글 list 얻어오기
	List<CommentsDTO> commentsList = (List<CommentsDTO>) request.getAttribute("commentsList");
	//이 글 작성자의 프로필 이미지 얻어오기
	String profile_img = (String) request.getAttribute("profile_img");
	//현재 회원이 이 글의 좋아요를 눌렀는지 판단하기 
	int likedIt = (int) request.getAttribute("likedIt");
	
%>

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function () {
		//글 삭제시 컨펌창 띄우기 
		$("#deleteChallenge").on("click", function () {
			let mesg = "정말 삭제하시겠습니까? 한번 삭제한 글은 되돌릴 수 없습니다.";
			if (!confirm(mesg)) {
				event.preventDefault();
			}
		});
		//댓글 입력 
		$("#commentAddBtn").on("click", function () {
			if ("<%= currUserid %>" == "null") {
				alert("로그인이 필요합니다.");
			} else if ($("#comment_content").val().length == 0) {
				$("#comment_content").focus();
			} else {
				let comment_content = $("#comment_content").val();
				$.ajax({
					type:"post",
					url:"CommentsAddServlet",
					data: {
						"chall_id":"<%= chall_id %>",
						"comment_content":comment_content,
						"userid":"<%= currUserid %>"
					},
					dataType:"html",
					success: function (data) {
						$("#comment_content").val("");
						$("#comment_area").html(data);
						$("#commentsNum").text(parseInt($("#commentsNum").text())+1);
					},
					error: function () {
						
					}
				});
			}
		});
		//댓글 삭제 
		$(".commentDelBtn").on("click", function () { 
			let mesg = "정말 삭제하시겠습니까?";
			if (!confirm(mesg)) {
				event.preventDefault();
			}
		});
		
		//좋아요 추가
		$("body").on("click", ".liked", function () {
			if ("<%= currUserid %>" == "null") {
				alert("로그인이 필요합니다.");
			} else {
				$.ajax({
					type:"post",
					url:"LikeServlet",
					data: {
						"chall_id":"<%= chall_id %>",
						"userid":"<%= currUserid %>"
					},
					dataType:"html",
					success: function (data) {
						$("#liked_area").html(data);
					},
					error: function () {
						
					}
				});
			}
		});
		
	});
</script>


<div id="challDetailContent">
<table align="center" width="600" cellspacing="0" cellpadding="0" border="0">
	<tr>
	  <td><%= chall_category %></td>
	  <td><%= chall_title %></td>
	  <td>
	  <!-- 해당 게시글의 글쓴이인 경우 -->
	  <% if (userid.equals(currUserid)) { %>
	  	<a href="ChallengeUIServlet?chall_id=<%= chall_id %>&userid=<%= currUserid %>">수정 </a>
	  	<a href="ChallengeDeleteServlet?chall_id=<%= chall_id %>&userid=<%= currUserid %>" id="deleteChallenge">삭제</a>
	  <!-- 그외의 경우 -->
	  <% } else { %>
	    <a href="">신고</a>
	  <% } %>
	  </td>
	</tr>
	<tr>
	  <td><%= chall_created %></td>
	  <td></td>
	  <td>조회수 <%= chall_hits %></td>
	</tr>
	<tr>
	  <td><a href="ProfileMainServlet?userid=<%= userid %>"><img src="images/<%= profile_img %>" width="50" height="50"></a></td>
	  <td colspan="2"><a href="ProfileMainServlet?userid=<%= userid %>"><%= userid %></a></td>
	</tr>
	<tr>
	  <td height="10">
	</tr>
	<tr>
	  <td colspan="3"><div style="text-align: center"><img src="/eclipse/upload/<%= chall_img %>" width="500" height="500"></div></td>
	</tr>
	<tr>
	  <td height="10">
	</tr>
	<tr>
	  <td>
	  <span id="liked_area">
	  <!-- 해당 게시글을 현재 로그인한 회원이 좋아요했던 경우 -->
	  <% if (likedIt == 1) { %>
	    <img src="images/liked.png" width="40" height="40" class="liked"> <%= chall_liked %>
	  <!-- 그외의 경우 -->
	  <% } else { %>
	    <img src="images/like.png" width="40" height="40" class="liked"> <%= chall_liked %>
	  <% } %>
	  </span>
	  </td>
	  <td></td>
	  <td><img src="images/bubble.png" width="30" height="27"> <span id="commentsNum"><%= commentsList.size() %></span></td>
	</tr>
	<tr>
	  <td colspan="3" height="100"><%= chall_content %></td>
	</tr>
	<tr>
	  <td colspan="3">댓글목록</td>
	</tr>
	<tr>
	  <td colspan="3">
	    <table id="comment_area" style="width: 100%">
	    <% for (CommentsDTO comment : commentsList) {
	    	int comment_id = comment.getComment_id();
	    	String comment_content = comment.getComment_content();
	    	String comment_created = comment.getComment_created();
	    	String commentUserid = comment.getUserid();
	    %>
	        <tr>
		    	<td><%= commentUserid %></td>
		    	<td><%= comment_content %></td>
		    	<!-- 해당 댓글의 작성자인 경우 -->
		    	<td><% if (commentUserid!=null && commentUserid.equals(currUserid)) { %>
		    		<a href="CommentsDeleteServlet?chall_id=<%= chall_id %>&comment_id=<%= comment_id %>&userid=<%= currUserid %>" class="commentDelBtn">삭제</a>
		    		<% } else { %>
		    		<!-- 그외의 경우 -->
		    		<a href="">신고</a> 
		    		<% } %>
		    	</td>
	    	</tr>
	    <%} %>
	    </table>
	  </td>
	</tr>
	<tr>
	  <td colspan="3">
	    <input type="text" name="comment_content" id="comment_content" placeholder="칭찬과 격려의 댓글은 작성자에게 큰 힘이 됩니다 :)">
	    <button id="commentAddBtn" class="btn btn-outline-success">입력</button>
	  </td>
	</tr>
	<tr>
	  <td><a href="ChallengeListServlet">목록</a></td>
	  <td></td>
	  <td><a href="ChallengeUIServlet">글쓰기</a></td>
	</tr>
</table>
</div>