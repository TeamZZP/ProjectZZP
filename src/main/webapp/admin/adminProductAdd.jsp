<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.dto.ProductDTO"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
	.prodContainer{
		margin-top: 10px;
	}
	.card{
		border: none;
	}
	.card-header{
		text-align: left; 
		font-weight: bold; 
		font-size: large;
		background-color: white;
	}
</style>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		//관리자페이지 카테고리
		$(".category").click(function() {
			let category = $(this).attr("data-category");
			location.href="AdminCategoryServlet?category="+category;
		});
		//취소버튼 클릭 시 목록으로
		$("#backList").click(function() {
			$("form").attr("action","AdminCategoryServlet?category=product");
		});
		//정상가 수정 시 판매가 자동계산
		$("#p_cost_price").keyup(function() {
			let p_cost_price = $(this).val();
			let p_discount = $("#p_discount").val();
			if (p_cost_price - p_discount>=0) {
				$("#p_selling_price").val(p_cost_price - p_discount);
			} else {
				$("#p_selling_price").val("금액을 확인하세요");
			}
		});
		//할인가 수정 시 판매가 자동계산
		$("#p_discount").keyup(function() {
			let p_cost_price = $("#p_cost_price").val();
			let p_discount = $(this).val();
			if (p_cost_price - p_discount>=0) {
				$("#p_selling_price").val(p_cost_price - p_discount);
			} else {
				$("#p_selling_price").val("금액을 확인하세요");
			}
		});
		//submit 시 값 확인
		$("#addForm").submit(function() {
			let c_id = $("#c_id option:selected").val();
			let p_name = $("#p_name").val();
			let p_cost_price = $("#p_cost_price").val();
			let p_discount = $("#p_discount").val();
			let p_selling_price = $("#p_selling_price").val();
			let p_stock = $("#p_stock").val();
			let image_route = $("#image_route").val();
			let p_content = $("#p_content").val();
			
			if (c_id=='none') {
				$("#modalBtn").click();
				/* alert("카테고리를 선택하세요"); */
				$("#c_id").focus();
				event.preventDefault();
			} else if (p_name.length==0) {
				$("#modalBtn").click();
				/* alert("상품명을 입력하세요"); */
				$("#p_name").focus();
				event.preventDefault();
			} else if (p_cost_price.length==0) {
				$("#modalBtn").click();
				/* alert("정상가를 입력하세요"); */
				$("#p_cost_price").focus();
				event.preventDefault();
			} else if (p_discount.length==0) {
				$("#modalBtn").click();
				/* alert("할인가를 입력하세요"); */
				$("#p_discount").focus();
				event.preventDefault();
			} else if (p_selling_price.length==0) {
				$("#modalBtn").click();
				/* alert("판매가를 입력하세요"); */
				$("#p_selling_price").focus();
				event.preventDefault();
			} else if (p_stock.length==0) {
				$("#modalBtn").click();
				/* alert("재고를 입력하세요"); */
				$("#p_stock").focus();
				event.preventDefault();
			} else if (image_route.length==0) {
				$("#modalBtn").click();
				/* alert("상품 이미지를 등록하세요"); */
				$("#image_route").focus();
				event.preventDefault();
			} else if (p_content.length==0) {
				$("#modalBtn").click();
				/* alert("상품 설명을 등록하세요"); */
				$("#p_content").focus();
				event.preventDefault();
			}
		});
 
	})//end ready
</script>

<div class="container">
	<form action="" method="post">
		<div class="row">
			<div class="btn-group" role="group" aria-label="Basic example">
				<button type="button" class="btn btn-outline-success category" data-category="member" id="memberManagement">회원관리</button>
				<button type="button" class="btn btn-outline-success category" data-category="product" id="productManagement">상품관리</button>
				<button type="button" class="btn btn-outline-success category" data-category="challenge" id="challengeManagement">챌린지관리</button>
			</div>
		</div>
	</form>
</div>

