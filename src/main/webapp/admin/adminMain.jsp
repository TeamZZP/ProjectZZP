<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sales = (String) request.getAttribute("sales");
	String salesIncrease = (String) request.getAttribute("salesIncrease");
	String member = (String) request.getAttribute("member");
	String memberIncrease = (String) request.getAttribute("memberIncrease");
	int todayVisit = (Integer) request.getAttribute("todayVisit");
	String visitIncrease = (String) request.getAttribute("visitIncrease");
%>

<style>
	
	.percent[data-n^='+'] {
		color: green;
	}
	.percent[data-n^='-'] {
		color: red;
	}
</style>

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
  
</div>
</div>