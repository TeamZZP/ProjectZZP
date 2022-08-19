<%@page import="com.dto.PageDTO"%>
<%@page import="com.dto.QuestionProductDTO"%>
<%@page import="com.dto.QuestionDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div id="addContainer">
<div class="container">
<div class="row">
<div class="col-lg-2">
	<div class="col">회원 관리</div>
	<div class="col">주문 관리</div>
	<div class="col">상품 관리</div>
	<div class="col"> <a href="MyQuestionServlet" style="color: green; text-decoration: none;"> 상품 문의 </a> </div>
	<div class="col">문의 게시판</div>
</div>
<div class="col-lg-10">
<div id="addTableDiv">
<table id="addTable" class="table table-hover" style="text-align: center;">
	<tr class="table-success">
		<th>번호</th>
		<th>상품명</th>
		<th>카테고리</th>
		<th>제목</th>
		<th>작성일</th>
		<th>답변상태</th>
	</tr>
	<%
		PageDTO pDTO  = (PageDTO)session.getAttribute("myList");
		List<QuestionProductDTO> myList = pDTO.getList();
		for(QuestionProductDTO qDTO : myList){
	%>
	<tr>
		<td> <%= qDTO.getQ_ID() %> </td>
		<%if(qDTO.getP_NAME() == null){ %>
	    	<td> - </td>
	    <% } else { %> 
	    	<td> <%= qDTO.getP_NAME() %> </td>
    	<%} %> 
		<td> <%= qDTO.getQ_CATEGORY() %> </td>
		<td>
			<a style="text-decoration: none; color: black;" 
    			href="QuestionOneSelect?Q_ID=<%= qDTO.getQ_ID() %>&USERID=<%=qDTO.getUSERID()%>">
		  	<%= qDTO.getQ_TITLE() %> 
		 	</a>
		</td>
		<td> <%= qDTO.getQ_CREATED() %> </td>
		<td> <%= qDTO.getQ_STATUS() %> </td>
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
		          		out.print("<a style='color: green;' href = 'MyQuestionServlet?curPage="+i+"'>" + i + " </a>");  
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