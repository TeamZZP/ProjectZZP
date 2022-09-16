<%@page import="com.dto.CouponMemberCouponDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.dto.PageDTO"%>
<%@page import="com.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
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
		$("#searchCategory").change(function () {
			var searchCategory = $("#searchCategory").val();
			location.href = "MyCouponServlet?searchCategory="+searchCategory
		});
	});// end ready	
</script>
<div id="addContainer">
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
	   		<a href="ProfileCategoryServlet?category=myreview&userid=<%=userid%>">내 구매후기</a>
	   </div>
	   <div class="col">
	   		<a href="MyCouponServlet" class="currCategory">내 쿠폰함</a>
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

<%
	String searchCategory = (String)request.getAttribute("searchCategory");
%>

<div class="col-lg-10">
<div id="addTableDiv">
<div style="">
	<form id="myCouponSearchForm" method="post">
		<div class="row">
			<div class="col-md-9"></div>
			<div class="col-md-3">
				<select id="searchCategory" name="searchCategory" class="form-select" aria-label="Default select example">
					<option selected disabled hidden>정렬</option>
					<option value="COUPON_DISCOUNT" <%if(searchCategory != null){
						if(searchCategory.equals("할인율 높은순")){ %> selected="selected" <% } } %> >할인율 높은순</option>
					<option value="COUPON_VALIDITY" <%if(searchCategory != null){
						if(searchCategory.equals("만료일순")){ %> selected="selected" <% } } %> >만료일순</option>
				</select>
			</div>
		</div>
	</form>		
</div>
<table id="addTable" class="table table-hover" style="text-align: center; vertical-align: middle;">
	<tr class="tableTop">
		<th>쿠폰번호</th>
		<th>쿠폰이미지</th>
		<th>쿠폰명</th>
		<th>할인율</th>
		<th>사용여부</th>
		<th>만료일</th>
	</tr>
	<%
		PageDTO pDTO  = (PageDTO)session.getAttribute("myCouponList");
		List<CouponMemberCouponDTO> myList = pDTO.getList();
		for(CouponMemberCouponDTO cDTO : myList){
			String val = cDTO.getCoupon_validity().substring(0,10);
	%>
	<tr>
		<td> <%= cDTO.getCoupon_id() %> </td>
	    <td> <img alt="쿠폰" src="images/coupon/<%= cDTO.getCoupon_img() %>" width="50" height="50"> </td>
		<td> <%= cDTO.getCoupon_name() %> </td>
		<td> <%= cDTO.getCoupon_discount() %> </td>
		<td> <%if(cDTO.getCoupon_used() == null){ %> 미사용 <% } else { %> 사용 <% } %></td>
		<td> <%= val %> </td>
	</tr>
	<%	} %>
	<tr>
		<td colspan="6" style="text-align: center;">
			 <%
		        int curPage = pDTO.getCurPage();
		        int perPage = pDTO.getPerPage();
				int totalCount = pDTO.getTotalCount();
				int totalPage = totalCount/perPage; //페이지수 구하기
				if(totalCount%perPage!=0) totalPage++; //페이지수 구하기 나머지가 있으면 +1
		        for(int i=1; i <= totalPage; i++){//1페이지부터 시작함으로 i=1
		          	if(i== curPage){
		          		out.print(i+"&nbsp;"); //현재페이지
		          	}else{
		          		out.print("<a style='color: green;' href = 'MyCouponServlet?curPage="+i+"'>" + i + " </a>");  
		          	} //다른 페이지 선택시 링크로 이동
		        }//end for
		  	 %>
		</td>
	</tr>
</table>
</div>
</div>
</div>
</div>
</div>    