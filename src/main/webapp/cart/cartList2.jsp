
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
		border-bottom: 5px solid green;
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
	<header><div class="heading"><img src="images/cart2.png"></div></header>
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
<!-- <div class="container"> -->
	<form action="#" style="padding: 200px;">
		<div class="cart_content">
			<table class="cart_list">
				<colgroup>
				<col style="width: 189px">
				<col style="width: 189px">
				<col style="width: 147px">
				</colgroup>
				<thead class="item-subject" style="top: 58.1562px;">
		<tr >
			<th class="item-info">
				<div class="im-flex">
                  <input type="checkbox" value="" class="_all_check" id="chk">
					<span >상품 정보</span>
				</div>
			</th>
			<th class="amount text-center"><span>수량</span></th>
			<th class="price text-center"><span >주문금액</span></th>
			<th class="deliv_price text-center"><span >배송 정보</span></th>
		</tr>
		<tr >
			<th  colspan="4">
				<div class="im-flex im-justify-between im-items-center im-cart-checkbox-wrap">
					<div class="im-flex im-items-center checkbox checkbox-styled no-margin">
						<label>
							<input type="checkbox" value="" class="_all_check" onclick="SITE_SHOP_CART.toggleAllCheckCartItem($(this).is(':checked'),'N');">
							<span></span>
						</label>
						<span class="text-15" style="margin-left: 10px;">전체선택</span>
					</div>
					<div class="cart-btn-tools text-13">
						<a class="btn" id="chochk">선택상품 삭제</a>
					</div>
				</div>
			</th>
		</tr>
		</thead>
		<tbody >
			<tr class="content" style="overflow: visible;">	
				<td >
				 <input type="checkbox"/>
				 <div class="cart_img">
				 	<img src=src="images/p_image/<%=p_image%>.png" width="200" height="200">
				 </div>
				 <p class="cart_item_title text-15" id="cart_title"><%=p_name%></p>
				<span class="cart_item_del"><img  src="images/delete.png" width="50" height="50"></span>	
				</td>
				 
		</tbody>
			</table>
			
	</form>
<%} %>
<!-- </div> -->
