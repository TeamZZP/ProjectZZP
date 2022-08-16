
<%@ page import="com.dto.CartDTO"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.heading {
	flex: 1;
	text-align: center;
}

.cart_content {
	padding: 0 19px;
}

.cart_content h3 {
	font-size: 13px;
	font-family: bold;
	margin-bottom: 4px;
	color: #F05522;
}



.cart_list li {
	/* border-top: 5px solid green; */
	display: flex;
	position: relative;
	padding: 24px 0;
	border-bottom: 5px solid green;
}

.cart_list li :frist-child {
	 border-top: 5px solid green; 
	
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

.cart_list li .cart_list_info {
	flex: 1;
	margin: 21px;
}

.cart_list_info span{
	padding: 20px;
	
}
#p_amount {
	border: none;
	width: 59px;
	height: 30px;
	line-height: 30px;
	border-radius: 4px;
	border: 1px solid #D0D0D0;
	text-align: center;
}

#amountUpdate{
	border: none;
	width: 59px;
	height: 30px;
	line-height: 30px;
	border-radius: 4px;
	border: 1px solid #D0D0D0;
	text-align: center;
}

.cart_total {
	padding: 24px 19px;
	background: #f5d5d5;
}

.cart_total>div {
	display: flex;
	justify-content: space-between;
}
</style>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script>
	$(function() {
		
		//삭제버튼
		$(".delBtn").on("click",function(){
			var cart_id = $(this).attr("data-xxx");
			console.log(cart_id);
			location.href="CartDelServlet?cart_id="+cart_id;
		})//end
		
		$("#updBtn").on("click",function(){
			var cart_id = $(this).attr("data-xxx");
			var amount = $("#p_amount").val();
			var 
		})//end
	})//end
</script>
<header>
	<div class="heading">
		<img src="images/cart2.png">
	</div>
</header>

<%
request.setCharacterEncoding("utf-8");
List<CartDTO> list = (List<CartDTO>) request.getAttribute("cartList");
if (list.size() == 0) {
%>
<table>
	<thead style="flex: 1;">
		<tr>
			<th>장바구니()</th>
			<th>찜()</th>
		</tr>
	</thead>
	<tbody>
		<tr>
		<td>
			<div class="no_item_cart" style="text-align: center;">
				<img src="images/cart.jpg" width="150" height="150"><br>
				<span>장바구니에 담긴 상품이 없습니다.</span><br>
				<a href="StoreServlet">상품보러가기</a>
			</div>
		</td>	
		</tr>
	</tbody>
</table>

<%
} else {
for (int i = 0; i < list.size(); i++) {
	int cart_id = list.get(i).getCart_id();
	String userid = list.get(i).getUserid();
	int p_id = list.get(i).getP_id();
	String p_name = list.get(i).getP_name();
	int p_selling_price = list.get(i).getP_selling_price();
	int p_amount = list.get(i).getP_amount();
	String p_image = list.get(i).getP_image();
%>

	<form action="#" style="padding: 200px;">
	<div class="cart_content">
		<h3>
			<span></span>
		</h3>
		<ul class="cart_list">
			<li>
			<input type="checkbox" name="chk" id="chk" style=" position: relative;  top: 1.5px;">
			<img src="images/p_image/<%=p_image%>.png" width="200"
				height="200">
				<div class="cart_list_info">
					주문번호: <span><%=cart_id%></span><br> 
					상품명:<span style="font-weight: bold; margin: 8px; display: line"><%=p_name%></span>
					<br> 
					<div class="amount">
						<label style="line-height: 30px;">수량</label> 
						<input type="text" id="p_amount" name="p_amount" style="text-align: right" maxlength="3"
								size="2"  value="<%=p_amount%>">
						<input type="button" value="수정" id="updBtn" />
						<br>
					</div>
					상품가격 :<span id="item_price" style="margin-bottom: 15px;"><%=p_selling_price * p_amount%></span>
					<br>
					
				</div>
				 <span class="cart_item_del">
					<img src="images/delete.png" width="50" height="50" class="delBtn" data-xxx="<%=cart_id %>"></span></li>
		</ul>
	</div>

	<%
	}
	%>
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
	<a class="a_black"
			href="javascript:orderAllConfirm(myForm)"> 전체 주문하기 </a>&nbsp;&nbsp;&nbsp;&nbsp; 
			<a class="a_black" href="javascript:delAllCart(myForm)"> 전체 삭제하기 </a>&nbsp;&nbsp;&nbsp;&nbsp;
			<a class="a_black" href="index.jsp"> 계속 쇼핑하기 </a>
	<!-- <button class="btn big">주문하기</button> -->
	<%
	}
	%>
</form>
<!-- </div> -->
