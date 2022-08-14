
<%@ page import="com.dto.CartDTO"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
	.heading{
		flex:1;
		text-align: center;
	}
	.cart_content{
		padding : 0 19px;
	}
	
	.cart_content h3 {
		font-size: 13px;
		font-family: bold;
		margin-bottom: 4px;
		color: #F05522;
	}
	
	.cart_list li {
		display: flex;
		position: relative;
		padding: 24px 0;
		border-bottom: 1px solid green;
	}
	.cart_list li :last-child {
	 	border-bottom: none;
	}
	.cart_list li .cart_item_del {
		position: absolute;
		right: 0;
		top: 24;
		opacity: 0.3;
		cursor: pointer;
		
	}
	.cart_list li .cart_list_info{
			flex: 1;
			margin: 21px;
	}
	#p_amount{
		border: none;
		width:59px;
		height:30px;
		line-height : 30px;
		border-radius: 4px;
		border: 1px solid #D0D0D0;
		text-align: center;
			
	}
	.cart_total{
		padding: 24px 19px;
		background: #f5d5d5;
	}
	
	
</style>
	<header><h2 class="heading">장바구니</h2></header>
	<div></div>
<%
	request.setCharacterEncoding("utf-8");

	List<CartDTO> list = (List<CartDTO>) request.getAttribute("cartList");
	for (int i = 0; i <= list.size(); i++) {
		int cart_id = list.get(i).getCart_id();
		String userid = list.get(i).getUserid();
		int p_id = list.get(i).getP_id();
		String p_name = list.get(i).getP_name();
		int p_selling_price = list.get(i).getP_selling_price();
		int p_amount = list.get(i).getP_amount();
		String p_image = list.get(i).getP_image();
	
		%>
<div class="container">
	<form action="#">
		<div class="cart_content">
			<h3>
				<span></span>
			</h3>
			<ul class="cart_list">
				<li>
					<img src="images/p_image/<%=p_image%>.png" width="200" height="200">
					<div class="cart_list_info">
						<span><%=cart_id %></span>
						<h4 style="font-weight: bold; margin: 8px;"><%=p_name %></h4>
						<h5 style="font-size: 15px; margin-bottom: 15px;"><%=p_selling_price %></h5>
						<div class="amount">
							<label style="line-height: 30px;">수량</label>
							<input type="number" id="p_amount" min=1 value="<%=p_amount %>" >
						</div>
					</div>
					<span class="cart_item_del"><img  src="images/delete.png" width="50" height="50"></span>
				</li>
			</ul>
		</div>
		<% } %>
		<div class="cart_total">
			<div class="shipping">
				<h6>배송료</h6>
				<span class="price">3000</span>
			</div>
			<div class="total_price">
				<h6>총금액</h6>
				<span class="price"></span>
			</div>
		</div>
		<button class="btn big">주문하기</button>
	</form>
</div>
