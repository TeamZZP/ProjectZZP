<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.dto.ProductDTO"%>
<%@page import="com.dto.MemberDTO"%>
<%@page import="com.dto.ImagesDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
	.item_info td{
		padding-left: 10px;
	}

</style>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {

		$("#up").click(function() {

			var count = parseInt($("#p_amount").val());
			$("#p_amount").val(parseInt(count) + 1);

			var sellingPrice = $("#sellingPrice").text();
			//수정
			$("#total").text((count + 1) * sellingPrice);

		});//end up

		$("#down").click(function() {

			var count = parseInt($("#p_amount").val());

			if (count != 1) {
				$("#p_amount").val(parseInt(count) - 1);
				var sellingPrice = $("#sellingPrice").text();
				$("#total").text((count - 1) * sellingPrice);
			}

		});//end down

	 $("#cart").on("click", function() {
			
			$("form").attr("action", "addCartServlet");
		})//cart  
		
	
	$("#order").on("click", function() {
		$("form").attr("action", "orderServlet");
	}
 
	})//end ready

	/* function imageChange(this) {
	
	 //수정
	 String src2 = this.src;
	
	 $("#firstImage").attr(src,src2 )
	
	 } */
</script>



<%
ProductDTO pdto = (ProductDTO) request.getAttribute("ProductRetrieveDTO");

int c_id = pdto.getC_id();
String p_content = pdto.getP_content();
int p_cost_price = pdto.getP_cost_price();
String p_created = pdto.getP_created();
int p_discount = pdto.getP_discount();
int p_id = pdto.getP_id();
String p_name = pdto.getP_name();
int p_selling_price = pdto.getP_selling_price();
int p_stock = pdto.getP_stock();
%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<%
List<ImagesDTO> ilist = (List<ImagesDTO>) request.getAttribute("ImagesRetrieveList");

System.out.println("productRetrieve.jsp에서 파싱한 pdto==" + pdto);
System.out.println("productRetrieve.jsp에서 파싱한 ilist==" + ilist);
%>




<style>
	table {
	font-family: sans-serif;
	}
	
	
</style>

	<form  name="goodRetrieveForm" action="addCartServlet" method="get">
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-5">
				<table>
					<!-- 제품사진 -->
					<input type="hidden" name="p_id" value="<%=p_id%>">	
					<input type="hidden" name="p_name" value="<%=p_name%>">	
					<input type="hidden" name="p_selling_price" value="<%=p_selling_price%>">	
					
					<%
					for (int i = 0; i < ilist.size(); i++) {

						String image_route = ilist.get(i).getImage_route();
						int image_rnk = ilist.get(i).getImage_rnk();
						String update_date = ilist.get(i).getUpdate_date();
					%>
							
					<%
					if (image_rnk == 1) {
					%>
					<tr>
						<td colspan="4">
						<img id="firstImage" name="p_image"
							src="images/p_image/<%=image_route%>.png"
							class="img-thumbnail" style="height: 500; width: 600; " ></td>
							<input type="hidden" name="p_image" value="<%=ilist.get(0).getImage_route() %>">
					</tr>
					<%
					}
					%>
						
					<tr>
								<td>
									<%
									if (image_rnk != 1) {
									%> 
									<img
									src="images/p_image/<%=image_route%>.png"
									class="img-thumbnail" style="height: 100; width: 100;  "
									onmouseover="imageChange(this)"> <%
 }
 %>
								</td>
					</tr>
				</table>
				<%
				}
				%>
				
			</div>
			<div class="col-md-1"></div>
			<div class="col-md-5" >
				<table class="item_info" style="line-height: 70px;">
					<!-- 상품 설명 -->
				
					<tr>
						<th>상품명</th>
						<td></td>
						<td ><%=p_name%></td>
					</tr>

					<tr>
						<td></td>
					</tr>

					<tr>
						<th>설명</th>
						<td></td>
						<td><%=p_content%></td>
					</tr>

					<tr>
						<td></td>
					</tr>

					<tr>
						<th>상품가격</th>
						<td></td>
						<td><span id="sellingPrice" name="p_selling_price"><%=p_selling_price%></span>원</td>
					</tr>

					<tr>
						<td></td>
					</tr>

					<tr>
						<th>배송비</th>
						<td></td>
						<td>3,000원(50,000원 이상 무료배송)</td>
					</tr>

					<tr>
						<td></td>
					</tr>

					<tr>
						<th>수량</th>
						<td></td>
						<td><input id="p_amount" name="p_amount" value="1" style="line-height: 27px;"  maxlength="3"
								size="2" >
							<button type="button" class="btn btn-outline-success" id="up" >+</button>
							<button type="button" class="btn btn-outline-success" id="down">-</button>
						</td>
						<td></td>

					</tr>

					<tr>
						<td></td>
					</tr>

					<tr>
						<th>총 상품가격</th>
						<td></td>
						<td><a id="total"><%=p_selling_price%></a>원</td>
					</tr>

					<tr>
						<td></td>
					</tr>

					<tr >
						
						<td><button type="button" class="btn btn-success" id="order">주문하기</button></td>
						<td></td>
						<td><button type="submit" class="btn btn-success" id="cart">장바구니저장</button></td>
					</tr>
					
				</table>
			</div>
		</div>
	</form>

<div class="row">
	<div class="btn-group" role="group" aria-label="Basic example">
		<button type="button" class="btn btn-outline-success"
			id="productDetail">제품상세</button>
		<button type="button" class="btn btn-outline-success"
			id="productReview">구매후기</button>
		<button type="button" class="btn btn-outline-success" id="productQnA">QnA</button>
	</div>


</div>

