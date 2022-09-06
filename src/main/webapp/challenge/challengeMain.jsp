<%@page import="com.dto.MemberDTO"%>
<%@page import="com.dto.StampDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.dto.PageDTO"%>
<%@page import="com.dto.ChallengeDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	a {
		text-decoration: none;
		color: black;
	}
	/*ZoomIn Hover Effect*/  
     .hover-zoomin a {
      display: block;
      position: relative;
      overflow: hidden;
      border-radius: 15px;
    }
    .hover-zoomin img:not(.stamp) {
      width: 100%;
      height: auto;
      -webkit-transition: all 0.2s ease-in-out;
      -moz-transition: all 0.2s ease-in-out;
      -o-transition: all 0.2s ease-in-out;
      -ms-transition: all 0.2s ease-in-out;
      transition: all 0.2s ease-in-out;
    }
    .hover-zoomin:hover img:not(.stamp) {
      -webkit-transform: scale(1.1);
      -moz-transform: scale(1.1);
      -o-transform: scale(1.1);
      -ms-transform: scale(1.1);
      transform: scale(1.1);
    } 
    
    .form-select {
    	display: inline;
    	width: 150px;
    }
    
    .stamp {
    	position: absolute; 
		/* left: 198px;  
		top: -15px; */
		left: 62%;
		top: -6%; 
		width: 40%;
    }
    .challThisMonth {
    	font-weight: bold;
    	color: green;
    	margin-left: 10px;
    }
    .challThisMonth:hover {
    	font-weight: bold;
    	color: #006600;
    	margin-left: 10px;
    }
    
    .custom-tooltip {
  		--bs-tooltip-bg: var(--bs-success);
	}
	.tooltip-inner {
  		max-width: 430px;
	}

</style>
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
	//프로필 가져오기
	HashMap<String, String> profileMap = (HashMap<String, String>) request.getAttribute("profileMap");
	//이달의 챌린지 가져오기
	ChallengeDTO challThisMonth = (ChallengeDTO) request.getAttribute("challThisMonth");
	//현재 회원이 좋아요 누른 목록 가져오기
	HashMap<Integer, Integer> resultLikedMap = (HashMap<Integer, Integer>) request.getAttribute("resultLikedMap");
	//각 게시글마다 도장 가져오기
	HashMap<String, String> stampListMap = (HashMap<String, String>) request.getAttribute("stampListMap");
	//이 달의 챌린지 도장 가져오기
	StampDTO stampDTO = (StampDTO) request.getAttribute("stampDTO");
	String stamp_img = stampDTO.getStamp_img();
	String stamp_name = stampDTO.getStamp_name();
	String stamp_content = stampDTO.getStamp_content();
	
	//session에 저장된 메시지가 있는 경우 경고창 띄워주고 삭제하기
	String mesg = (String) session.getAttribute("mesg");
	if (mesg != null) {
%>
	<script type="text/javascript">
		alert("<%= mesg %>");
	</script>
<% } 
	session.removeAttribute("mesg"); %>


<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
 	$(document).ready(function () {
 		//정렬 기준 선택시 form 제출
		$("#sortBy").on("change", function () {
			$("form").submit();
		});
		//좋아요 추가/삭제
		$(".liked_area").on("click", ".liked", function () {
			if ("<%= currUserid %>" == "null") {
				alert("로그인이 필요합니다.");
			} else {
				let cid = $(this).attr("data-cid");
				$.ajax({
					type:"post",
					url:"LikeServlet",
					data: {
						chall_id:cid,
						userid:"<%= currUserid %>"
					},
					dataType:"text",
					success: function (data) {
						$("#liked_area"+cid+" .liked").attr("src", data);
						countLikes(cid);
					},
					error: function () {
						alert("문제가 발생했습니다. 다시 시도해 주세요.");
					}
				}); 
			}
		});
		//좋아요 개수 구해오기
		function countLikes(cid) {
			$.ajax({
				type:"post",
				url:"LikeCountServlet",
				data: {
					chall_id:cid,
				},
				dataType:"text",
				success: function (data) {
					$("#likeNum"+cid).text(data);
				},
				error: function () {
					alert("문제가 발생했습니다. 다시 시도해 주세요.");
				}
			});
		}
		
		//툴팁 활성화
		let tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
		let tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
				  			return new bootstrap.Tooltip(tooltipTriggerEl)
						})
		
	}); 
 	
</script>

