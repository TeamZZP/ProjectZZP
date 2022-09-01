<%@page import="com.dto.ProductOrderDTO"%>
<%@page import="com.dto.OrderDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.dto.MemberDTO"%>
<%@page import="com.dto.PageDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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

    <%
	  //session에 저장된 userid 읽어오기 
	  	MemberDTO member = (MemberDTO) session.getAttribute("login"); 
	  	String userid = null;
	  	if (member != null) {
	  		userid = member.getUserid();
	  	}
    %>
    
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
	   		<a href="ProfileCategoryServlet?category=mychallenge&userid=<%=userid%>">내 챌린지</a>
	   </div>
	   <div class="col">
	   		<a href="ProfileCategoryServlet?category=mystamp&userid=<%=userid%>">내 도장</a>
	   </div>
	   <div class="col">
	      <a href="MyQuestionServlet" class="currCategory">내 문의 내역</a>
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
<table id="addTable" class="table table-hover" style="text-align: center;">
	<tr class="table-success">
		<th>주문번호</th>
		<th>상품명</th>
		<th>가격</th>
		<th>주문날짜</th>
		<th colspan="2">주소</th>
		<th>배송상태</th>
		<th>리뷰쓰기</th>
	</tr>
	<%
		PageDTO pDTO = (PageDTO)session.getAttribute("myOrderList");
		List<ProductOrderDTO> myList = pDTO.getList();
		for(ProductOrderDTO qDTO : myList){
			String date = qDTO.getORDER_DATE();
			String day = date.substring(0,10);
			System.out.print("날짜 " + day);
	%>
	<tr>
		<td> <%= qDTO.getORDER_ID() %> </td>
	    <td> <%= qDTO.getP_NAME() %> </td>
	    <td> <%= qDTO.getTOTAL_PRICE() %> </td>
		<td> <%= day %> </td>
		<td> <%= qDTO.getDELIVERY_ADDRESS() %> </td>
		<td> <%= qDTO.getDELIVERY_LOC() %> </td>
		<td> <%= qDTO.getORDER_STATE() %> </td>
		<td> <button onclick="location.href='reviewInsert.jsp'" class="btn btn-outline-success">리뷰작성</button> </td>
	</tr>
	<%	} %>
	<tr>
		<td colspan="8" style="text-align: center;">
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