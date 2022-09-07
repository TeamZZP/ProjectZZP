<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sales = (String) request.getAttribute("sales");
	String salesIncrease = (String) request.getAttribute("salesIncrease");
%>

<style>
	.percent[data-n^='+'] {
		color: green;
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
	    <h2 class="card-text"><%= sales %></h2>
	  </div>
	</div>
  </div>
  
</div>
</div>