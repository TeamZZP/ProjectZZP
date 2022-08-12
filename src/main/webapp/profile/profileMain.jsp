<%@page import="java.util.List"%>
<%@page import="com.dto.ChallengeDTO"%>
<%@page import="com.dto.PageDTO"%>
<%@page import="com.dto.MemberDTO"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	HashMap<String, String> profileMap = (HashMap<String, String>) request.getAttribute("profileMap");
	String userid = profileMap.get("USERID");
	String profile_img = profileMap.get("PROFILE_IMG");
	String profile_txt = profileMap.get("PROFILE_TXT");
	
	//회원의 챌린지 목록 가져오기
	List<ChallengeDTO> challengeList = (List<ChallengeDTO>) request.getAttribute("challengeList");
	int challNum = challengeList.size();
	if (challNum > 4) {
		challNum = 4;
	}
	
	//session에 저장된 userid 읽어오기 
	MemberDTO member = (MemberDTO) session.getAttribute("login"); 
	String currUserid = null;
	if (member != null) {
		currUserid = member.getUserid();
	}
%>

<style>
	a {
		text-decoration: none;
		color: black;
	}
	.img {
		border-radius: 15px;
	}
</style>

<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function () {
		$(".container").on("click", ".category", function () {
			let category = $(this).attr("data-category");
			$.ajax({
				type:"get",
				url:"ProfileCategoryServlet",
				data: {
					userid:"<%=userid%>",
					category:category
				},
				dataType:"html",
				success: function (data) {
					$("#profileContent").html(data);
				},
				error: function () {
					alert("문제가 발생했습니다. 다시 시도해 주세요.");
				}
			});
			
		});
	});
</script>


<div class="container">

  <div>
    <ul class="list-group list-group-horizontal justify-content-center mt-5">
      <li class="list-group-item border-0"><a class="category" data-category="all">모두보기</a></li>
      <li class="list-group-item border-0"><a class="category" data-category="review">상품리뷰</a></li>
      <li class="list-group-item border-0"><a class="category" data-category="challenge">챌린지</a></li>
      <li class="list-group-item border-0"><a class="category" data-category="stamp">도장</a></li>
    </ul>
  </div>
<hr>
  <div class="row">
    <div class="col-lg-3 p-5">
		<div class="card" style="width: 18rem; height: 22rem;">
		  <div class="text-center">
	      <img class="card-img-top w-50 pt-4" src="images/<%= profile_img %>" width="400"><br>
	      </div>
	        <div class="card-body mt-4">
		      <h3 class="card-title text-center fw-bold"><%= userid %></h3>
		      <p class="card-text text-center"><%= profile_txt %></p>
		    </div>
		      <% if (userid.equals(currUserid)) { %>
		      	<div><a href="" class="float-end p-2">수정</a></div>
		      <%} %>
		</div>
	</div>
	
	
	<div id="profileContent" class="col-lg-9 p-5">
	
	
		<div>
		  <div class="row p-2 mx-4">
		    <div class="col">챌린지 <span class="text-success fw-bold"><%= challengeList.size() %></span></div>
			 <div class="col"><div class="float-end"><small><a class="category" data-category="challenge">전체보기</a></small></div></div>
		  </div>
		  <div class="text-center mt-2">
		        <% for (int i = 0; i < challNum; i++) { 
		        	ChallengeDTO challDTO = challengeList.get(i);
		        	int chall_id = challDTO.getChall_id();
		        	String chall_img = challDTO.getChall_img();
		        %>
		        <a href="ChallengeDetailServlet?chall_id=<%=chall_id%>"> 
					<img src="/eclipse/upload/<%=chall_img%>" border="0" align="middle" class="img"
						width="200" height="200" onerror="this.src='images/uploadarea.png'"></a>
		        <% } 
		        if (challNum < 4) {
		        	System.out.println(challNum);
		        	for (int i = 0; i < 4-challNum; i++) {
		        %>
		        	<img src="images/none.png" class="img" width="200" height="200" >
		        <% }
		        } %>
	      </div>
		</div>
		
		
		
		
		
	</div>
	
	
  </div>

   
        
     
     
</div>

