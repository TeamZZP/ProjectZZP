<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<!-- Required meta tags -->
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style>
	th {
		text-align: center;
	}
	a {
		color : black;
		text-decoration: none;
	}
	.modal {
		overflow: auto;
	}
</style>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<div class="container" id="divCon">
	<div class="row">
		<div class="col-lg-2">
			<div class="col">
				<a href="MypageServlet">마이페이지 홈</a>
			</div>
			<div class="col">주문 내역</div>
			<div class="col">반품/취소/교환 목록</div>
			<div class="col">챌린지</div>
			<div class="col">
				<a href="MyQuestionServlet">문의 내역</a>
			</div>
			<div class="col">
				<a href="AddressListServlet" style="color: green; font-weight: bold;">배송지 관리</a>
			</div>
			<div class="col">
				<a href="checkPasswd.jsp">계정 관리</a>
			</div>
		</div>
	</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
