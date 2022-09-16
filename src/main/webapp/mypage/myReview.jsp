<%@page import="com.dto.MemberDTO"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.dto.ReviewDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.dto.PageDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String mesg = (String)session.getAttribute("mesg");
	if(mesg != null){
%>
	<script>
		alert("<%=mesg%>");
	</script>
<%
	}
	session.removeAttribute("mesg");
%>    
    
<%
	//회원의 리뷰 목록 가져오기
	PageDTO pDTO = (PageDTO) request.getAttribute("reviewPageDTO");
	List<ReviewDTO> reviewList = pDTO.getList();
	
	//리뷰에 해당하는 상품 정보 가져오기
	HashMap<Integer, HashMap<String, String>> prodMap = (HashMap<Integer, HashMap<String, String>>) request.getAttribute("prodMap");
	//회원의 리뷰 개수 가져오기
	int reviewNum = pDTO.getTotalCount();
	
	//session에 저장된 userid 읽어오기 
	MemberDTO member = (MemberDTO) session.getAttribute("login"); 
	String userid = null;
	if (member != null) {
		userid = member.getUserid();
	}
%>

<style>
	a {
		color : black;
		text-decoration: none;
	}
	.currCategory {
		color: green; 
		font-weight: bold;
	}
	.tableTop {
    	border-bottom-color: #24855B;
    	border-bottom-width: 2.5px;
    }
</style>

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function () {
		$(".reviewUpdate").click(function () {
			var REVIEW_ID = $(this).attr("data-reviewID");
			var P_ID = $(this).attr("data-pID");
			$("#reviewForm").attr("action","reviewOneSelect?REVIEW_ID="+REVIEW_ID+"&P_ID="+P_ID);
		});
		$(".reviewDelete").click(function () {
			var REVIEW_ID = $(this).attr("data-reviewID");
			var USERID = $(this).attr("data-userid");
			$.ajax({
				type:"post",
				url:"reviewDeleteServlet",
				data:{
					REVIEW_ID:REVIEW_ID,
					USERID:USERID
				},
				dataType:"text",
				success: function (data, status, xhr) {
					console.log(data);
					if (data == "삭제성공") {
						location.href= "ProfileCategoryServlet?category=myreview&userid="+USERID;
						alert("리뷰가 삭제되었습니다.");
					} else {
						alret("리뷰 삭제를 실패했습니다. 다시 시도해주세요");
					} 
				},
				error: function (xhr, status, error) {
					
				}
			});//end ajax
		});
		$(".uploadBtu").click(function () {
			var popupX = (document.body.offsetWidth / 2) - (200 / 2);
			var popupY= (window.screen.height / 2) - (300 / 2);
			
			var img = $(this).children(img).attr("src");
			console.log(img);
			
			window.open('showImgReview.jsp?img='+img , '', 'status=no, height=500, width=400, left='+ popupX + ', top='+ popupY);
		});
	});//end ready
</script>

<div class="container">
<div class="row">
	<div class="col-lg-2">
		<div class="col">
			<a href="MypageServlet">마이페이지 홈</a>
		</div>
	   <div class="col"> 
	   		<a href="MyOrderServlet">주문 내역</a> 
	   </div>
	   <div class="col">반품/취소/교환 목록</div>
	   <div class="col">
	   		<a href="ProfileCategoryServlet?category=myreview&userid=<%=userid%>" class="currCategory">내 구매후기</a>
	   </div>
	   <div class="col">
	   		<a href="MyCouponServlet">내 쿠폰함</a>
	   </div>
	   <div class="col">
	   		<a href="ProfileCategoryServlet?category=mychallenge&userid=<%=userid%>">내 챌린지</a>
	   </div>
	   <div class="col">
	   		<a href="ProfileCategoryServlet?category=mystamp&userid=<%=userid%>">내 도장</a>
	   </div>
	   <div class="col">
	      <a href="MyQuestionServlet">내 문의 내역</a>
	   </div>
	   <div class="col">
	      <a href="AddressListServlet">배송지 관리</a>
	   </div>
	   <div class="col">
	      <a href="checkPasswd.jsp">계정 관리</a>
	   </div>
	</div>
<div class="col-lg-10">
<div id="addTableDiv">
<form method="post" id="reviewForm">
<table id="reviewTable" class="table table-hover">
	<tr class="tableTop text-center">
		<th width="25%">상품정보</th>
		<th width="40%" colspan="2">내용</th>
		<th width="20%">등록일</th>
		<th width="15%">수정·삭제</th>
	</tr>
	<%
	for (int i = 0; i < reviewList.size(); i++) {	
		ReviewDTO dto = reviewList.get(i);
		int review_id = dto.getReview_id();
		int p_id = dto.getP_id();
		String review_title = dto.getReview_title();
		String review_content = dto.getReview_content();
		String review_rate = dto.getReview_rate();
		String review_img = dto.getReview_img();
		String review_created = dto.getReview_created().substring(0,10);
		
		HashMap<String, String> map = prodMap.get(p_id);
		String p_name = map.get("P_NAME");
		String image_route = map.get("IMAGE_ROUTE");
	%>
	<tr>
		<td style="padding:5 0 0 10px;" class="text-center">
			<a href="ProductRetrieveServlet?p_id=<%=p_id%>"> 
			<img src="images/p_image/<%=image_route%>" border="0" align="middle" class="img pb-1"
					 width="100px" height="100px" onerror="this.src='images/uploadarea.png'"><br>
			<%= p_name %></a>
		</td>
		<td class="align-middle">
			  <b><%= review_title %></b><br><br>
			  <%= review_content %><br>
			  <span class="badge rounded-pill bg-secondary mt-1"><%= review_rate %></span>
		</td>
		<td style="text-align: center; vertical-align: middle;">
				<%if(dto.getReview_img() == null || dto.getReview_img().equals("null")){ %>
					
				<%} else { %>
					<div class="uploadBtu">
						<img class="upload" alt="" src="/eclipse/upload/<%=dto.getReview_img()%>" width="100px" height="100px" style="border: 1px solid gray;">
					</div>
				<%} %>
		</td>
		<td class="align-middle text-center">
			<div><%= review_created %></div>
		</td>
		<td class="align-middle text-center">
			<button class="btn btn-light btn-sm reviewUpdate" data-reviewID="<%=dto.getReview_id() %>" data-pID=<%=dto.getP_id() %>>수정</button>
			<button type="button" class="btn btn-light btn-sm reviewDelete" data-reviewID="<%=dto.getReview_id() %>" data-userid="<%=dto.getUserid()%>">삭제</button>
		</td>
	</tr>
<%
		}
%>
	<tr>
		<td colspan="6" style="text-align: center;">
			 <%
		        int curPage = pDTO.getCurPage();
		        int perPage = pDTO.getPerPage();
				int totalCount = pDTO.getTotalCount();
				int totalPage = totalCount/perPage;
				if(totalCount%perPage!=0) totalPage++;
		        for(int i=1; i <= totalPage; i++){
		          	if(i== curPage){
		          		out.print(i+"&nbsp;"); 
		          	}else{
		          		out.print("<a style='color: green;' href = 'ProfileCategoryServlet?category=myreview&userid="+userid+"&curPage="+i+"'>" + i + " </a>");  
		          	} 
		        }
		  	 %>
		</td>
	</tr>
</table>
</form>
</div>
</div>
</div>
</div>

