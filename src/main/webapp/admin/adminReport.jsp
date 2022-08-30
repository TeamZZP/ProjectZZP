<%@page import="com.dto.ReportDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.dto.PageDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	PageDTO pDTO = (PageDTO) request.getAttribute("pDTO");
	List<ReportDTO> list = pDTO.getList();
	String searchName = (String) request.getAttribute("searchName");
	String searchValue = (String) request.getAttribute("searchValue");
	String sortBy = (String) request.getAttribute("sortBy");
	String status = (String) request.getAttribute("status");
%>

<style>
	.searchName, .searchValue, .form-select {
		width: 140px; 
		display: inline;
	}
	a {
		text-decoration: none;
		color: black;
	}
	.oneReport {
		cursor: pointer;
	}
</style>

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function () {
	
	//정렬 기준 선택시 form 제출
	$("#status").on("change", function () {
		$("#sortForm").submit();
	});
	//해당 신고글로 이동
	$('.oneReport').on('click', function () {
		let id = $(this).attr('data-id')
		if ($("#content"+id).text()=='(삭제된 글입니다)') {
			alert('이미 삭제된 글입니다.')
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
		$('#delForm').attr('action', 'ReportDeleteServlet').submit()
	});
	//전체 선택 체크박스
	$('#checkAll').on('click', function () {
		$('.delCheck').prop('checked', $(this).prop('checked'))
	})
	//체크박스 선택 검사
	$('.delCheckBtn').on('click', function () {
		//data-bs-toggle="modal" 
		if ($('.delCheck:checked').length == 0) {
			alert('삭제할 신고를 선택해 주세요.')
		} else {
			$('#deleteModal').modal('toggle')
		}
		
	})
	
});
</script>



<div class="container mt-2 mb-2">
	<form id="sortForm" action="AdminCategoryServlet">
	<input type="hidden" name="category" value="report">
		<div class="row">
		  <div class="col">
			  <select name="searchName" class="form-select searchName" data-style="btn-info" id="inputGroupSelect01">
				   <option selected disabled hidden>검색 기준</option>
				   <option value="r.userid" <% if("r.userid".equals(searchName)) {%>selected<%} %>>신고자</option>
				   <option value="reported_userid" <% if("reported_userid".equals(searchName)) {%>selected<%} %>>작성자</option>
				   <option value="report_created" <% if("report_created".equals(searchName)) {%>selected<%} %>>신고일</option>
			  </select>
		  	  <input type="text" class="form-control searchValue" name="searchValue" <% if(searchValue!=null && !searchValue.equals("null")) {%>value="<%=searchValue%>"<%} %>>
	      	  <input type="submit" class="btn btn-success" style="margin-top: -5px;" value="검색"></input>
	      </div>
	      <div class="col">
	      	<div class="float-end">
				<select name="status" id="status" class="form-select">
					<option selected disabled hidden>상태</option>
					<option value="0" <%if ("0".equals(status)) {%>selected <%}%>>처리 대기</option>
					<option value="1" <%if ("1".equals(status)) {%>selected <%}%>>처리 완료</option>
				</select> 
			</div>
	      </div>
		</div>
	 </form>
</div>



<div class="container col-md-auto">
<div class="row justify-content-md-center">

<form id="delForm">
<input type="hidden" name="curPage" value="<%= pDTO.getCurPage() %>">
<input type="hidden" name="searchName" value="<%= searchName %>">
<input type="hidden" name="searchValue" value="<%= searchValue %>">
<input type="hidden" name="sortBy" value="<%= sortBy %>">
<input type="hidden" name="status" value="<%= status %>">
<input type="hidden" name="category" value="report">
<input type="hidden" name="report_id" id="delreport_id">

<table class="table table-hover table-sm">
	<tr>
		<th><input type="checkbox" id="checkAll"></th>
		<th>신고 번호</th>
		<th>신고자</th>
		<th>구분</th>
		<!-- <th>글번호</th> -->
		<th>작성자</th>
		<th>제목 및 내용</th>
		<th>신고사유</th>
		<th>신고일</th>
		<th>상태</th>
		<th>관리</th>
	</tr>
<%
	for (ReportDTO dto : list) {
		int report_id = dto.getReport_id();
		String userid = dto.getUserid();
		String report_category = dto.getReport_category();
		int chall_id = dto.getChall_id();
		int comment_id = dto.getComment_id();
		String report_reason = dto.getReport_reason();
		String report_status = dto.getReport_status();
		String report_created = dto.getReport_created();
		String reported_userid = dto.getReported_userid();
		String content = dto.getContent();
%>

	<tr id="list">
		<td><input type="checkbox" class="delCheck" name="report_id" value="<%= report_id %>"></td>
		<td class="oneReport" data-id="<%= report_id %>"><%= report_id %></td>
		<td class="oneReport" data-id="<%= report_id %>"><%= userid %></td>
		<td class="oneReport" data-id="<%= report_id %>"><%= report_category %></td>
		<%-- <td><% if(chall_id!=0) {%><%=chall_id%><%} else{%><%=comment_id%><%} %></td> --%>
		<td class="oneReport" data-id="<%= report_id %>"><%= reported_userid %></td>
		<td class="oneReport" data-id="<%= report_id %>" id="content<%= report_id %>"><%= content %></td>
		<td class="oneReport" data-id="<%= report_id %>"><%= report_reason %></td>
		<td class="oneReport" data-id="<%= report_id %>"><%= report_created %></td>
		<td class="oneReport" data-id="<%= report_id %>"><%= report_status %></td>
		<td>
			<button type="button" class="btn btn-outline-dark btn-sm" 
					data-bs-toggle="modal" data-bs-target="#deleteModal" data-bs-id="<%= report_id %>">삭제</button>
		</td>
	</tr>
<%
	}
%>
	
</table>
</form>

	<div>
	  <div class="float-end me-3" style="margin-top: -8px;">
		<button type="button" class="delCheckBtn btn btn-outline-dark btn-sm" style="width: 80px;"
						data-bs-target="#deleteModal" data-bs-id="">선택삭제</button>
	  </div>
	</div>
</div>
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
		    		out.print("<a href='AdminCategoryServlet?curPage="+p
		    				+"&searchName="+searchName+"&searchValue="+searchValue
		    				+"&sortBy="+sortBy+"&status="+status+"&category=report'>"+p+"</a>&nbsp;&nbsp;");
		    	} 
		    }
	  %>
	  </div>
	  
	  
	  
	  <!-- Modal -->
			<div id="deleteModal" class="modal fade" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="staticBackdropLabel">신고 삭제</h5>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			        선택한 신고 기록을 삭제하시겠습니까? <br>(게시글은 삭제되지 않습니다.)
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="delReportBtn btn btn-success">삭제</button>
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
			      </div>
			    </div> 
			  </div>
			</div>