
<%@ page import="com.dto.CartDTO"%>
<%@ page import="com.dto.product_likedDTO"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.container {
	padding-right: 15px;
	padding-left: 15px;
	margin-right: auto;
	margin-left: auto;
}

a {
	color: #646464;
	text-decoration: none;
}

.hover-zoomin a {
	display: block;
	position: relative;
	overflow: hidden;
	border-radius: 15px;
}

.hover-zoomin img {
	width: 250px;
	height: 250px;
	-webkit-transition: all 0.2s ease-in-out;
	-moz-transition: all 0.2s ease-in-out;
	-o-transition: all 0.2s ease-in-out;
	-ms-transition: all 0.2s ease-in-out;
	transition: all 0.2s ease-in-out;
}

.hover-zoomin:hover img {
	-webkit-transform: scale(1.1);
	-moz-transform: scale(1.1);
	-o-transform: scale(1.1);
	-ms-transform: scale(1.1);
	transform: scale(1.1);
}
</style>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(function() {

	})//end
</script>
<div id="outer">
	<div
		style="text-align: center; display: flex; justify-content: center; height: 100px; margin-bottom: 10px;">
		<img src="images/like2.png">
	</div>
</div>
<%
int cartCount = (int) request.getAttribute("cartCount");
int likeCount = (int) request.getAttribute("likeCount");
%>
<div class="container">
	<div class="row" align="center">
		<div class="btn-group" role="group" aria-label="Basic example">

			<button type="button" class="btn btn-outline-success" id="cart"
				onclick="location.href='CartListServlet';">
				<input type="checkbox" name="allCheck" id="allCheck"> 장바구니(<%=cartCount%>)
			</button>
			<button type="button" class="btn btn-outline-success" id="like">
				<!-- <input type="checkbox" name="allCheck" id="allCheck"> -->찜한상품(<%=likeCount%>)
			</button>
		</div>
		<%
		request.setCharacterEncoding("utf-8");

		List<product_likedDTO> list = (List<product_likedDTO>) request.getAttribute("list");
		if (list.size() == 0) {
		%>
		<div>
			<div class="no_item_cart"
				style="text-align: center; padding: 50px; line-height: 70px;">
				<img src="images/liked.png" width="150" height="150"><br>
				<span>찜한 상품이 없습니다.</span>
				<div>
					<button type="button" onclick="location.href='StoreServlet';"
						class="btn btn-success">상품보러가기</button>
				</div>
			</div>
		</div>

		<%
		}

		for (int i = 0; i < list.size(); i++) {
		String userid = list.get(i).getUserid();
		int p_id = list.get(i).getP_id();
		String p_name = list.get(i).getP_name();
		int p_selling_price = list.get(i).getP_selling_price();
		String p_image = list.get(i).getP_image();
		%>

		<div class="col-lg-3 col-md-4 col-sm-6">
			<div class="p-3">
				<div class="hover-zoomin">
					<a href="ProductRetrieveServlet?p_id=<%=p_id%>"> <img
						src="images/p_image/<%=p_image%>" width="200" height="200"
						importance="low"></a>
					<!-- <input type="checkbox" name="check" id="check" checked="checked" class="individual_cart_checkbox" 
					style="position:relative; top: -250px; right: 100px;" > -->
				</div>
				<!-- 장바구니 모달창 -->
				<button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#addcart<%=p_id %>">
					<img src="images/cart.png" width="25" height="25">
				</button>
				
				<div class="black_bg"></div>
				<!-- Modal -->
				<form action="addCartServlet">
					<input type="hidden" name="p_id" value="<%=p_id%>"> <input
						type="hidden" name="p_image" value="<%=p_image%>"> <input
						type="hidden" name="p_name" value="<%=p_name%>">
					
					<div class="modal fade" id="addcart<%=p_id %>" data-bs-backdrop="static"
						data-bs-keyboard="false" tabindex="-1"
						aria-labelledby="staticBackdropLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header" id="header">
									<h5 class="modal-title" id="cart_title" style="text-align: center">
										<%=p_name%>
									</h5>
									
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">
										<div class="opt_block no-border order_quantity_area"
											style="height: auto;">
											<div class="area_tit holder">
												<span class="option_title inline-blocked"
													style="margin-bottom: 7px">수량</span>
											</div>
											<div class="area_count holder">
												<div class="option_btn_wrap" style="top: 0;">
													<div class="option_btn_tools" style="float: none;">
														<input name="p_amount" id="quantity" value="1">
														<button type="button" class="btn btn-outline-success" id="up">+</button>
														<button type="button" class="btn btn-outline-success" id="down">-</button>
															<br> <input type="hidden" id="price" name="p_selling_price" value="<%=p_selling_price%>">
														<a>총 상품금액 : </a><span id="total"><%=p_selling_price%></span>원
													</div>
												</div>
											</div>
										</div>
								</div>
								<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">계속쇼핑하기</button>
								<button type="submit" class="btn btn-success">장바구니저장</button>
							</div>
							</div>
						</div>
					</div>
					</form>

			</div>
			<div>
				<a href="ProductRetrieveServlet?p_id=<%=p_id%>"> <span
					style="margin-bottom: 0.3em; font-weight: normal; color: #646464; font-size: 25px;"><%=p_name%></span></a>
			</div>
			<div>
				<p style="color: green; font-size: 20px;"><%=p_selling_price%>원
				</p>
			</div>
		</div>

		<%
		}
		%>

	</div>
	
</div>


<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(function() {

	})//end
</script>