<div class="container prodContainer">
	<div class="row justify-content-center">
		<div class="col-md-8">
			<div class="card">
			<div class="card-header" style="text-align: left; font-weight: bold; font-size: large;">상품등록</div>
				<div class="card-body">
					<!-- add form 시작 -->
					<form action="ProductAddServlet" id="addForm" class="form-horizontal" method="post">
					<!-- 상품카테고리 -->
					<div class="form-group">
						<label for="c_id" class="cols-sm-2 control-label" style="font-weight: bold;">상품 카테고리</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
								<!-- <input type="text" class="form-control" name="c_id" /> -->
								<label class="visually-hidden" for="autoSizingSelect">category</label>
						    	 <select name="c_id" id="c_id" class="form-select" aria-label="Default select example">
							        <option value="none" selected disabled hidden>카테고리 선택</option>
							        <option value="6">sale</option>
							        <option value="8">bath</option>
							        <option value="9">kitchen</option>
							        <option value="10">life</option>
						         </select>
							</div>
						</div>
					</div>
					<!-- 상품명 -->
					<div class="form-group">
						<label for="p_name" class="cols-sm-2 control-label" style="font-weight: bold;">상품명</label>
						<div class="cols-sm-10">
							<div class="input-group">
							    <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
							    <input type="text" class="form-control" name="p_name" id="p_name"  />
							</div>
						</div>
					</div>
					<!-- **정상가 : , 자동입력 되나? -->
					<div class="form-group">
					    <label for="p_cost_price" class="cols-sm-2 control-label" style="font-weight: bold;">정상가</label>
					    <div class="cols-sm-10">
					        <div class="input-group">
					            <span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
					            <input type="text" class="form-control" name="p_cost_price" id="p_cost_price"  />
					        </div>
					    </div>
					</div>
					<!-- 할인 -->
					<div class="form-group">
						<label for="type" class="col-sm-3 control-label" style="font-weight: bold;">할인</label>
						<div class="cols-sm-10">
						    <div class="input-group">
						      <span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
						      <input type="text" name="p_discount" id="p_discount" class="form-control" >
						    </div>
						</div>
					</div>
					<!-- 최종판매가 -->
					<div class="form-group">
					    <label for="number" class="cols-sm-2 control-label" style="font-weight: bold;">판매가</label>
					    <div class="cols-sm-10">
					        <div class="input-group">
					            <span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
					            <input type="text" class="form-control" name="p_selling_price" id="p_selling_price"  />
					        </div>
					    </div>
					</div>
					<!-- 재고 -->
					<div class="form-group">
					    <label for="number" class="cols-sm-2 control-label" style="font-weight: bold;">재고</label>
					    <div class="cols-sm-10">
					        <div class="input-group">
					            <span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
					            <input type="text" class="form-control" name="p_stock" id="p_stock" />
					        </div>
					    </div>
					</div>
					<!-- **이미지 : 첨부파일->4개 첨부되게 수정해야 함 -->
					<div class="form-group">
					    <label for="image_route" class="cols-sm-2 control-label" style="font-weight: bold;">이미지</label>
					    <div class="cols-sm-10">
					        <div class="input-group">
					            <span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
								<input class="form-control" type="file" name="image_route" id="image_route">
					        </div>
					    </div>
					</div>
					<!-- 상품설명 -->
					<div class="form-group">
					    <label for="p_content" class="cols-sm-2 control-label" style="font-weight: bold;">상품설명</label>
					    <div class="cols-sm-10">
					        <div class="input-group">
					            <span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
					            <input type="text" class="form-control" name="p_content" id="p_content"  />
					        </div>
					    </div>
					</div>
					<!-- 상품상세설명 : 첨부파일 -->
					<div class="form-group">
					    <label for="p_content_detail" class="cols-sm-2 control-label" style="font-weight: bold;">상품 상세설명</label>
					    <div class="cols-sm-10">
					        <div class="input-group">
					            <span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
					            <input class="form-control" type="file" name="p_content_detail" id="p_content_detail">
					        </div>
					    </div>
					</div>
					<!-- 상품등록or취소 버튼 -->
					<div class="form-group" style="margin-top: 20px; text-align: center;">
						<input type="submit" value="등록" id="addProd" class="btn btn-success">
						<button id="backList" class="btn btn-success">취소</button>
					</div>
				    </form>
				</div>
			</div>
		</div>
	</div>
</div>


<button id="modalBtn" type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#staticBackdrop" style="display: none;">modal</button>
<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body text-center">
        모든 항목을 입력하였는지 확인해 주세요
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-success" data-bs-dismiss="modal" onclick="">확인</button>
      </div>
    </div>
  </div>
</div>