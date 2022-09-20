<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.dto.ProductOrderReviewImagesDTO"%>
<%@page import="com.dto.ImagesOrderDTO"%>
<%@page import="com.dto.ImagesDTO"%>
<%@page import="com.dto.ProductOrderDTO"%>
<%@page import="com.dto.OrderDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.dto.MemberDTO"%>
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

    <%
    //session에 저장된 userid 읽어오기 
    	  	MemberDTO member = (MemberDTO) session.getAttribute("login"); 
    	  	String userid = null;
    	  	if (member != null) {
    	  		userid = member.getUserid();
    	  	}
    %>
    
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function () {
		$(".chk").click(function () {
			var chk = $(this);
			var ORDER_ID = $(this).attr("data-orderID");
			var REVIEW_ID = $(this).attr("data-reviewID");
			var P_NAME = $(this).attr("data-pNAME");
			var P_ID = $(this).attr("data-pID");
		 	$.ajax({
				type:"post",
				url:"orderIdCheckServlet",
				data:{
					ORDER_ID : ORDER_ID,
					P_ID : P_ID
				},
				dataType:"text",
				success: function (data, status, xhr) {
					if (data == 0) {
						chk.attr("href","reviewInsert.jsp?ORDER_ID="+ORDER_ID+"&P_NAME="+P_NAME+"&P_ID="+P_ID);
					} else {
						chk.attr("href","reviewOneSelect?REVIEW_ID="+REVIEW_ID+"&P_ID="+P_ID);
					}
				},
				error: function (xhr, status, error) {
					
				} 
			});//end ajax
		});
		$("#searchBtn").click(function () {
			var search = $("#search").val();
			var searchCategory = $("#searchCategory").val();
			$("#myOrderSearchForm").attr("action", "MyOrderServlet?search="+search+"&searchCategory="+searchCategory); 
		});
	}); //end ready
</script> 
    
<div id="addContainer">
<div class="container">
<div class="row">
<div class="col-lg-2">
		<div class="col">
			<a href="MypageServlet">마이페이지 홈</a>
		</div>
	   <div class="col">
	   		<a href="MyOrderServlet"  class="currCategory">주문 내역</a>
	   </div>
	   <div class="col">반품/취소/교환 목록</div>
	   <div class="col">
	   		<a href="ProfileCategoryServlet?category=myreview&userid=<%=userid%>">내 구매후기</a>
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
<%
	String searchCategory = (String)request.getAttribute("searchCategory");
	String search = (String)request.getAttribute("search");
	System.out.println("검색어 " + search + "\t" + searchCategory);
%>
<form id="myOrderSearchForm">
	<div class="row">
		<div class="col-md-3"></div>
		<div class="col-md-2">
			<select id="searchCategory" name="searchCategory" class="form-select" aria-label="Default select example">
				<option value="P_NAME" <%if(searchCategory != null && search != null){
					if(searchCategory.equals("상품명")){ %> selected="selected" <% } } %> >상품명</option>
				<option value="ORDER_DATE" <%if(searchCategory != null && search != null){
					if(searchCategory.equals("구매날짜")){ %> selected="selected" <% } } %> >구매날짜</option>
			</select>
		</div>
		<div class="col-md-5">
			<input type="text" id="search" name="search" class="form-control" placeholder=" ex) 상품명:칫솔   ex) 날짜:YY/MM/DD 혹은 MM/DD"
			<%if(search != null){ %> value="<%=search %>" <%} %>>
		</div>
		<div class="col-md-2">
			<button type="submit" id="searchBtn" class="btn btn-outline-success">구매항목검색</button>
		</div>
	</div>
</form>
<br>
<form id="myOrderForm" method="post">
<table id="addTable" class="table table-hover" style="text-align: center; vertical-align: middle;">
	<tr class="tableTop">
		<th width="25%">상품명</th>
		<th width="10%">가격</th>
		<th width="10%">주문날짜</th>
		<th width="35%">주소</th>
		<th width="10%">배송상태</th>
		<th></th>
	</tr>
	<%
		PageDTO pDTO = (PageDTO)session.getAttribute("myOrderList");
		List<ProductOrderReviewImagesDTO> myList = pDTO.getList();
			for (int i = 0; i < myList.size(); i++) {
				ProductOrderReviewImagesDTO DTO = myList.get(i);
				String date = DTO.getOrder_date();
				String day = date.substring(0,10);
				System.out.println("날짜 " + day);
	%>
	<tr>
	    <td> 
	    	<a href="ProductRetrieveServlet?p_id=<%=DTO.getP_id()%>"> 
	   		<img alt="상품사진" src="images/p_image/<%=DTO.getImage_route()%>" width="100px" height="100px"> 
	    	<br> <%= DTO.getP_name() %> 
	    	</a>
	    </td>
	    <td> <%= DTO.getTotal_price() %> </td>
		<td> <%= day %> </td>
		<td> <%= DTO.getDelivery_address() %> <br>  <%-- <%= DTO.getDelivery_loc() %> --%> </td>
		<td> <%= DTO.getOrder_state() %> </td>
		<td> 
			<% if(DTO.getOrder_state().equals("배송완료")){ %>
				<a data-orderID="<%= DTO.getOrder_id() %>" data-pNAME="<%= DTO.getP_name() %>" 
					data-pID="<%= DTO.getP_id() %>" data-reviewID="<%=DTO.getReview_id() %>"
					data-userid="<%=userid %>"
					class="btn btn-outline-success chk" role="button">
					리뷰작성
				 </a>
				<input type="hidden" class="ORDER_ID" value="<%= DTO.getOrder_id() %>">
				<input type="hidden" class="P_NAME" value="<%= DTO.getP_name() %>">
				<input type="hidden" class="P_ID" value="<%= DTO.getP_id() %>">
			<%} else { %> 
				<button type="button" class="btn btn-outline-secondary">배송현황</button> 
			<% } %>
		</td>
	</tr>
	<%	} %>
	<tr>
		<td colspan="7" style="text-align: center;">
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
		          		out.print("<a style='color: green;' href = 'MyOrderServlet?curPage="+i+"'>" + i + " </a>");  
		          	} //다른 페이지 선택시 링크로 이동
		        }//end for
		  	 %>
		</td>
	</tr>
</table>
</form>
</div>
</div>
</div>
</div>
</div>