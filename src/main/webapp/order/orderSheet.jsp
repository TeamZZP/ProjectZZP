<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List" %>
    <%@ page import="com.dto.OrderDTO" %>
    <%@ page import="com.dto.ProductDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
List<OrderDTO> orderList = (List<OrderDTO>)request.getAttribute("orderList");
List<ProductDTO> productList= (List<ProductDTO>)request.getAttribute("productList");
//String order_date = orderList.get(0).getOrder_date();
String delivery_address = orderList.get(0).getDelivery_address();
%>

<h1>주문완료</h1>
<br><br>
<!-- <h3>주문날짜</h3><br><br> -->
<h3>주문내역</h3>
<br><br>
<hr>

<%
for(int i = 0; i < orderList.size(); i++){
int p_amount = orderList.get(i).getOrder_quantity();
int p_id = orderList.get(i).getP_id();

   for(int j = 0; j< productList.size() ; j++){
	
	  if(p_id==productList.get(j).getP_id()){
		
		String p_name = productList.get(j).getP_name();
		int p_price = productList.get(j).getP_cost_price();

%>

상품명 : <input id="p_name" name="p_name" value="<%=p_name%>">
수량 : <input id="p_amount" name="p_amount" value="<%=p_amount%>">
금액 : <input id="p_price" name="p_price" value="<%=p_price*p_amount%>">
<hr>

<%
    	}
	}
} 
%>
<hr>
<h3>배송지</h3><br>
<%=delivery_address %>
<hr>

</body>
</html>