<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.dto.MemberDTO" %>
    <%@ page import="com.dto.CategoryProductDTO" %>
    <%@ page import="java.util.List" %>
    <%@ page import="java.util.HashMap" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<img src="images/ordering.jpg" width="850" height="350">
<%
MemberDTO mdto = (MemberDTO)session.getAttribute("login");
List<CategoryProductDTO> list = (List<CategoryProductDTO>)request.getAttribute("list");
HashMap<String, Integer> map = (HashMap<String, Integer>)request.getAttribute("map");
%>

<% 
   for (int i = 0; i < list.size(); i++) {
      String userid = list.get(i).getUserid();
      int p_id = list.get(i).getP_id();
      String p_name = list.get(i).getP_name();
      int p_selling_price = list.get(i).getP_selling_price();
      String p_image = list.get(i).getP_image();
      int p_amount = map.get("p_amount");
      
      System.out.println("상품명 :" + p_name);
      System.out.println("상품번호 :" + p_id);
   %>

 
      <div class="order_content">
         <input type="hidden" name="userid" id="userid" value="<%=userid %>">
         <ul class="orderProduct_list" style="line-height: 50px; font-size: 20px;">
            <li>
               <a href="ProductRetrieveServlet?p_id=<%=p_id%>"> <img
                  src="images/p_image/<%=p_image%>.png" width="150"
                  style="border: 10px;" height="150"></a>
               <div class="cart_list_info">
               
                <input type="hidden" id="p_id" name="p_id" value="<%=p_id%>">
               
                  <br> 상품명: 
                  <a href="ProductRetrieveServlet?p_id=<%=p_id%>"> 
                  <span name="p_name" style="font-weight: bold; margin: 8px; display: line"><%=p_name%></span>
                  </a>
                  <br>
                  
                  <div class="amount">
                     <label>수량:</label> <input type="text" id="orderAmount"
                        class="p_amount" name="p_amount"
                        style="text-align: right; line-height: 0px;" maxlength="3"
                        size="2" value="<%=p_amount%>"><br>
                  </div>
                  상품가격 :<span id="item_price"
                     style="margin-bottom: 15px;"><%=p_selling_price%></span><br>
               </div> 
            </li>
         </ul>
      </div>
      <%} %>


</body>
</html> 