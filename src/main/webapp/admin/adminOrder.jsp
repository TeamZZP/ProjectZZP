<%@page import="com.dto.ProductOrderDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.dto.PageDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	PageDTO pDTO = (PageDTO) request.getAttribute("pDTO");
	List<ProductOrderDTO> list = pDTO.getList();
	String searchName = (String) request.getAttribute("searchName");
	String searchValue = (String) request.getAttribute("searchValue");
	String sortBy = (String) request.getAttribute("sortBy");
	String status = (String) request.getAttribute("status");
%>


<style>
	.form-select {
		width: 140px; 
		display: inline;
	}
	.searchValue {
		width: 150px; 
		display: inline;
	}
	a {
		text-decoration: none;
		color: black;
	}
	.oneOrder {
		cursor: pointer;
	}
	.statusChange {
		width: 120px;
	}

	#modalBtn{
		display: none;
	}
	.modal-body{
		text-align: center;
	}	
	#mesg{
		margin: 0;
	}
</style>


<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function () {
	
	//정렬 기준 선택시 form 제출
	$("#status").on("change", function () {
		$("#sortForm").submit();
	});
	//주문 상태 변경
	$('.statusChange').on('change', function () {
		let id = $(this).attr('data-id')
		$('#statusChangeId').val(id)
		$('#statusChange').val($('#status'+id).val())
		$('#orderForm').attr('action', 'AdminOrderServlet').submit()
	})
	
	
	
	
	//해당 신고글로 이동
	$('.oneReport').on('click', function () {
		let id = $(this).attr('data-id')
		if ($("#content"+id).text()=='(삭제된 글입니다)') {
			//alert('이미 삭제된 글입니다.')
			$("#modalBtn").trigger("click");
			$("#mesg").text("이미 삭제된 글입니다.");
		} else {
			location.href = 'ReportUIServlet?report_id='+id
		}
	})
	//신고 삭제 모달
 	$("#deleteModal").on("shown.bs.modal", function (e) {
 		let button = e.relatedTarget
 		if (button) {
 			let id = button.getAttribute("data-bs-id")
 			$("#delreport_id").val(id);
		}
	});
	//신고 삭제
	$(".delReportBtn").on("click", function (e) {
		$('#reportForm').attr('action', 'ReportDeleteServlet').submit()
	});
	//전체 선택 체크박스
	$('#checkAll').on('click', function () {
		$('.delCheck').prop('checked', $(this).prop('checked'))
	})
	//체크박스 선택 검사
	$('.delCheckBtn').on('click', function () {
		//data-bs-toggle="modal" 
		if ($('.delCheck:checked').length == 0) {
			//alert('삭제할 신고를 선택해 주세요.')
			$("#modalBtn").trigger("click");
			$("#mesg").text("삭제할 신고를 선택해 주세요.");
		} else {
			//$('#deleteModal').modal('toggle')
			$("#modalBtn").trigger("click");
			$("#mesg").html("선택한 신고 기록을 삭제하시겠습니까? <br>(게시글은 삭제되지 않습니다.)");
		}
	})
	
	
});
</script>


<div class="container mt-2 mb-2">
	<form id="sortForm" action="AdminCategoryServlet">
	<input type="hidden" name="category" value="order">
		<div class="row">
		  <div class="col">
			  <select name="searchName" class="form-select" data-style="btn-info" id="inputGroupSelect01">
				   <option selected disabled hidden>검색 기준</option>
				   <option value="o.userid" <% if("o.userid".equals(searchName)) {%>selected<%} %>>주문자</option>
				   <option value="p_name" <% if("p_name".equals(searchName)) {%>selected<%} %>>상품명</option>
				   <option value="order_date" <% if("order_date".equals(searchName)) {%>selected<%} %>>주문일</option>
			  </select>
		  	  <input type="text" class="form-control searchValue" name="searchValue" <% if(searchValue!=null && !searchValue.equals("null")) {%>value="<%=searchValue%>"<%} %>>
	      	  <input type="submit" class="btn btn-success" style="margin-top: -5px;" value="검색"></input>
	      </div>
	      <div class="col">
	      	<div class="float-end">
				<select name="status" id="status" class="form-select">
					  <option selected disabled hidden>상태</option>
					  <option value="주문완료" <% if("주문완료".equals(status)) {%> selected <%} %>>주문완료</option>
					  <option value="결제완료" <% if("결제완료".equals(status)) {%> selected <%} %>>결제완료</option>
					  <option value="배송준비중" <% if("배송준비중".equals(status)) {%> selected <%} %>>배송준비중</option>
					  <option value="배송중" <% if("배송중".equals(status)) {%> selected <%} %>>배송중</option>
					  <option value="배송완료" <% if("배송완료".equals(status)) {%> selected <%} %>>배송완료</option>
					  <option value="구매확정" <% if("구매확정".equals(status)) {%> selected <%} %>>구매확정</option>
					  <option value="교환/반품" <% if("교환/반품".equals(status)) {%> selected <%} %>>교환/반품</option>
					  <option value="주문취소" <% if("주문취소".equals(status)) {%> selected <%} %>>주문취소</option>
				</select> 
			</div>
	      </div>
		</div>
	 </form>
</div>



<div class="container col-md-auto">
<div class="row justify-content-md-center">

