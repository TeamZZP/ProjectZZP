<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.dto.OrderDTO"%>
<%@ page import="com.dto.ProductDTO"%>


<%
List<OrderDTO> orderList = (List<OrderDTO>) request.getAttribute("orderList");
List<ProductDTO> productList = (List<ProductDTO>) request.getAttribute("productList");
//String order_date = orderList.get(0).getOrder_date();
String delivery_address = orderList.get(0).getDelivery_address();
%>
<div class="container" style="padding: 50px;">
	<div class="row">
		<div class="col" style="background-color: #f8f8f8;">
			<h1 style="text-align: center;">주문이 완료되었습니다</h1>
			<hr>
			<table class="table table-success"
				style="border: 3px; padding: 30px; text-align: center;">


				<thead>
					<tr>
						<th scope="row">상품명</th>
						<th>수량</th>
						<th>금액</th>
						<th>주문일</th>

					</tr>
				</thead>
				<%
				for (int i = 0; i < orderList.size(); i++) {
					int p_amount = orderList.get(i).getOrder_quantity();
					int p_id = orderList.get(i).getP_id();
					String order_date =orderList.get(i).getOrder_date();

					for (int j = 0; j < productList.size(); j++) {

						if (p_id == productList.get(j).getP_id()) {

					String p_name = productList.get(j).getP_name();
					int p_price = productList.get(j).getP_cost_price();
				%>

				<tbody>
					<tr class="table-light">
						<td><span id="p_name" name="p_name"><%=p_name%></span></td>
						<td><span id="p_amount" name="p_amount"><%=p_amount%>개</span></td>
						<td><span id="p_price" name="p_price"><%=p_price%>원</span></td>
						<td><span id="order_date" name="order_date"><%=order_date%></span></td>
					</tr>


					<%
					}
					}
					}
					%>




				</tbody>
			</table>
			<h3>배송지</h3>
			<br>
			<%=delivery_address%>
			<hr>
		</div>
	</div>
</div>


