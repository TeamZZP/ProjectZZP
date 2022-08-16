
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
	margin: 20px;
	
}

.cart_list_info span{
	padding: 20px;
	
}
#cartAmount {
	border: none;
	width: 59px;
	height: 30px;
	/* line-height: px; */
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
		
		$(".updBtn").on("click",function(){
			var cart_id = $(this).attr("data-xxx");
			var p_selling_price = $(this).attr("data-price");
			var p_amount =$("#cartAmount"+cart_id).val();
			console.log(cart_id,p_selling_price,p_amount)
			 $.ajax({
				data:"get",
				url:"CartUpdateServlet",
				data:{
					cart_id:cart_id,
					p_amount:p_amount
				},
				dataType:"text",
				success:function(data,status,xhr){
					var sum = p_amount*p_selling_price;
					$("#item_price"+cart_id).text(sum);
				},
				error:function(xhr,status,error){
					console.log(error);
				}
			}) 
		})//end
	})//end
</script>
<header>
	<div style="text-align: center; display: flex; justify-content:center; height: 100px; margin-bottom: 10px;" >
		<img src="images/cart2.png">
	</div>
</header>
<div class="container">
<div class="row" >
	<div class="btn-group" role="group" aria-label="Basic example">
		<button type="button" class="btn btn-outline-success"
			id="productDetail">장바구니()</button>
		<button type="button" class="btn btn-outline-success"
			id="productReview">찜한상품()</button>
		
	</div>
	</div>
<%
request.setCharacterEncoding("utf-8");
List<CartDTO> list = (List<CartDTO>) request.getAttribute("cartList");
if (list.size() == 0) {
%>
<table >
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

	<form action="#" >
	<div class="cart_content" >
		<h3>
			<span></span>
		</h3>
		<ul class="cart_list" style="line-height: 50px; font-size: 20px;">
			<li>
			<input type="checkbox" name="chk" id="chk" style="width: 30px; position: relative; bottom:100px; margin-right: 10px;">
			<img src="images/p_image/<%=p_image%>.png" width="200" style="border: 10px; "
				height="250">
				<div class="cart_list_info" >
					주문번호: <span><%=cart_id%></span><br> 
					상품명:<span style="font-weight: bold; margin: 8px; display: line"><%=p_name%></span>
					<br> 
					<div class="amount">
						<label >수량:</label> 
						<input type="text" id="cartAmount<%=cart_id %>" name="p_amount" style="text-align: right; line-height: 0px;"  maxlength="3"
								size="2"  value="<%=p_amount%>">
						<input type="button" value="수정" class="updBtn" style="line-height: 28px;"
						data-xxx="<%=cart_id %>" data-price="<%=p_selling_price %>" />
						<br>
					</div>
					상품가격 :<span id="item_price<%=cart_id %>" style="margin-bottom: 15px;"><%=p_selling_price * p_amount%></span>
					<br>
					
				</div>
				 <span class="cart_item_del">
					<img src="images/delete.png" width="20" height="20" class="delBtn" data-xxx="<%=cart_id %>"></span></li>
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
	<a class="a_black" href="javascript:orderAllConfirm(myForm)"> 전체 주문하기 </a>&nbsp;&nbsp;&nbsp;&nbsp; 
			<a class="a_black" href="javascript:delAllCart(myForm)"> 전체 삭제하기 </a>&nbsp;&nbsp;&nbsp;&nbsp;
			<a class="a_black" href="index.jsp"> 계속 쇼핑하기 </a>
	<!-- <button class="btn big">주문하기</button> -->
	<%
	}
	%>
</form>
</div>
<!-- </div> -->