<form action="ChallengeListServlet">
<div class="container">
   <div class="row">
     <div class="col-sm-6">
       <a href="ChallengeDetailServlet?chall_id=<%= challThisMonth.getChall_id() %>"><%= challThisMonth.getChall_title() %>
        <span class="challThisMonth">참여하러가기</span> </a> 
        <a data-bs-toggle="tooltip" data-bs-placement="top" data-bs-custom-class="custom-tooltip"
        		title="매달 바뀌는 챌린지 도전 과제에 참여해 보세요! '이 달의 챌린지' 카테고리를 선택해 챌린지 인증 사진을 올려주세요. 참여시 받을 수 있는 예쁜 도장을 모아보세요!">
        	<img src="images/help.png" width="25" style="margin-top: -5px;">
        </a>
     </div>
     <div class="col-sm-6">
       <div class="float-end">
		<select name="sortBy" id="sortBy" class="form-select">
			<option selected disabled hidden>정렬</option>
			<option value="chall_id" <%if ("chall_id".equals(sortBy)) {%>selected <%}%>>최신순</option>
			<option value="chall_liked" <%if ("chall_liked".equals(sortBy)) {%>selected <%}%>>인기순</option>
			<option value="chall_comments" <%if ("chall_comments".equals(sortBy)) {%> selected <%}%>>댓글 많은순</option>
		</select> 
		<a href="ChallengeUIServlet" class="btn btn-outline-success" style="margin-bottom: 5px;">글쓰기</a>
	   </div>
	 </div>
	 <div style="height: 10px"></div>
	 
	 <%
		for (int i=1; i<= list.size(); i++) {
			ChallengeDTO dto = list.get(i-1);
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
			
			String profile_img = profileMap.get(userid);
	%>
					
     <div class="col-lg-3 col-md-4 col-sm-6">
       <div class="p-3">
	       <a href="ProfileMainServlet?userid=<%=userid%>"><img src="images/<%=profile_img%>" width="30" height="30"></a>&nbsp;&nbsp;
	       <a href="ProfileMainServlet?userid=<%=userid%>"><%=userid%></a><br>
       </div>
       <div class="hover-zoomin">
	       <a href="ChallengeDetailServlet?chall_id=<%=chall_id%>"> 
			<img src="/eclipse/upload/<%=chall_img%>" border="0" onerror="this.src='images/uploadarea.png'">
			<% if (stampListMap.containsKey(String.valueOf(chall_id))) { %>
			<img src="/eclipse/upload/<%=stampListMap.get(String.valueOf(chall_id))%>" class="stamp">
			<%} %>
		   </a>
	   </div>
	   <div class="p-2 text-center liked_area" id="liked_area<%=chall_id%>">
	   	   <!-- 해당 게시글을 현재 로그인한 회원이 좋아요했던 경우 -->
	   	   <% if (resultLikedMap.containsKey(chall_id)) { %>
	   	   <img src="images/liked.png" width="30" height="30" class="liked" data-cid="<%=chall_id%>">
	   	   <!-- 그외의 경우 -->
	   	   <% } else { %>
	       <img src="images/like.png" width="30" height="30" class="liked" data-cid="<%=chall_id%>">
		   <% } %>
		   <span id="likeNum<%=chall_id%>"><%=chall_liked%></span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		   <img src="images/bubble.png" width="30" height="25"> <%=chall_comments%>
	   </div>
	   <div class="pb-5 text-center">
	   		<a href="ChallengeDetailServlet?chall_id=<%=chall_id%>"><%=chall_title%></a>
	   </div>
     </div>
	<%
	 	} //end for
	%>

	<!-- 검색기능 -->
	<div class="d-flex justify-content-center p-2">
		<select name="searchName" class="form-select p-2">
			<option value="userid" <% if("userid".equals(searchName)) {%>selected<%} %>>아이디</option>
			<option value="chall_title" <% if("chall_title".equals(searchName)) {%>selected<%} %>>제목</option>
			<option value="chall_content" <% if("chall_content".equals(searchName)) {%>selected<%} %>>내용</option>
		</select>
		&nbsp;
		<input type="text" name="searchValue" class="form-control" style="width: 200px;" <% if(searchValue!=null && !searchValue.equals("null")) {%>value="<%=searchValue%>"<%} %>>
		&nbsp;
		<button class="btn btn-outline-success">검색</button>
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
		    		out.print("<a href='ChallengeListServlet?curPage="+p
		    				+"&searchName="+searchName+"&searchValue="+searchValue
		    				+"&sortBy="+sortBy+"'>"+p+"</a>&nbsp;&nbsp;");
		    	} 
		    }
	  %>
	  </div>
   </div>
</div> 	
</form>    
    
    
  
<button id="stampBtn" type="button" data-bs-toggle="modal" data-bs-target="#stampModal" style="display: none;"></button>
 <!-- Modal -->
	<div class="modal fade" id="stampModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">도장을 획득했습니다! <<%= stamp_name %>></h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body text-center">
	      <img src="/eclipse/upload/<%=stamp_img%>" width="400">
	      </div>
	      <div class="modal-footer mb-3 text-center">
	       <%= stamp_content %>
	      </div>
	    </div>
	  </div>
	 </div>
	 
<% //session에 저장된 stampMesg가 있는 경우 모달 띄워주고 삭제하기
	String stampMesg = (String) session.getAttribute("stampMesg");
	if (stampMesg != null) {
%>
	<script type="text/javascript">
	$('#stampBtn').trigger('click')
	</script>
<% } 
	session.removeAttribute("stampMesg"); %>