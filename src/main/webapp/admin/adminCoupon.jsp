<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.dto.CouponDTO"%>
<%@page import="com.dto.PageDTO"%>
<%@page import="com.dto.CategoryProductDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	#search {
		text-decoration: none;
		color: black;
	}
	.form-select {
		width: 140px; 
		display: inline;
	}
	.searchValue {
		width: 150px; 
		display: inline;
	}
	.productDetail{
		cursor: pointer;
	}
	.modal-body{
		text-align: center;
	}	
	#mesg{
		margin: 0;
	}
	#modalBtn{
		display: none;
	}
</style>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		//상품검색
		$("#searchCoupon").click(function() {
			$("#CouponForm").submit();
		});
		//정렬 기준 선택시 form 제출
		$("#sortBy").on("change", function() {
			$("#CouponForm").submit();
		});
		//관리자페이지 카테고리
		$(".category").click(function() {
			let category = $(this).attr("data-category");
			location.href = "AdminCategoryServlet?category=" + category;
		});
		//상품검색
		$("#searchCoupon").click(function() {
			$("#CouponForm").submit();
		});
		//정렬 기준 선택시 form 제출
		$("#sortBy").on("change", function() {
			$("#CouponForm").submit();
		});
		//상품등록 버튼
		$("#addCoupon").click(function() {
			location.href = "../adminProductAdd.jsp";
		});
		//체크박스 전체선택
		$("#checkAll").click(function() {
			$(".delCheck").prop('checked', $(this).prop('checked'));
		});
		//체크박스 선택 삭제
		$(".delCheckBtn").click(function() {
			if ($('.delCheck:checked').length == 0) {
				$("#modalBtn").trigger("click");
				$("#mesg").text("삭제할 상품을 선택해 주세요.");
			} else {
				$("#modalBtn").trigger("click");
				$("#mesg").html("선택한 상품을 삭제하시겠습니까?");
			}
		});
	});
</script>
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
	String searchName = (String) request.getAttribute("searchName");
	String searchValue = (String) request.getAttribute("searchValue");
	String sortBy = (String) request.getAttribute("sortBy");
	System.out.println(sortBy);
%>

