<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.dto.MemberDTO" %>
    <%@ page import="com.dto.CategoryProductDTO" %>
    <%@ page import="com.dto.AddressDTO" %>
    <%@ page import="java.util.List" %>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="java.util.HashMap" %>
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


 #orderLi {
   display: flex;
   position: relative;
   padding: 24px;
   border-bottom: 5px solid green;
}

hr{
border-bottom: 2.5px solid green;
}
 #addLi {
  list-style:none;
}


</style>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

$(function() {
	
	$("#AddOrder").on("click", function() {	
		 $("form").attr("action", "AddOrderServlet");		
	});
	
	$("#delivery_loc").on("change", function() {
		console.log($("#delivery_loc").val());
	});
	
	
	
	 
});

</script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

 <div class="container">
 <form action="orderForm">
<div style="text-align : center;">
<img src="images/ordering.png" width="900" height="200" >
</div>

<h3 style="font-weight: bold; color: green;">&emsp;주문하실 상품</h3>
<hr id="orderHr">



<%
MemberDTO mdto = (MemberDTO)session.getAttribute("login");
List<CategoryProductDTO> list = (List<CategoryProductDTO>)request.getAttribute("list");
HashMap<String, Integer> map = (HashMap<String, Integer>)request.getAttribute("map");
ArrayList<HashMap<String, String>> PList = (ArrayList<HashMap<String, String>>)request.getAttribute("PList");
String[] pAmountListString = (String[])request.getAttribute("pAmountListString");

int total_price = 0;
   for (int i = 0; i < list.size(); i++) {
      String userid = list.get(i).getUserid();
      int p_id = list.get(i).getP_id();
      String p_name = list.get(i).getP_name();
      int p_selling_price = list.get(i).getP_selling_price();
      String p_image = list.get(i).getP_image();
      int p_amount= Integer.parseInt(pAmountListString[i]);
     
      System.out.println("상품명 :" + p_name);
      System.out.println("상품번호 :" + p_id);
   %>

      <div class="order_content">
         <input type="hidden" name="p_id" id="p_id" value="<%=p_id %>">
      	 <input type="hidden" name="p_amount" id="p_amount" value="<%=p_amount %>">
         <input type="hidden" name="p_price" id="p_price" value="<%=p_selling_price * p_amount %>">

         <ul class="orderProduct_list" style="line-height: 50px; font-size: 20px;">
            <li id="orderLi">
               <a href="ProductRetrieveServlet?p_id=<%=p_id%>"> <img
                  src="images/p_image/<%=p_image%>" width="150"
                  style="border: 10px;" height="150"></a>
              
               <div class="cart_list_info">
              
                  상품명: 
                  <a href="ProductRetrieveServlet?p_id=<%=p_id%>"> 
                  <span name="p_name" style=" margin: 8px; display: line"><%=p_name%></span>
                  </a>
                  <br>
                  수량: <span style=" margin: 8px; display: line"><%=p_amount%></span>
                  <br>
                  상품가격:<span id="item_price" style="margin-bottom: 15px; margin: 8px; display: line "><%=p_selling_price * p_amount %></span>
               </div> 
            </li>
         </ul>
      </div>
      <%
      total_price += p_selling_price * p_amount;
   } %>
      총금액: <%= total_price%>
      <br><br><br>
       <input type="hidden" name="total_price" id="total_price" value="<%=total_price %>">
<h3 style="font-weight: bold; color: green;">&emsp;배송지 선택</h3>
<a type="submit" class="btn btn-success"  id="selectAdd" style="float: right;"  href="javascript:selectAllAddress(<%=mdto.getUserid()%>)">다른배송지</a><br>
<hr id="orderHr">
      <%
      List<AddressDTO> add_list = (List<AddressDTO>)request.getAttribute("add_list");
      
      for(int i = 0; i<add_list.size(); i++){
    	if(  add_list.get(i).getDefault_chk()==1){
    	      
    		AddressDTO add_dto =  add_list.get(i);
    	%>
    	
    	<div class="addressContent">
    	<ul class="orderAddress_list" >
    	<li id="addLi">
    	<input type="hidden" name="AddressName" id="AddressName" value="<%= add_dto.getAddress_name()%>"> <br>
    	<input type="hidden" name="delivery_address" id="delivery_address" value="<%= add_dto.getAddr1()+" "+add_dto.getAddr2()%>"> <br>
    	<%= add_dto.getAddress_name()%><br>
    	받으시는 분 : <%= add_dto.getReceiver_name()%><br>
    	
    	배송지: <%=add_dto.getPost_num() %><br>
    	<%=add_dto.getAddr1() %>&nbsp;<%=add_dto.getAddr2() %><br>
    	
    	</li>
    	
    	</ul>
    	</div>
    	
    		
    	<% }
    	  
      }
      %>
      <hr id="orderHr">
      <h3 style="font-weight: bold; color: green;">&emsp;배송 요청</h3>
        <div class="addressContent">
    	<ul class="orderAddress_list" >
    	<li id="addLi">

         <input type="hidden" name="orderdate" id="orderdate" value="<%= (new java.util.Date()).toLocaleString()%>">
         <input type="hidden" name="order_state" id="order_state" value="주문완료">
    	 
        받으실 장소 :&emsp; &nbsp;
    	<select id="delivery_loc" name="delivery_loc">
    	<option value="frontDoor">문앞</option>
    	<option value="directly_or_frontDoor">직접받고 부재 시 문앞</option>
    	<option value="security">경비실</option>
    	<option value="delievery_box">택배함</option>
    	</select>
    	<br><br>
    	배송 요청사항 :&emsp;<input id="delivery_req"  name="delivery_req">
    	<br><br>
    	
      </li>
      </ul>
     </div> 
      <br>
      
        
         
        <button type="submit" class="btn btn-success" id="AddOrder" >주문하기</button>
        <button type="submit" class="btn btn-success" id="cancel" >돌아가기</button>
  
    </form>  
</div>

</body>
</html> 