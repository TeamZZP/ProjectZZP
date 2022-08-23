<%@ page import="com.dto.CartDTO"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.heading {
	flex: 1;
	text-align: center;
}

a {
	color: black;
	text-decoration: none;
}

a:hover {
	color: black;
}

.cart_content {
	padding: 0 19px;
}

/* .cart_content h3 {
	font-size: 13px;
	font-family: bold;
	margin-bottom: 4px;
	color: #F05522;
} */
.cart_list li {
	display: flex;
	position: relative;
	padding: 24px;
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
	margin: 0px 20px;
}

.cart_list_info span {
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

#amountUpdate {
	border: none;
	width: 59px;
	height: 30px;
	line-height: 30px;
	border-radius: 4px;
	border: 1px solid #D0D0D0;
	text-align: center;
}

.cart_total>div {
	display: flex;
	text-align: center;
	justify-content: space-evenly;
}
</style>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(function() {
		//체크박스 미선택시 alert창
		$("form").on("submit", function() {
			if ($(".check").is(":checked") == false) {

				alert("삭제할 상품을 선택하세요.");
				event.preventDefault();
			}
		})//체크박스미선택

		//전체선택
		$("#allCheck").on("click", function() {
			var result = this.checked;
			$(".check").each(function(idx, data) {
				data.checked = result;
			})
		})//end allcheck
		//개별선택
		$(".delBtn").on("click", function() {
			var cart_id = $(this).attr("data-xxx");
			location.href = "CartDelServlet?cart_id=" + cart_id;
		})//end
		//장바구니 수량 수정
		$(".updBtn").on("click", function() {
			var cart_id = $(this).attr("data-xxx"); //cart_id
			var p_selling_price = $(this).attr("data-price");
			var p_amount = $("#cartAmount" + cart_id).val();
			var sum_money = $(this).attr("data-sum_money")
			console.log(cart_id, p_selling_price, p_amount, sum_money)
			var userid = $(this).attr("data-id");
			$.ajax({
				type : "get",
				url : "CartUpdateServlet",
				data : {
					cart_id : cart_id,
					p_amount : p_amount,
					sum_money : sum_money
				},
				dataType : "text",
				success : function(data, status, xhr) {
					var sum = p_amount * p_selling_price;
					$("#item_price" + cart_id).text(sum);

					sum_money = parseInt(data);
					var fee = sum_money >= 50000 ? 0 : 3000;
					var total = sum_money + fee;

					$("#sum_money").text(sum_money);
					$("#fee").text(fee);
					$("#total").text(total);
				},
				error : function(xhr, status, error) {
					console.log(error);
				}
			}) //up end
		})//end
		//
		/* $("#cart").on("click", function() {

			$.ajax({
				type : "get",
				url : "CartListServlet",
				data : {
					userid : userid
				},
				dataType : "text",
				success : function(data, status, xhr) {
					$(".container").empty();
					$("#outer").append(data);
				},
				error : function(xhr, status, error) {
					console.log(error);
				}
			})//end ajax
		})//end cart */

	})//end
</script>

<div id="outer">
	<header>
		<div
			style="text-align: center; display: flex; justify-content: center; height: 100px; margin-bottom: 10px;">
			<img src="images/cart2.png">
		</div>
	</header>
</div>

<div class="container">
	<%
	int count = (int) request.getAttribute("cartCount");
	%>
	<div class="row">
		<div class="btn-group" role="group" aria-label="Basic example">

			<button type="button" class="btn btn-outline-success" id="cart">
				<input type="checkbox" name="allCheck" id="allCheck"> 장바구니(<%=count%>)
			</button>
			<button type="button" class="btn btn-outline-success" id="like">찜한상품</button>
		</div>
	</div>
	<%
	request.setCharacterEncoding("utf-8");

	List<CartDTO> list = (List<CartDTO>) request.getAttribute("cartList");
	if (list.size() == 0) {
	%>
	<table>
		<tbody>
			<tr>
				<td>
					<div class="no_item_cart" style="text-align: center;">
						<img src="images/cart.jpg" width="150" height="150"><br>
						<span>장바구니에 담긴 상품이 없습니다.</span><br> <a href="StoreServlet">상품보러가기</a>
					</div>
				</td>
			</tr>
		</tbody>
	</table>

	<%
	} else {
	Map<String, Integer> map = (Map<String, Integer>) request.getAttribute("map");
	int sum_money = map.get("sum_money");
	int fee = map.get("fee");
	int total = map.get("total");
	%>

	<form action="CartDelAllServlet">
		<table>
			<thead class="item_subject">
				<tr>
					<th class="item_checkbox">
						<input type="checkbox" name="allCheck" id="allCheck">
					</th>
					<th class="item_info"><span>상품정보</span></th>
					<th class="amount text-center"><span>수량</span></th>
					<th class="price text-center"><span>주문금액</span></th>
				</tr>
			</thead>
			<%
			for (int i = 0; i < list.size(); i++) {
				int cart_id = list.get(i).getCart_id();
				String userid = list.get(i).getUserid();
				int p_id = list.get(i).getP_id();
				String p_name = list.get(i).getP_name();
				int p_selling_price = list.get(i).getP_selling_price();
				int p_amount = list.get(i).getP_amount();
				String p_image = list.get(i).getP_image();
			%>
			<tbody>
				<tr class="content" style="overflow: visible;">
					<td>
					<input type="checkbox" name="check" id="check" 
					class="check" value="<%=cart_id%>" style="width: 30px; position: relative; bottom: 100px; margin-right: 10px;">
					</td>
					<td class="img">
						<div class="cart_item_img">
						<a href="ProductRetrieveServlet?p_id=<%=p_id%>"> <img
						src="images/p_image/<%=p_image%>.png" width="200"
						style="border: 10px;" height="200"></a>
						</div>
					</td>
				</tr>
			</tbody>
			<%
			}
			%>


			<%
			}
			%>
		</table>
	</form>
</div>