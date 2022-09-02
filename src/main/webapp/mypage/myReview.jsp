<%@page import="com.dto.MemberDTO"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.dto.ReviewDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.dto.PageDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</style>

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function () {
		$(".reviewUpdate").click(function () {
			/* var REVIEW_ID = $(this).attr("data-reviewID");
			console.log(REVIEW_ID); */
			console.log("클릭");
			//$("#reviewForm").attr("action","reviewOneSelect?REVIEW_ID="+REVIEW_ID);
		});
		$(".reviewDelete").click(function () {
			console.log("클릭");
		});

	});//end ready
</script>

<div class="container">
<div class="row">
	<div class="col-lg-2">
		<div class="col">
			<a href="MypageServlet">마이페이지 홈</a>
		</div>
	   <div class="col" > 
	   		<a href="MyOrderServlet">주문 내역</a> 
	   </div>
	   <div class="col">반품/취소/교환 목록</div>
	   <div class="col">
	   		<a href="ProfileCategoryServlet?category=myreview&userid=<%=userid%>" class="currCategory">내 구매후기</a>
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
<!-- <form method="post" id="reviewForm"> -->
<table id="reviewTable" class="table table-hover">
	<tr class="table-success text-center">
		<th width="25%">상품정보</th>
		<th width="40%">내용</th>
		<th width="20%">등록일</th>
		<th width="15%">수정·삭제</th>
	</tr>
	<%
	for (int i = 0; i < reviewList.size(); i++) {	
		ReviewDTO dto = reviewList.get(i);
		int review_id = dto.getREVIEW_ID();
		int p_id = dto.getP_ID();
		String review_title = dto.getREVIEW_TITLE();
		String review_content = dto.getREVIEW_CONTENT();
		String review_rate = dto.getREVIEW_RATE();
		String review_img = dto.getREVIEW_IMG();
		String review_created = dto.getREVIEW_CREATED().substring(0,10);
		
		HashMap<String, String> map = prodMap.get(p_id);
		String p_name = map.get("P_NAME");
		String image_route = map.get("IMAGE_ROUTE");
	%>
	<tr>
		<td style="padding:5 0 0 10px;" class="text-center">
			<a href="ProductRetrieveServlet?p_id=<%=p_id%>"> 
			<img src="images/p_image/<%=image_route%>" border="0" align="middle" class="img pb-1"
					 style="width: 70%;"	onerror="this.src='images/uploadarea.png'"><br>
			<%= p_name %></a>
		</td>
		<td class="align-middle">
			  <b><%= review_title %></b><br><br>
			  <%= review_content %><br>
			  <%= review_rate %>
		</td>
		<td class="align-middle text-center">
			<div><%= review_created %></div>
		</td>
		<td class="align-middle text-center">
			<button class="btn btn-light btn-sm" class="reviewUpdate" data-reviewID="<%=dto.getREVIEW_ID() %>">수정</button>
			<button class="btn btn-light btn-sm" class="reviewDelete" data-reviewID="<%=dto.getREVIEW_ID() %>">삭제</button>
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
<!-- </form> -->
</div>
</div>
</div>
</div>

