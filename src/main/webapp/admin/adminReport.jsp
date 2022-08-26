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
%>

<style>
	.searchName, .searchValue {
		width: 140px; 
		display: inline;
	}
	a {
		text-decoration: none;
		color: black;
	}
</style>

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function () {
	
	$(".category").click(function() {
		let category = $(this).attr("data-category");
		location.href="AdminCategoryServlet?category="+category;
	});
	
	
});


</script>


<div class="container">
	<div class="row">
		<div class="btn-group" role="group" aria-label="Basic example">
			<button type="button" class="btn btn-outline-success category" data-category="member" id="memberManagement">회원관리</button>
			<button type="button" class="btn btn-outline-success category" data-category="report" id="reportManagement">신고관리</button>
			<button type="button" class="btn btn-outline-success category" data-category="product" id="productManagement">상품관리</button>
			<button type="button" class="btn btn-outline-success category" data-category="challenge" id="challengeManagement">챌린지관리</button>
		</div>
	</div>
</div>





<div class="container mt-2 mb-2">
	<div class="row">
		  <div class="col">
		  	<form action="AdminCategoryServlet">
		  		<input type="hidden" name="category" value="report">
				  <select class="form-select searchName" data-style="btn-info" id="inputGroupSelect01">
					    <option selected disabled hidden>카테고리</option>
					    <option value="chall_id">게시글 번호</option>
					    <option value="chall_title">제목</option>
					    <option value="chall_content">내용</option>
					    <option value="stamp_name">도장 이름</option>
					    <option value="chall_created">등록일</option>
				  </select>
		  		<input type="text" class="form-control searchValue">
	      		<button type="button" class="btn btn-success" style="margin-top: -5px;">검색</button>
	      	</form>
	      </div>
	      <div class="col">
	      	<div class="float-end">
	      	<button class="writeBtn btn btn-success">이 달의 챌린지 등록하기</button>
	      	</div>
	      </div>
	</div>
</div>



<div class="container col-md-auto">
<div class="row justify-content-md-center">
<table class="table table-hover table-sm">
	<tr>
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
		<td class="challengeDetail" data-id="<%= report_id %>"><%= report_id %></td>
		<td class="challengeDetail" data-id="<%= report_id %>"><%= userid %></td>
		<td class="challengeDetail" data-id="<%= report_id %>"><%= report_category %></td>
		<%-- <td><% if(chall_id!=0) {%><%=chall_id%><%} else{%><%=comment_id%><%} %></td> --%>
		<td><%= reported_userid %></td>
		<td><%= content %></td>
		<td><%= report_reason %></td>
		<td><%= report_created %></td>
		<td><%= report_status %></td>
		<td>
			<button type="button" class="updateChallBtn btn btn-outline-success btn-sm" data-cid="<%= chall_id %>" >수정</button>
			<button type="button" class="btn btn-outline-dark btn-sm" 
					data-bs-toggle="modal" data-bs-target="#deleteModal" data-bs-cid="<%= chall_id %>">삭제</button>
		</td>
<%
	}
%>

	</tr>
</table>
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
		    		out.print("<a href='AdminReportListServlet?curPage="+p
		    				+"&searchName="+searchName+"&searchValue="+searchValue
		    				+"&sortBy="+sortBy+"&category=report'>"+p+"</a>&nbsp;&nbsp;");
		    	} 
		    }
	  %>
	  </div>