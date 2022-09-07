<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<br>
	<div class="row">
		<div class="btn-group" role="group" aria-label="Basic example">
			<button type="button" class="btn btn-outline-success category" data-category="coupon" id="couponManagement">쿠폰관리</button>
			<button type="button" class="btn btn-outline-success category"></button>
			<button type="button" class="btn btn-outline-success category"></button>
			<button type="button" class="btn btn-outline-success category"></button>
		</div>
	</div>
</div>