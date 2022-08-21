<%@page import="com.dto.CategoryProductDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
List<CategoryProductDTO> product_list = (List<CategoryProductDTO>) request.getAttribute("product_list");
%>
<style>

</style>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function () {
	$("body").on("click", ".productDetail", function() {
		console.log($(this).attr("data-p_id"))
		$.ajax({
			type: "post",
			url: "AdminProdDetailServlet",
			data: {
				p_id:$(this).attr("data-p_id")
			},
			success: function(data) {
				$("#adminContent").html(data);
			},
			error: function() {
				alert("문제가 발생했습니다. 다시 시도해 주세요.");
			}
		});//end ajax
	});
	
	
});//end ready
</script>

<div class="container" style="margin-top: 5px; margin-bottom: 5px;">
	<div class="row row-cols-auto">
		  <div class="col"></div>
			  <div class="col">
				  <select class="form-select" data-style="btn-info" id="inputGroupSelect01" 
				  		  style="width: 145px; margin-right: -20px; margin-left: -24px;">
					    <option selected disabled="disabled">카테고리</option>
					    <option value="userid">아이디</option>
					    <option value="username">이름</option>
					    <option value="email">이메일</option>
					    <option value="phone">전화번호</option>
					    <option value="address">주소</option>
				  </select>
			  </div>
		  <div class="col"><input type="text" class="form-control" style="width: 150px; margin-right: -20px;"></div>
	      <div class="col"><button type="button" class="btn btn-success">검색</button></div>
	</div>
</div>
<div class="container col-md-auto">
<div class="row justify-content-md-center">
<form>
<table class="table table-hover table-sm">
	<tr>
		<th>카테고리</th>
		<th>상품번호</th>
		<th>상품이름</th>
		<th>가격</th>
		<th>할인금액</th>
		<th>재고</th>
		<th>등록일</th>
		<th>관리</th>
	</tr>
<%
for ( int i = 0 ; i < product_list.size() ; i++ ) {
    int p_id = product_list.get(i).getP_id(); //상품번호
    String p_name =product_list.get(i).getP_name(); //상품이름
	String p_content =product_list.get(i).getP_content(); //상품설명
	int c_id =product_list.get(i).getC_id(); //카테고리 번호
	int p_cost_price =product_list.get(i).getP_cost_price(); //구매비용?
	int p_selling_price =product_list.get(i).getP_selling_price(); //판매가
	int p_discount =product_list.get(i).getP_discount(); //할인
	String p_created=product_list.get(i).getP_created(); //등록일
	int p_stock =product_list.get(i).getP_stock(); // 재고
	String p_image = product_list.get(i).getP_image(); //이미지
%>
	<tr id="list">
		<td class="productDetail" data-p_id="<%= p_id %>"><%= c_id %></td>
		<td class="productDetail" data-p_id="<%= p_id %>"><%= p_id %></td>
		<td class="productDetail" data-p_id="<%= p_id %>"><%= p_name %></td>
		<td class="productDetail" data-p_id="<%= p_id %>"><%= p_selling_price %>&nbsp;</td>
		<td class="productDetail" data-p_id="<%= p_id %>"><%= p_discount %></td>
		<td class="productDetail" data-p_id="<%= p_id %>"><%= p_stock %>&nbsp;&nbsp;</td>
		<td class="productDetail" data-p_id="<%= p_id %>"><%= p_created %></td>
		<td>
			<!-- Modal -->
			<div class="modal fade" id="deleteMember" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="staticBackdropLabel">회원 삭제</h5>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			        선택한 회원을 삭제하시겠습니까?
			      </div>
			      <div class="modal-footer">
			        <button type="button" id="" class="btn btn-success">삭제</button>
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
			      </div>
			    </div>
			  </div>
			</div>
			<!-- Button trigger modal -->
			<button type="button" id=""  class="btn btn-outline-success btn-sm">수정</button>
			<button type="button" id=""  class="btn btn-outline-dark btn-sm" data-bs-toggle="modal" data-bs-target="#deleteMember">
				삭제
			</button><!-- open modal -->
		</td>
<%
	}
%>
	</tr>
</table>
</form>
</div>
</div>