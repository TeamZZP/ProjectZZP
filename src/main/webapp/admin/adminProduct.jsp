<%@page import="com.dto.CategoryProductDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
List<CategoryProductDTO> product_list = (List<CategoryProductDTO>) request.getAttribute("product_list");
System.out.println("adminProduct페이지");
String mesg = (String)session.getAttribute("mesg");
if(mesg != null){
%>
	<script>
		alert("<%=mesg%>");
	</script>
<%
	}
	session.removeAttribute("mesg");
%>

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

<div class="container" style="margin-top: 5px; margin-bottom: 5px;">
	<div class="row row-cols-auto">
		  <div class="col"></div>
			  <div class="col">
				  <select class="form-select" data-style="btn-info" id="inputGroupSelect01" 
				  		  style="width: 145px; margin-right: -20px; margin-left: -24px;">
					    <option selected disabled hidden>카테고리</option>
					    <option value="c_id">카테고리</option>
					    <option value="p_id">상품번호</option>
					    <option value="p_name">상품명</option>
					    <option value="p_selling_price">판매가</option>
					    <option value="p_created">등록일</option>
				  </select>
		  	  </div>
		  <div class="col"><input type="text" class="form-control" style="width: 150px; margin-right: -20px;"></div>
	      <div class="col"><button type="button" class="btn btn-success">검색</button></div>
	      <a href="adminProductAdd.jsp" class="btn btn-success">상품등록</a>
	</div>
</div>
<div class="container col-md-auto">
<div class="row justify-content-md-center">
<form>
<table class="table table-hover table-sm">
	<tr>
		<th>카테고리</th>
		<th>상품번호</th>
		<th>상품명</th>
		<th>판매가</th>
		<th>할인</th>
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
	int p_cost_price =product_list.get(i).getP_cost_price(); //판매가
	int p_selling_price =product_list.get(i).getP_selling_price(); //할인적용판매가
	int p_discount =product_list.get(i).getP_discount(); //할인
	String p_created=product_list.get(i).getP_created(); //등록일
	int p_stock =product_list.get(i).getP_stock(); // 재고
	String p_image = product_list.get(i).getP_image(); //이미지
%>
	<tr id="list">
		<td class="productDetail" data-p_id="<%= p_id %>">
			<% if(6==c_id) {%>sale<%} %>
			<% if(8==c_id) {%>bath<%} %>
			<% if(9==c_id) {%>kitchen<%} %>
			<% if(10==c_id) {%>life<%} %>
		</td>
		<td class="productDetail" data-p_id="<%= p_id %>"><%= p_id %></td>
		<td class="productDetail" data-p_id="<%= p_id %>"><%= p_name %></td>
		<td class="productDetail" data-p_id="<%= p_id %>"><%= p_selling_price %>&nbsp;</td>
		<td class="productDetail" data-p_id="<%= p_id %>"><%= p_discount %></td>
		<td class="productDetail" data-p_id="<%= p_id %>"><%= p_stock %>&nbsp;&nbsp;</td>
		<td class="productDetail" data-p_id="<%= p_id %>"><%= p_created %></td>
		<td>
			<!-- Modal -->
			<div class="modal fade" id="deleteProduct" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="staticBackdropLabel">상품 삭제</h5>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			        선택한 상품을 삭제하시겠습니까?
			      </div>
			      <div class="modal-footer">
			        <button type="button" id="delProd<%= p_id %>" class="btn btn-success">삭제</button>
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
			      </div>
			    </div> 
			  </div>
			</div>
			<!-- 버튼 -->
			<button type="button" id="prodDetail" data-id="<%= p_id %>" class="btn btn-outline-success btn-sm">상품보기</button>
			<button type="button" id="delPopup<%= p_id %>" data-id="<%= p_id %>" class="btn btn-outline-dark btn-sm" data-bs-toggle="modal" data-bs-target="#deleteProduct">
				삭제
			</button>
		</td>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function () {
	//관리자페이지 카테고리
	$(".category").click(function() {
		let category = $(this).attr("data-category");
		location.href="AdminCategoryServlet?category="+category;
	});
	//상품등록 버튼
	$("#addProduct").click(function() {
		location.href="../adminProductAdd.jsp";
	});
	//상품 상세페이지
	$(".productDetail").click(function() {
		let p_id = $(this).attr("data-p_id");
		location.href="AdminProdDetailServlet?p_id="+p_id;
	});
	//상품보기 버튼
	$("body").on("click", "#prodDetail", function () {
		let p_id = $(this).attr("data-id");
		console.log(p_id);
		location.href="ProductRetrieveServlet?p_id="+p_id;
	});
	//상품삭제 버튼
	$("#deleteProduct").on("shown.bs.modal", function (e){//#deleteMember modal 창을 열 때 선택한 버튼의 data-id를 가져옴(deleteID로 설정했더니 안돼서 다시 id로 바꿈)--modal창의 삭제 버튼에 저장
		    var id = $(e.relatedTarget).data("id");
		    $("#delProd<%= p_id %>").val(id);
	});
	$("#delProd<%= p_id %>").on("click", function() {
		var p_id = $(this).val();
		console.log(p_id);
		location.href="ProductDeleteServlet?p_id="+p_id;
	});
	
});//end ready

</script>
<%
	}
%>
	</tr>
</table>
</form>
</div>
</div>

