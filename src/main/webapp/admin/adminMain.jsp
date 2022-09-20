<%@page import="com.dto.QuestionDTO"%>
<%@page import="com.dto.MemberDTO"%>
<%@page import="com.dto.ProductOrderDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sales = (String) request.getAttribute("sales");
	String salesIncrease = (String) request.getAttribute("salesIncrease");
	String member = (String) request.getAttribute("member");
	String memberIncrease = (String) request.getAttribute("memberIncrease");
	int todayVisit = (Integer) request.getAttribute("todayVisit");
	String visitIncrease = (String) request.getAttribute("visitIncrease");
	
	List<ProductOrderDTO> orderList = (List<ProductOrderDTO>) request.getAttribute("orderList");
	int orderListOriginSize = orderList.size();
	int orderListSize = orderListOriginSize;
	if (orderListOriginSize > 5) orderListSize = 5;
	
	List<MemberDTO> memberList = (List<MemberDTO>) request.getAttribute("memberList");
	int memberListOriginSize = memberList.size();
	int memberListSize = memberListOriginSize;
	if (memberListOriginSize > 5) memberListSize = 5;
	
	List<QuestionDTO> questionList = (List<QuestionDTO>) request.getAttribute("questionList");
	int qListOriginSize = questionList.size();
	int qListSize = qListOriginSize;
	if (qListOriginSize > 5) qListSize = 5;
%>

<style>
	a {
		text-decoration: none;
		color: black;
	}
	.percent[data-n^='+'] {
		color: green;
	}
	.percent[data-n^='-'] {
		color: red;
	}
	.oneOrder:hover, .oneMember:hover, .oneQuestion:hover {
		cursor: pointer;
	}
</style>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function () {
	//주문 상세보기
	$(".oneOrder").on("click", function () {
		location.href = "";
	});
	//회원 상세보기
	$(".oneMember").on("click", function () {
		location.href = "AccountManagementServlet?memberId="+$(this).attr("data-id");
	});
	//문의 상세보기
	$(".oneQuestion").on("click", function () {
		location.href = "QuestionOneSelect?USERID=admin1&Q_ID="+$(this).attr("data-id")+"&before=myQuestion";
	});
	
});
</script>



<div class="container mt-5">

<div class="row">

  <div class="col-md-4">
	<div class="card">
	  <div class="card-body text-center">
	    <h5 class="card-title">총 판매액</h5>
	    <h2 class="card-text"><%= sales %></h2>
	    <h6 class="card-text percent" data-n="<%= salesIncrease %>"><%= salesIncrease %></h6>
	  </div>
	</div>
  </div>
  
  <div class="col-md-4">
	<div class="card">
	  <div class="card-body text-center">
	    <h5 class="card-title">회원수</h5>
	    <h2 class="card-text"><%= member %></h2>
	    <h6 class="card-text percent" data-n="<%= memberIncrease %>"><%= memberIncrease %></h6>
	  </div>
	</div>
  </div>
  
  <div class="col-md-4">
	<div class="card">
	  <div class="card-body text-center">
	    <h5 class="card-title">오늘 방문자수</h5>
	    <h2 class="card-text"><%= todayVisit %></h2>
	    <h6 class="card-text percent" data-n="<%= visitIncrease %>"><%= visitIncrease %></h6>
	  </div>
	</div>
  </div>
  
  <div class="col-md-4 mt-5">
    <div class="card">
	  <div class="card-body text-center">
	    <h5 class="card-title">신규 주문 <%= orderListOriginSize %>건</h5>
	    <table class="card-text w-100">
	    	<tr>
	    		<th>번호</th>
	    		<th>주문자</th>
	    		<th>상품명</th>
	    		<th>가격</th>
	    	</tr>
	    <% for (int i = 0; i < orderListSize; i++) {
	    	ProductOrderDTO dto = orderList.get(i);
	    	int order_id = dto.getOrder_id(); 
			String userid = dto.getUserid(); 
			int total_price = dto.getTotal_price(); 
			String order_date = dto.getOrder_date();
			String order_state = dto.getOrder_state(); 
			String p_name = dto.getP_name(); 
			int p_selling_price = dto.getP_selling_price(); 
			int p_discount = dto.getP_discount();
			
			if (p_name.length() > 8) p_name = p_name.substring(0, 8) + "...";
	    %>
	    	<tr>
	    		<td><%= order_id %></td>
	    		<td><%= userid %></td>
	    		<td><%= p_name %></td>
	    		<td><%= total_price %></td>
	    	</tr>
	    <%} %>
	    </table>
	    <% if (orderListSize == 0) {%> <br>신규 주문이 없습니다.<br> <%} %>
	    <div class="card-text">
	      <div class="float-end">
		    <small>
		    	<a href="AdminCategoryServlet?category=order">more</a>
		    </small>
		  </div>
	    </div>
	  </div>
	</div>
  </div>
  
  
  <div class="col-md-4 mt-5">
    <div class="card">
	  <div class="card-body text-center">
	    <h5 class="card-title">신규 회원 <%= memberListOriginSize %>명</h5>
	    <table class="card-text w-100">
	    	<tr>
	    		<th>아이디</th>
	    		<th>이름</th>
	    		<th>이메일</th>
	    	</tr>
	    <% for (int i = 0; i < memberListSize; i++) {
	    	MemberDTO dto = memberList.get(i);
	    	String userid = dto.getUserid();
			String username = dto.getUsername();
			String email = dto.getEmail1() +"@"+ dto.getEmail2(); 
	    %>
	    	<tr class="oneMember" data-id="<%= userid %>">
	    		<td><%= userid %></td>
	    		<td><%= username %></td>
	    		<td><%= email %></td>
	    	</tr>
	    <%} %>
	    </table>
	    <% if (memberListSize == 0) {%> <br>신규 회원이 없습니다.<br> <%} %>
	    <div class="card-text">
	      <div class="float-end">
		    <small>
		    	<a href="AdminCategoryServlet?category=member">more</a>
		    </small>
		  </div>
	    </div>
	  </div>
	</div>
  </div>
  
  
  <div class="col-md-4 mt-5">
    <div class="card">
	  <div class="card-body text-center">
	    <h5 class="card-title">답변대기 문의 <%= qListOriginSize %>건</h5>
	    <table class="card-text w-100">
	    	<tr>
	    		<th>번호</th>
	    		<th>작성자</th>
	    		<th>제목</th>
	    	</tr>
	    <% for (int i = 0; i < qListSize; i++) {
	    	QuestionDTO dto = questionList.get(i);
	    	int q_id = dto.getQ_id(); 
	        String q_title = dto.getQ_title();
	        String userid = dto.getUserid();
	        
	        if (q_title.length() > 10) q_title = q_title.substring(0, 10) + "...";
	    %>
	    	<tr class="oneQuestion" data-id="<%= q_id %>">
	    		<td><%= q_id %></td>
	    		<td><%= userid %></td>
	    		<td><%= q_title %></td>
	    	</tr>
	    <%} %>
	    </table>
	    <% if (qListSize == 0) {%> <br>답변대기 문의가 없습니다.<br> <%} %>
	    <div class="card-text">
	      <div class="float-end">
		    <small>
		    	<a href="QuestionListServlet">more</a>
		    </small>
		  </div>
	    </div>
	  </div>
	</div>
  </div>
  
  
  
  
</div>
</div>