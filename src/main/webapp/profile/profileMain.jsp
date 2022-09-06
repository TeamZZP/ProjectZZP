<%@page import="com.dto.ReviewDTO"%>
<%@page import="com.dto.StampDTO"%>
<%@page import="java.util.LinkedHashSet"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.LinkedHashMap"%>
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
	
	//회원의 리뷰 목록 가져오기
	PageDTO reviewPageDTO = (PageDTO) request.getAttribute("reviewPageDTO");
	List<ReviewDTO> reviewList = reviewPageDTO.getList();
	int reviewListSize = reviewList.size();
	//회원의 리뷰 개수 가져오기
	int reviewNum = (Integer) request.getAttribute("reviewNum");
	//리뷰에 해당하는 상품 정보 가져오기
	HashMap<Integer, HashMap<String, String>> prodMap = (HashMap<Integer, HashMap<String, String>>) request.getAttribute("prodMap");
	
	//회원의 챌린지 목록 가져오기
	PageDTO pDTO = (PageDTO) request.getAttribute("pDTO");
	List<ChallengeDTO> challengeList = pDTO.getList();
	int challListSize = challengeList.size();
	//회원의 챌린지 개수 가져오기
	int totalCount = pDTO.getTotalCount();
	
	//회원의 도장 목록 가져오기
	PageDTO stampPageDTO = (PageDTO) request.getAttribute("stampPageDTO");
	List<StampDTO> stampList = stampPageDTO.getList();
	int stampNum = stampPageDTO.getTotalCount();
	
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
	.category:hover {
  		color: green;
		font-weight: bold;
		cursor: pointer;
	}
</style>

<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function () {
		$("body").on("click", ".category", function () {
			let category = $(this).attr("data-category")
			if (category == 'all') {
				location.href = 'ProfileMainServlet?userid=<%=userid%>'
			} else {
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
			}
		});
	});
</script>


<div class="col-lg-1 float-md-start">
	   <ul class="mt-5">
	     <li class="nav-link px-2 mb-1 link-dark"><a class="category" data-category="all">모두보기</a></li>
	     <li class="nav-link px-2 mb-1 link-dark"><a class="category" data-category="review">구매후기</a></li>
	     <li class="nav-link px-2 mb-1 link-dark"><a class="category" data-category="challenge">챌린지</a></li>
	     <li class="nav-link px-2 mb-1 link-dark"><a class="category" data-category="stamp">도장</a></li>
	   </ul>
</div>



<div class="container">
  <div class="row">
  
    <div class="col-lg-3 p-5">
		<div class="card" style="width: 100%; height: 22rem;">
		  <div class="text-center">
	      <img class="card-img-top w-50 pt-4" src="images/<%= profile_img %>" ><br>
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
		    <div class="col">구매후기 <span class="text-success fw-bold"><%= reviewNum %></span></div>
			 <div class="col"><div class="float-end"><small><a class="category" data-category="review">전체보기</a></small></div></div>
		  </div>
		  <div class="text-center mt-2">
		        <% for (int i = 0; i < reviewListSize; i++) { 
		        	ReviewDTO reviewDTO = reviewList.get(i);
		        	int review_id = reviewDTO.getREVIEW_ID();
		        	int p_id = reviewDTO.getP_ID();
		        	HashMap<String, String> map = prodMap.get(p_id);
		        	String image_route = map.get("IMAGE_ROUTE");
		        %>
		        <a href="ProductRetrieveServlet?p_id=<%=p_id%>"> 
					<img src="images/p_image/<%=image_route%>" border="0" align="middle" class="img"
						width="200" height="200" onerror="this.src='images/uploadarea.png'"></a>
		        <% } 
		        if (reviewListSize < 4) {
		        	for (int i = 0; i < 4-reviewListSize; i++) {
		        %>
		        	<img src="images/none.png" class="img" width="200" height="200" >
		        <% }
		        } %>
	      </div>
		</div><!-- end review -->
		
		
	
		<div>
		  <div class="row p-2 mx-4 mt-5">
		    <div class="col">챌린지 <span class="text-success fw-bold"><%= totalCount %></span></div>
			 <div class="col"><div class="float-end"><small><a class="category" data-category="challenge">전체보기</a></small></div></div>
		  </div>
		  <div class="text-center mt-2">
		        <% for (int i = 0; i < challListSize; i++) { 
		        	ChallengeDTO challDTO = challengeList.get(i);
		        	int chall_id = challDTO.getChall_id();
		        	String chall_img = challDTO.getChall_img();
		        %>
		        <a href="ChallengeDetailServlet?chall_id=<%=chall_id%>"> 
					<img src="/eclipse/upload/<%=chall_img%>" border="0" align="middle" class="img"
						width="200" height="200" onerror="this.src='images/uploadarea.png'"></a>
		        <% } 
		        if (challListSize < 4) {
		        	for (int i = 0; i < 4-challListSize; i++) {
		        %>
		        	<img src="images/none.png" class="img" width="200" height="200" >
		        <% }
		        } %>
	      </div>
		</div><!-- end challenge -->
		
		
		
		<div>
		  <div class="row p-2 mx-4 mt-5">
		    <div class="col">도장 <span class="text-success fw-bold"><%= stampNum %></span></div>
			 <div class="col"><div class="float-end"><small><a class="category" data-category="stamp">전체보기</a></small></div></div>
		  </div>
		  <div class="text-center mt-2">
		        <%  
		        for (StampDTO dto : stampList) {
					int stamp_id = dto.getStamp_id();
					String stamp_img = dto.getStamp_img();
					String stamp_name = dto.getStamp_name();
					String stamp_content = dto.getStamp_content();
		        %>
					<img src="/eclipse/upload/<%=stamp_img%>" border="0" align="middle" class="img"
						width="200" height="200" onerror="this.src='images/uploadarea.png'"
						 data-bs-toggle="modal" data-bs-target="#stampModal<%=stamp_id%>">
						<!-- Modal -->
							<div class="modal fade" id="stampModal<%=stamp_id%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
							  <div class="modal-dialog">
							    <div class="modal-content">
							      <div class="modal-header">
							        <h5 class="modal-title" id="exampleModalLabel"><%= stamp_name %></h5>
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
		        <%  }	 
		        if (stampNum < 4) {
		        	for (int i = 0; i < 4-stampNum; i++) {
		        %>
		        	<img src="images/none.png" class="img" width="200" height="200" >
		        <% }
		        } %>
	      </div>
		</div><!-- end stamp -->
		
		
		
		
		
	</div><!-- end profileContent -->
	
	
  </div><!-- end row -->

   
        
     
     
</div><!-- end container -->

