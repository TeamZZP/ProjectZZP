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
		$("#searchCoupon").click(function() {
			$("#couponForm").submit();
		});
		$("#sortBy").change(function() {
			$("#couponForm").submit();
		});
		$("#checkAll").click(function() {
			$(".delCheck").prop('checked', $(this).prop('checked'));
		});
		$(".delCheckBtn").click(function() {
			if ($(".delCheck:checked").length == 0) {
				$("#modalBtn").trigger("click");
				$("#mesg").text("삭제할 쿠폰을 선택해 주세요.");
				$("#okBtn").html("<button type='button' class='btn btn-secondary' data-bs-dismiss='modal'>취소</button>");
			} else {
				$("#modalBtn").trigger("click");
				$("#mesg").html("선택한 쿠폰을 삭제하시겠습니까?");
				$("#okBtn").html("<button type='button' id='allDelBtn' class='btn btn-success'>확인</button>"
						+"<button type='button' class='btn btn-secondary' data-bs-dismiss='modal'>취소</button>");
				$("#allDelBtn").click(function () {
					var allDel = $(".delCheck:checked");
					var delId = "";
					$.each(allDel, function (i, e) {
						delId += e.value + ",";
					});
					location.href = "AdminCouponAllDeleteServlet?coupon_id="+delId;
				});
			}
		});
		$(".delCoupon").click(function () {
			var couponId = $(this).attr("data-couponId");
			location.href = "AdminCouponDeleteServlet?coupon_id="+couponId;
		});
		$(".couponUpdate").click(function () {
			var couponId = $(this).attr("data-couponId");
			location.href = "AdminCouponOneSelect?coupon_id="+couponId;
		});
	});//end ready
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
%>

<div class="container col-md-auto">
<div class="row justify-content-md-center">
	<form action="AdminCategoryServlet" id="couponForm">
		<input type="hidden" name="category" value="coupon">
		<div class="container mt-2 mb-2">
			<div class="row">
			  	<div class="col">
					<select class="form-select sortBy" name="searchName" data-style="btn-info" id="inputGroupSelect01">
						<option selected disabled hidden>검색 기준</option>
						<option value="coupon_name" <% if("coupon_name".equals(searchName)){%> selected <%}%>>쿠폰이름</option>
						<option value="coupon_discount" <% if("coupon_discount".equals(searchName)){%> selected <%}%>>할인율</option>
					</select> 
					<input type="text" name="searchValue" class="form-control searchValue" 
		  				<% if(searchValue!=null && !searchValue.equals("null")) {%>value="<%= searchValue %>"<% } %>>
		  			<button type="button" class="btn btn-success" id="searchCoupon" style="margin-top: -5px;">검색</button>
		  	  	</div>
	      	  	<div class="col">
	      	  		<div class="float-end">
					  <select class="form-select sortBy" name="sortBy" id="sortBy" data-style="btn-info">
						    <option selected disabled hidden>정렬</option>
						    <option value="coupon_discount_up" <% if("coupon_discount_up".equals(sortBy)){%>selected<%}%>>할인율 높은순</option>
						    <option value="coupon_discount_down" <% if("coupon_discount_down".equals(sortBy)){%>selected<%}%>>할인율 낮은순</option>
						    <option value="coupon_validity" <% if("coupon_validity".equals(sortBy)){%>selected<%}%>>유효기간순</option>
						    <option value="coupon_created" <% if("coupon_created".equals(sortBy)){%>selected<%}%>>등록일순</option>
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
					<button type="button" data-couponId="<%=cDTO.getCoupon_id() %>" class="couponUpdate btn btn-outline-dark btn-sm">
						수정
					</button>
					<button type="button" data-couponId="<%=cDTO.getCoupon_id() %>" class="btn btn-outline-dark btn-sm" data-bs-toggle="modal" data-bs-target="#delCoupon">
						삭제
					</button>
					<div class="modal fade modal-first" id="delCoupon" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
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
					        <button type="button" data-couponId="<%=cDTO.getCoupon_id() %>" class="delCoupon btn btn-success">삭제</button>
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
			<button type="button" class="delCheckBtn btn btn-outline-dark btn-sm" style="width: 80px;" data-bs-target="#deleteModal">
				선택삭제
			</button>
		  </div>
		  
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
			      <div class="modal-footer" id="okBtn">
			      </div>
			    </div>
			  </div>
			</div>
			<button type="button" id="modalBtn" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#checkVal">modal</button>
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