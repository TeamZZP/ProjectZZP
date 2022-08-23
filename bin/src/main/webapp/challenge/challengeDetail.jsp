<%@page import="java.util.HashMap"%>
<%@page import="com.dto.CommentsDTO"%>
<%@page import="java.util.List"%>
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

.img {
	display: block;
	margin-left: auto;
	margin-right: auto;
}

input {
	width: 80%;
	padding: 10px 20px;
	margin: 5px 0;
	box-sizing: border-box;
}

td {
	align-items: center;
}

a {
	text-decoration: none;
	color: black;
}

/* 댓글 목록 */
.card {
    background-color: #fff;
    border: none;
}
.form-color {
    background-color: #fafafa
}
.form-control {
    height: 48px;
    border-radius: 15px;
    text-indent: 10px;
    display: inline;
}
.form-control:focus {
    color: #495057;
    background-color: #fff;
    border-color: #35b69f;
    outline: 0;
    box-shadow: none;
}
.user-feed {
    font-size: 14px;
    margin-top: 12px;
}
.profile {
	padding: 10px; 
	padding-right: 20px;
}
.commentBtn {
	width: 10%;
	background: none;
	color: gray;
	border: none;
	display:inline;
    top: 0;
    right: 5px;
    box-sizing: border-box;
}
.commentBtn:hover {
	color: #35b69f;
}
/* .reply_box {
	position: relative; 
}
.reply_content {
    text-indent: 80px;
}
.idTag {
	display: block;
	position: absolute; 
	left: 15px; 
	top: 15px; 
	z-index: 9; 
} */
.stamp {
	position: absolute; 
	left: 458px; 
	top: 146px; 
	
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
	int chall_comments = dto.getChall_comments();
	
	//session에 저장된 userid 읽어오기 
	MemberDTO member = (MemberDTO) session.getAttribute("login"); 
	String currUserid = null;
	if (member != null) {
		currUserid = member.getUserid();
	}
	
	//이 글에 속한 댓글 list 얻어오기
	List<CommentsDTO> commentsList = (List<CommentsDTO>) request.getAttribute("commentsList");
	//이 글에 속한 댓글 작성자들의 프로필 이미지 얻어오기
	HashMap<String, String> profileMap = (HashMap<String, String>) request.getAttribute("profileMap");
	//이 글 작성자의 프로필 이미지 얻어오기
	String profile_img = (String) request.getAttribute("profile_img");
	//현재 로그인한 회원의 프로필 이미지 얻어오기
	String currProfile_img = (String) request.getAttribute("currProfile_img");
	if (currProfile_img == null) {
		currProfile_img = "user.png";
	}
	//현재 회원이 이 글의 좋아요를 눌렀는지 판단하기 
	int likedIt = (int) request.getAttribute("likedIt");
	//이 글 도장 가져오기
	HashMap<String, String> stampMap = (HashMap<String, String>) request.getAttribute("stampMap");
	System.out.println(stampMap);
	
%>

<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
		$(".comment").on("click", ".commentAddBtn", function () {
			let content = $(".comment_content");
			if ("<%= currUserid %>" == "null") {
				alert("로그인이 필요합니다.");
			} else if (content.val().length == 0) {
				content.focus();
			} else {
				let comment_content = content.val();
				$.ajax({
					type:"post",
					url:"CommentsAddServlet",
					data: {
						chall_id:"<%= chall_id %>",
						comment_content:comment_content,
						userid:"<%= currUserid %>",
					},
					dataType:"html",
					success: function (data) {
						content.val("");
						$("#comment_area").html(data);
						countComments();
					},
					error: function () {
						alert("문제가 발생했습니다. 다시 시도해 주세요.");
					}
				});
			}
		});
		//답글 입력 
		$(".comment").on("click", ".commentReplyBtn", function () {
			let cid = $(this).attr("data-cid");
			let group = $(this).attr("data-group");
			let parent = $(this).attr("data-parent");
			let content = $("#reply_content"+cid);
			if ("<%= currUserid %>" == "null") {
				alert("로그인이 필요합니다.");
			} else if (content.val().length == 0) {
				content.focus();
			} else {
				let comment_content = content.val().substring(parent.length+3);
				console.log(comment_content)
				$.ajax({
					type:"post",
					url:"CommentsAddServlet",
					data: {
						chall_id:"<%= chall_id %>",
						comment_content:comment_content,
						userid:"<%= currUserid %>",
						parent_id:cid,
						group_order:group
					},
					dataType:"html",
					success: function (data) {
						content.val("");
						$("#comment_area").html(data);
						countComments();
					},
					error: function () {
						alert("문제가 발생했습니다. 다시 시도해 주세요.");
					}
				});
			}
		});
		//댓글 삭제 
		$("#comment_area").on("click", ".commentDelBtn", function () { 
			let mesg = "정말 삭제하시겠습니까?";
			if (confirm(mesg)) {
				$.ajax({
					type:"post",
					url:"CommentsDeleteServlet",
					data: {
						chall_id:"<%= chall_id %>",
						comment_id:$(this).attr("data-cid"),
						userid:"<%= currUserid %>",
					},
					dataType:"html",
					success: function (data) {
						$("#comment_area").html(data);
						countComments();
					},
					error: function () {
						alert("문제가 발생했습니다. 다시 시도해 주세요.");
					}
				});
			} else {
				event.preventDefault();
			}
		});
		//댓글 개수 구해오기
		function countComments() {
			$.ajax({
				type:"post",
				url:"CommentsCountServlet",
				data: {
					"chall_id":"<%= chall_id %>",
				},
				dataType:"text",
				success: function (data) {
					$("#commentsNum").text(data);
				},
				error: function () {
					alert("문제가 발생했습니다. 다시 시도해 주세요.");
				}
			});
		}
		//댓글 답글 창 보이기
		$("#comment_area").on("click", ".reply", function () {
			if ("<%= currUserid %>" == "null") {
				alert("로그인이 필요합니다.");
			} else {
				let comment_id = $(this).attr("data-cid");
				let commentUserid = $(this).attr("data-user");
				
				$("#reply"+comment_id).css("display", "block");
				$("#reply_content"+comment_id).focus();
				$("#reply_content"+comment_id).val("@"+commentUserid+"  ");
			}
		});
		
		//좋아요 추가/삭제
		$("#liked_area").on("click", ".liked", function () {
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
						alert("문제가 발생했습니다. 다시 시도해 주세요.");
					}
				});
			}
		});
		//목록으로 돌아가기
		$(".backList").on("click", function () {
			let preUrl = document.referrer;
			//게시글 업데이트한 후 이동한 페이지에서는 글작성 페이지로 돌아가지 않도록 최신글 화면으로 이동한다.
			if (preUrl.includes("ChallengeUIServlet")) {
				location.href = "ChallengeListServlet";
			} else {
				history.back();
			}
		});
		
		
	});
	