<form id="orderForm">
<input type="hidden" name="curPage" value="<%= pDTO.getCurPage() %>">
<input type="hidden" name="searchName" value="<%= searchName %>">
<input type="hidden" name="searchValue" value="<%= searchValue %>">
<input type="hidden" name="sortBy" value="<%= sortBy %>">
<input type="hidden" name="status" value="<%= status %>">
<input type="hidden" name="category" value="order">
<input type="hidden" name="report_id" id="delreport_id">
<input type="hidden" name="statusChangeId" id="statusChangeId">
<input type="hidden" name="statusChange" id="statusChange">

<table class="table table-hover table-sm">
	<tr>
		<th>주문 번호</th>
		<th>주문자</th>
		<th>상품명</th>
		<th>가격</th>
		<th>주문일</th>
		<th>상태</th>
		<th>관리</th>
	</tr>
<%
	for (ProductOrderDTO dto : list) {
		int order_id = dto.getOrder_id(); 
		String userid = dto.getUserid(); 
		int p_id = dto.getP_id(); 
		int total_price = dto.getTotal_price(); 
		/* String delivery_address; 
		String delivery_loc; 
		String delivery_req; */ 
		String order_date = dto.getOrder_date();
		String order_state = dto.getOrder_state(); 
		/* int p_amount;  */
		String p_name = dto.getP_name(); 
		/* int p_cost_price; */ 
		int p_selling_price = dto.getP_selling_price(); 
		int p_discount = dto.getP_discount();
%>

	<tr>
		<td class="oneOrder" data-id="<%= order_id %>"><%= order_id %></td>
		<td class="oneOrder" data-id="<%= order_id %>"><%= userid %></td>
		<td class="oneOrder" data-id="<%= order_id %>"><%= p_name %></td>
		<td class="oneOrder" data-id="<%= order_id %>"><%= total_price %></td>
		<td class="oneOrder" data-id="<%= order_id %>"><%= order_date %></td>
		<td>
			<select id="status<%= order_id %><%= p_id %>" class="statusChange form-select form-select-sm" data-id="<%= order_id %><%= p_id %>">
			  <option value="주문완료" <% if("주문완료".equals(order_state)) {%> selected <%} %>>주문완료</option>
			  <option value="결제완료" <% if("결제완료".equals(order_state)) {%> selected <%} %>>결제완료</option>
			  <option value="배송준비중" <% if("배송준비중".equals(order_state)) {%> selected <%} %>>배송준비중</option>
			  <option value="배송중" <% if("배송중".equals(order_state)) {%> selected <%} %>>배송중</option>
			  <option value="배송완료" <% if("배송완료".equals(order_state)) {%> selected <%} %>>배송완료</option>
			  <option value="구매확정" <% if("구매확정".equals(order_state)) {%> selected <%} %>>구매확정</option>
			  <option value="교환/반품" <% if("교환/반품".equals(order_state)) {%> selected <%} %>>교환/반품</option>
			  <option value="주문취소" <% if("주문취소".equals(order_state)) {%> selected <%} %>>주문취소</option>
			</select>
		</td>
		<td>
			<button type="button" class="btn btn-outline-dark btn-sm" 
					data-bs-toggle="modal" data-bs-target="#deleteModal" data-bs-id="<%= order_id %>">삭제</button>
		</td>
	</tr>
<%
	}
%>
	
</table>
</form>

</div>
</div>

	<!-- 페이징 -->
	<div class="container">
	  <div class="p-2 text-center orderPage">
	  <% 
		    int curPage = pDTO.getCurPage(); 
		    int perPage = pDTO.getPerPage(); 
		    int totalCount = pDTO.getTotalCount();
		    //int totalPage = totalCount/perPage;
		    //if (totalCount%perPage!=0) totalPage++;
		    
		    //해당 화면에 보이는 끝번호
		    int endPage = (int)(Math.ceil(curPage/10.0))*10;
		    int startPage = endPage-9;
		    //진짜 끝번호 구하기
		    int realEnd = (int)(Math.ceil((totalCount*1.0)/perPage));
		    if (realEnd<endPage) endPage = realEnd;
		    //이전 계산
		    boolean prev = startPage > 1;
		    boolean next = endPage < realEnd;
		    
		    if (prev) {
		    	out.print("<a href='AdminCategoryServlet?curPage="+(int)((Math.floor((curPage-1)/10.0))*10)
	    				+"&searchName="+searchName+"&searchValue="+searchValue
	    				+"&sortBy="+sortBy+"&status="+status+"&category=order'>prev</a>&nbsp;&nbsp;");
		    }
		    for (int p=startPage; p<=endPage; p++) {
		    	if (p==curPage) {
		    		out.print("<b>"+p+"</b>&nbsp;&nbsp;");
		    	} else {
		    		out.print("<a href='AdminCategoryServlet?curPage="+p
		    				+"&searchName="+searchName+"&searchValue="+searchValue
		    				+"&sortBy="+sortBy+"&status="+status+"&category=order'>"+p+"</a>&nbsp;&nbsp;");
		    	}
		    }
		    if (next) {
		    	out.print("<a href='AdminCategoryServlet?curPage="+(int)((Math.ceil(curPage/10.0))*10+1)
	    				+"&searchName="+searchName+"&searchValue="+searchValue
	    				+"&sortBy="+sortBy+"&status="+status+"&category=order'>next</a>&nbsp;&nbsp;");
		    }
	  %>
	  </div>
	 </div>
	 
	 
