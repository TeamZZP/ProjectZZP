<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.dto.ProductDTO"%>
<%@page import="com.dto.MemberDTO"%>
<%@page import="com.dto.ImagesDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.dto.AnswerDTO"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.dto.QuestionDTO"%>
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
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		//취소버튼 클릭 시 목록으로
		$("#backList").click(function() {
			$("form").attr("action","AdminCategoryServlet?category=product");
		});
		//정상가 수정 시 판매가 자동계산
		$("#p_cost_price").keyup(function() {
			let p_cost_price = $(this).val();
			let p_discount = $("#p_discount").val();
			if (p_cost_price - p_discount!=0) {
				$("#p_selling_price").val(p_cost_price - p_discount);
			} else {
				$("#p_selling_price").val("금액을 확인하세요");
			}
		});
		//할인가 수정 시 판매가 자동계산
		$("#p_discount").keyup(function() {
			let p_cost_price = $("#p_cost_price").val();
			let p_discount = $(this).val();
			if (p_cost_price - p_discount!=0) {
				$("#p_selling_price").val(p_cost_price - p_discount);
			} else {
				$("#p_selling_price").val("금액을 확인하세요");
			}
		});
 
	})//end ready
</script>
<%
ProductDTO pdto = (ProductDTO) request.getAttribute("ProductRetrieveDTO");
	int c_id = pdto.getC_id(); //카테고리 번호
	String p_content = pdto.getP_content(); //상품설명
	int p_cost_price = pdto.getP_cost_price(); //판매가
	String p_created = pdto.getP_created(); //등록일
	int p_discount = pdto.getP_discount(); //할인
	int p_id = pdto.getP_id(); //상품번호
	String p_name = pdto.getP_name(); //상품명
	int p_selling_price = pdto.getP_selling_price(); //할인적용판매가
	int p_stock = pdto.getP_stock(); //재고
	
List<ImagesDTO> ilist = (List<ImagesDTO>) request.getAttribute("ImagesRetrieveList");

%>

<div class="container prodContainer">
	<div class="row justify-content-center">
		<div class="col-md-8">
			<div class="card">
			<div class="card-header" style="text-align: left; font-weight: bold; font-size: large;">상품상세보기</div>
				<div class="card-body">
					<!-- Update form 시작 -->
					<form action="ProductUpdateServlet" class="form-horizontal" method="post">
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
							        <option <% if(6==c_id) {%>selected<%} %> value="6">sale</option>
							        <option <% if(8==c_id) {%>selected<%} %> value="8">bath</option>
							        <option <% if(9==c_id) {%>selected<%} %> value="9">kitchen</option>
							        <option <% if(10==c_id) {%>selected<%} %> value="10">life</option>
						         </select>
							</div>
						</div>
					</div>
					<!-- 상품번호 -->
					<div class="form-group">
						<label for="p_id" class="cols-sm-2 control-label" style="font-weight: bold;">상품번호</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
								<input type="text" class="form-control" name="p_id" id="p_id" value="<%= p_id %>" readonly />
							</div>
						</div>
					</div>
					<!-- 상품명 -->
					<div class="form-group">
						<label for="p_name" class="cols-sm-2 control-label" style="font-weight: bold;">상품명</label>
						<div class="cols-sm-10">
							<div class="input-group">
							    <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
							    <input type="text" class="form-control" name="p_name" id="p_name" value="<%= p_name %>" />
							</div>
						</div>
					</div>
					<!-- **정상가 : , 자동입력 되나? -->
					<div class="form-group">
					    <label for="p_cost_price" class="cols-sm-2 control-label" style="font-weight: bold;">정상가</label>
					    <div class="cols-sm-10">
					        <div class="input-group">
					            <span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
					            <input type="text" class="form-control" name="p_cost_price" id="p_cost_price" value="<%= p_cost_price %>" />
					        </div>
					    </div>
					</div>
					<!-- 할인 -->
					<div class="form-group">
						<label for="type" class="col-sm-3 control-label" style="font-weight: bold;">할인</label>
						<div class="cols-sm-10">
						    <div class="input-group">
						      <span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
						      <input type="text" name="p_discount" id="p_discount" class="form-control" value="<%= p_discount %>">
						    </div>
						</div>
					</div>
					<!-- 최종판매가 -->
					<div class="form-group">
					    <label for="number" class="cols-sm-2 control-label" style="font-weight: bold;">판매가</label>
					    <div class="cols-sm-10">
					        <div class="input-group">
					            <span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
					            <input type="text" class="form-control" name="p_selling_price" id="p_selling_price" value="<%= p_cost_price - p_discount %>" />
					        </div>
					    </div>
					</div>
					<!-- 재고 -->
					<div class="form-group">
					    <label for="number" class="cols-sm-2 control-label" style="font-weight: bold;">재고</label>
					    <div class="cols-sm-10">
					        <div class="input-group">
					            <span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
					            <input type="text" class="form-control" name="p_stock" id="p_stock" value="<%= p_stock %>" />
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
					            <input type="text" class="form-control" name="p_content" id="p_content" value="<%= p_content %>" />
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
						<input type="submit" value="수정" id="updateProd" class="btn btn-success">
						<button id="backList" class="btn btn-success">취소</button>
					</div>
				    </form>
				</div>
			</div>
		</div>
	</div>
</div>