//댓글 게시 시각 구하기
function displayedAt(createdAt) {
	  const milliSeconds = new Date() - new Date(createdAt);
	  
	  const seconds = milliSeconds / 1000;
	  const minutes = seconds / 60;
	  const hours = minutes / 60;
	  const days = hours / 24;
	  const weeks = days / 7;
	  const months = days / 30;
	  const years = days / 365;
	  
	  if (seconds < 60) {
		  return "방금 전";
	  } else if (minutes < 60) {
		  return Math.floor(minutes)+"분 전";
	  } else if (hours < 24) {
		  return Math.floor(hours)+"시간 전";
	  } else if (days < 7) {
		  return Math.floor(days)+"일 전";
	  } else if (weeks < 5) {
		  return Math.floor(weeks)+"주 전";
	  } else if (months < 12) {
		  return Math.floor(months)+"개월 전";
	  } else {
		  return Math.floor(years)+"년 전";
	  }
}
	
</script>



<div class="container">
	<div id="challDetailContent">
		<div class="row">
		    <div class="d-flex w-75">
				<div class="w-50"><%= chall_category %></div>
				<div class="w-50"><%= chall_title %></div>
			</div>
			<div class="w-25">
			  <div class="float-end">
				<!-- 해당 게시글의 글쓴이인 경우 -->
				<% if (userid.equals(currUserid)) { %>
				<a href="ChallengeUIServlet?chall_id=<%= chall_id %>&userid=<%= currUserid %>" class="btn btn-outline-success">수정</a> 
				<a href="ChallengeDeleteServlet?chall_id=<%= chall_id %>&userid=<%= currUserid %>" id="deleteChallenge" class="btn btn-outline-success">삭제</a>
				<!-- 그외의 경우 -->
				<% } else { %>
				<a href="" class="btn btn-outline-success">신고</a>
				<% } %>
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
				   <img src="images/<%= profile_img %>" width="50" height="50"></a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="ProfileMainServlet?userid=<%= userid %>"><%= userid %></a>
			</div>
		</div>
		<div class="row p-3">
			<div class="col">
				<img src="/eclipse/upload/<%= chall_img %>" class="img"
					onerror="this.src='images/uploadarea.png'" width="600" height="600">
				<% if (stampMap != null) { %>
				<img src="/eclipse/upload/<%= stampMap.get("STAMP_IMG") %>" class="stamp" width="200" height="200">
				<% } %>
			</div>
		</div>
		<div class="row p-2 text-center">
			<div class="col" id="liked_area">
				<!-- 해당 게시글을 현재 로그인한 회원이 좋아요했던 경우 -->
				<% if (likedIt == 1) { %>
				<img src="images/liked.png" width="40" height="40" class="liked">
				<%= chall_liked %>
				<!-- 그외의 경우 -->
				<% } else { %>
				<img src="images/like.png" width="40" height="40" class="liked">
				<%= chall_liked %>
				<% } %>
			</div>
			<div class="col">
				<img src="images/bubble.png" width="37" height="35"> <span
					id="commentsNum"><%= chall_comments %></span>
			</div>
		</div>

		<div class="row p-4" style="height: 100px;">
			<%= chall_content %>
		</div>
		
	</div>