<div class="container col-md-auto">
<div class="row justify-content-md-center">
	<form action="AdminCategoryServlet" id="CouponForm">
	<input type="hidden" name="category" value="coupon">
		<div class="container mt-2 mb-2">
			<div class="row">
			  	<div class="col">
					<select class="form-select sortBy" name="searchName" data-style="btn-info" id="inputGroupSelect01">
						<option selected disabled hidden>검색 기준</option>
						<option value="COUPON_NAME" <% if("COUPON_NAME".equals(searchName)){%> selected <%}%>>쿠폰이름</option>
						<option value="COUPON_DISCOUNT" <% if("COUPON_DISCOUNT".equals(searchName)){%> selected <%}%>>할인율</option>
					</select> 
					<input type="text" name="searchValue" class="form-control searchValue" 
		  				<% if(searchValue!=null && !searchValue.equals("null")) {%>value="<%= searchValue %>"<% } %>>
		  			<button type="button" class="btn btn-success" id="searchProd" style="margin-top: -5px;">검색</button>
		  	  	</div>
	      	  	<div class="col">
	      	  		<div class="float-end">
					  <select class="form-select sortBy" name="sortBy" id="sortBy" data-style="btn-info">
						    <option selected disabled hidden>정렬</option>
						    <option value="COUPON_DISCOUNT_up" <% if("COUPON_DISCOUNT_up".equals(sortBy)){%>selected<%}%>>할인율 높은순</option>
						    <option value="COUPON_DISCOUNT_down" <% if("COUPON_DISCOUNT_down".equals(sortBy)){%>selected<%}%>>할인율 낮은순</option>
						    <option value="COUPON_VALIDITY" <% if("COUPON_VALIDITY".equals(sortBy)){%>selected<%}%>>유효기간순</option>
						    <option value="COUPON_CREATED" <% if("COUPON_CREATED".equals(sortBy)){%>selected<%}%>>등록일순</option>
					  </select>
					  <a href="adminCouponInsert.jsp" class="btn btn-success" style="margin-top: -5px;">쿠폰등록</a>
				  </div>
		    	</div>
			</div>
		</div>
		<div class="container col-md-auto">
		<div class="row justify-content-md-center">
		<table class="table table-hover table-sm" style="text-align: center; vertical-align: middle;">
			<tr>
				<th><input type="checkbox" id="checkAll"></th>
				<th>쿠폰번호</th>
				<th>쿠폰이미지</th>
				<th>쿠폰명</th>
				<th>할인율</th>
				<th>등록일</th>
				<th>만료일</th>
				<th></th>
			</tr>
		<%
			PageDTO pDTO = (PageDTO) request.getAttribute("pDTO");
			List<CouponDTO> couponList = pDTO.getList();
			for ( int i = 0 ; i < couponList.size() ; i++ ) {
				CouponDTO cDTO = couponList.get(i);
				String created = cDTO.getCoupon_created();
	 			String create = created.substring(0, 10);
	 			
	 			String validity = cDTO.getCoupon_validity();
	 			String val = validity.substring(0, 10);
		%>
			<tr id="list">
				<td><input type="checkbox" class="delCheck" name="COUPON_ID" value="<%=cDTO.getCoupon_id() %>"></td>
				<td> <%=cDTO.getCoupon_id() %> </td>
				<td> <img alt="쿠폰" src="images/coupon/<%=cDTO.getCoupon_img()%>" width="50px" height="50px"> </td>
				<td> <%=cDTO.getCoupon_name() %> </td>
				<td> <%=cDTO.getCoupon_discount() %> </td>
				<td> <%=create %> </td>
				<td> <%=val %> </td>
				<td>
					<button type="button" id="delCoupon<%=cDTO.getCoupon_id() %>" data-id="<%=cDTO.getCoupon_id() %>" class="btn btn-outline-dark btn-sm" data-bs-toggle="modal" data-bs-target="#deleteCoupon<%=cDTO.getCoupon_id() %>">
						삭제
					</button>
					<div class="modal fade modal-first" id="deleteCoupon<%=cDTO.getCoupon_id()%>" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="staticBackdropLabel">쿠폰 삭제</h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <div class="modal-body">
					        선택한 쿠폰을 삭제하시겠습니까?
					      </div>
					      <div class="modal-footer">
					        <button type="button" name="delete" id="delCoupon<%=cDTO.getCoupon_id() %>" data-id="<%=cDTO.getCoupon_id() %>" class="btn btn-success">삭제</button>
					        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
					      </div>
					    </div> 
					  </div>
					</div>
				</td>
		<%		
			}	
		%>
			</tr>
		</table>
		<div>
		  <div class="float-end me-3" style="margin-top: -8px;">
			<button type="button" class="delCheckBtn btn btn-outline-dark btn-sm" style="width: 80px;"
							data-bs-target="#deleteModal" data-bs-id="">선택삭제</button>
		  </div>
		</div>
		 <div class="p-2 text-center">
		<%
			int curPage = pDTO.getCurPage();
			int perPage = pDTO.getPerPage();
			int totalCount = pDTO.getTotalCount();
			int totalPage = totalCount/perPage;
			if(totalCount%perPage!=0) totalPage++;
			for(int p=1; p<=totalPage; p++){
				if(p==curPage){
					out.print("<b>"+p+"</b>&nbsp;&nbsp;");
				} else {
					out.print("<a id='search' href='AdminCategoryServlet?curPage="+p
		    				+"&searchName="+searchName+"&searchValue="+searchValue
		    				+"&sortBy="+sortBy+"&category=product'>"+p+"</a>&nbsp;&nbsp;");
				}
			} 
		%>
		</div>
		</div>
		</div>
	</form> 
</div>
</div>
<!-- 모달 -->
<div class="modal fade" id="checkVal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">ZZP</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <p id="mesg"></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="delReportBtn btn btn-success">확인</button>
		<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>
<button type="button" id="modalBtn" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#checkVal">modal</button>