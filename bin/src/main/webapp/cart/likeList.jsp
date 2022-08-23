<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
<%@ page import="com.dto.CartDTO"%>
<%@ page import="com.dto.CategoryProductDTO" %>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<div class="likeContainer">
	<%
	int count = (int) request.getAttribute("cartCount");
	%>
	<div class="row">
		<div class="btn-group" role="group" aria-label="Basic example">

			<button type="button" class="btn btn-outline-success" id="cart">
				<input type="checkbox" name="allCheck" id="allCheck"> 장바구니(<%=count%>)
			</button>
			<button type="button" class="btn btn-outline-success" id="like">
			<input type="checkbox" name="allCheck" id="allCheck">찜한상품()</button>
		</div>
	</div>
	<%
	request.setCharacterEncoding("utf-8");

	List<CategoryProductDTO> list = (List<CategoryProductDTO>) request.getAttribute("productList");
	if (list.size() == 0) {
	%>
	<div>
		<div class="no_item_cart" style="text-align: center; padding: 50px; line-height: 70px;"   > 
			<img src="images/liked.png" width="150" height="150" ><br>
			<span >찜한 상품이 없습니다.</span>
			<div>
				<button type="button" onclick="location.href='StoreServlet';"
					class="btn btn-success" >상품보러가기</button>
			</div>
		</div>
	</div>

	<%
	} else {
	Map<String, Integer> map = (Map<String, Integer>) request.getAttribute("map");
	int sum_money = map.get("sum_money");
	int fee = map.get("fee");
	int total = map.get("total");

	for (int i = 0; i < list.size(); i++) {
		String userid = list.get(i).getUserid();
		int p_id = list.get(i).getP_id();
		String p_name = list.get(i).getP_name();
		int p_selling_price = list.get(i).getP_selling_price();
		String p_image = list.get(i).getP_image();
	%>

	<form action="#">
		<div class="cart_content">

			<ul class="cart_list" style="line-height: 50px; font-size: 20px;">
				  <li>  <!--<input type="checkbox" name="check" id="check"
					class="check" value=""
					style="width: 30px; position: relative; bottom: 100px; margin-right: 10px;">-->
					<a href="ProductRetrieveServlet?p_id=<%=p_id%>"> <img
						src="images/p_image/<%=p_image%>.png" width="200"
						style="border: 10px;" height="200"></a>
					<div class="cart_list_info">
						 상품명: <a
							href="ProductRetrieveServlet?p_id=<%=p_id%>"> <span
							name="p_name"
							style="font-weight: bold; margin: 8px; display: line"><%=p_name%></span></a>
						<br>
						<%--<div class="amount">
							<label>수량:</label>  <input type="text" id="cartAmount<%=cart_id%>"
								class="p_amount" name="p_amount"
								style="text-align: right; line-height: 0px;" maxlength="3"
								size="2" value="<%=p_amount%>"> <input type="button"
								value="수정" id="updBtn" class="updBtn" style="line-height: 28px;"
								data-xxx="<%=cart_id%>" data-price="<%=p_selling_price%>"
								data-id="<%=%>" data-sum_money="<%=sum_money%>" /> <br> 
						</div>
						상품가격 :<span id="item_price<%=%>"
							style="margin-bottom: 15px;"><%=%></span><br>
					</div> <span class="cart_item_del"> <img src="images/delete.png"
						width="20" height="20" class="delBtn" data-xxx="<%=%>"></span>--%>
				</li>
			</ul>
		</div>
		<%
		}
		%>

		<%
		}
		%>
	</form>
</div>