</div>


<!-- 댓글 목록 -->		
<div class="container mt-5 mb-5 comment">
    <div class="row height d-flex justify-content-center align-items-center">
        <div class="col-md-7">
         <hr>
            <div class="card">
                <div class="p-3">
                    <h6><b>댓글</b></h6>
                </div>
                <div class="mt-3 d-flex flex-row align-items-center p-3 form-color"> 
                	<img src="images/<%= currProfile_img %>" width="50" class="rounded-circle mr-2"> &nbsp;&nbsp;&nbsp;
                	<input type="text" class="comment_content form-control" name="comment_content"
                		placeholder="칭찬과 격려의 댓글은 작성자에게 큰 힘이 됩니다 :)"> 
                	<button class="commentBtn commentAddBtn">입력</button>
                </div>
                
                <div class="mt-2" id="comment_area"> 
                <% 
                HashMap<Integer, String> parentMap = new HashMap<Integer, String>();
                for (CommentsDTO comment : commentsList) {
			    	int comment_id = comment.getComment_id();
			    	String comment_content = comment.getComment_content();
			    	String comment_created = comment.getComment_created();
			    	String commentUserid = comment.getUserid();
			    	int parent_id = comment.getParent_id();
			    	int group_order = comment.getGroup_order();
			    	int step = comment.getStep();
			    	parentMap.put(comment_id, commentUserid);
	   	 		%>
                    <div class="d-flex flex-row p-3"> 
                      <% if (step != 0) { %>
                      <div style="width: 60px;"></div>
                      <% } %>
                    	<div class="profile">
                    		<a href="ProfileMainServlet?userid=<%= commentUserid %>">
                    			<img src="images/<%= profileMap.get(commentUserid) %>" width="30" height="30" class="rounded-circle mr-3"></a>
                        </div>
                        <div class="w-100">
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="d-flex flex-row align-items-center"> 
                                	<a href="ProfileMainServlet?userid=<%= commentUserid %>">
                                	<span class="mr-2"><%= commentUserid %></span></a> 
                                </div> 
                                <small id="commentTime<%= comment_id %>"></small>
                                	<script>$("#commentTime<%= comment_id %>").html(displayedAt('<%= comment_created %>'));</script>
                            </div>
                            <p class="text-justify mb-0">
                            	<% if (step != 0) { %><span style="color: green;">@<%= parentMap.get(parent_id) %> &nbsp;</span><% } %>
                            	<%= comment_content %></p>
                            <div class="d-flex flex-row user-feed"> 
                            	<a class="reply ml-3" data-cid="<%= comment_id %>" data-user="<%= commentUserid %>">답글 달기</a> &nbsp;&nbsp;&nbsp;
                            	<!-- 해당 댓글의 작성자인 경우 -->
                            	<% if (commentUserid!=null && commentUserid.equals(currUserid)) { %>
								<a class="ml-3 commentDelBtn" data-cid="<%= comment_id %>">삭제</a> 
								<!-- 그외의 경우 --> 
								<% } else { %> 
								<a class="ml-3">신고</a> 
								<% } %>
                            </div>
                        </div>
                    </div>
                    
                    
                    <!-- 답글 입력창 -->
                    <div id="reply<%= comment_id %>" style="display: none;">
	                    <div class="d-flex flex-row p-3">
	                    	<div style="width: 60px;"></div>
	                    	<div class="profile">
	                    		<img src="images/<%= currProfile_img %>" width="30" height="30" class="rounded-circle mr-3">
	                    	</div>
	                    	<div class="reply_box d-flex flex-row align-items-center w-100 text-justify mb-0">
	                    		<%-- <label class="idTag">@<%= commentUserid %></label> --%>
	                    		<input type="text" class="reply_content form-control" name="comment_content" id="reply_content<%= comment_id %>"> 
	                    		<button class="commentBtn commentReplyBtn" 
	                    			data-cid="<%= comment_id %>" data-group="<%= group_order %>"
	                    			data-parent="<%= parentMap.get(parent_id) %>">입력</button>
	                    			<!-- 답글 대상 아이디 보이기 -->
		                    		<script type="text/javascript">
		                    		 $("#reply_content<%= comment_id %>").on("input", function () {
		            					if (String($(this).val()).indexOf("@<%= commentUserid %>  ") == -1) {
		            						$(this).val("@<%= commentUserid %>  ");
		            					}
		            				 }); 
		                    		</script>
	                    	</div>
	                    </div>
                    </div>
                <%} %><!-- end for -->
                </div>
                
                
                
            </div>
        
        
        
        <div class="row pt-5">
		  <div class="col">
		  	<a class="backList btn btn-outline-success">목록</a>
		  </div>
		  <div class="col">
		    <div class="float-end">
		  	  <a href="ChallengeUIServlet" class="btn btn-outline-success">글쓰기</a>
		  	</div>
		  </div>
		</div>
		
		
        </div>
    </div>
</div>
		
		
		

		

