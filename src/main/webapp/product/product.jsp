
<%@page import="com.dto.ProductDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		//장바구니 팝업
		$("#cart").on("click",function(){
			
		});
	});
</script>
 

<table width="100%" cellspacing="0" cellpadding="0">

	<tr>
		<td>
			<table align="center" width="710" cellspacing="0" cellpadding="0"
				border="0">
				
				<tr>
					<td height="5"></td>
				</tr>
				<tr>
					<td height="1" colspan="8" bgcolor="CECECE"></td>
				</tr> 
				<tr>
					<td height="10"></td>
				</tr>

				<tr>
				

 <%
     /* **상단*** 
     if(p_category가 timeEvent 또는 firstEvent)일떄 <include productSaleCategory.jsp>
     if (p_category가 timeEvent일떄 타이머, firstEvent일때 첫구매할인 배너) */
    
     
   	List <ProductDTO> list = (List<ProductDTO>)request.getAttribute("productList"); 
     
     
		if(list.get(1).getP_category().equals("timeEvent")||list.get(1).getP_category().equals("firstEvent")){
			%>
		<jsp:include page="productSaleCategory.jsp" flush="true" ></jsp:include><br>
			<%}
     	if(list.get(1).getP_category().equals("timeEvent")){
     	%>
     	<jsp:include page="../countdown.jsp"></jsp:include>
    <% }
     	if(list.get(1).getP_category().equals("firstEvent")){
     		%>
     	<jsp:include page="../firstEventbanner.jsp"></jsp:include>
     <% }
	 for (int i = 1; i <= list.size(); i++){
	
		
		 ProductDTO dto = list.get(i-1);
		 String p_id = dto.getP_id();
	     String p_name = dto.getP_name();
	     String p_content = dto.getP_content();
	     String p_category = dto.getP_category();
	     int p_cost_price =dto.getP_cost_price();
	     int p_selling_price = dto.getP_selling_price();
	     int p_discount = dto.getP_discount();
	     String p_created = dto.getP_created();
	     int p_stock = dto.getP_stock();
	     String p_img = dto.getP_img();
		 
	 	
 %>

						<td>
							<table style='padding:15px'>
								<tr>
									<td>
										<a href="ProductListServlet?p_category=<%=p_category%>"> <!-- 이미지링크 -->
											<img src="images/p_image/<%=p_img %>.jpg" border="0" align="center" width="200" height="300">											
										</a>
									</td>
								</tr>
								<tr>
								
									<td height="10">
								</tr>
								<tr>
									<td class= "td_default" align ="left">
										<a class= "a_black" href="ProductListServlet?p_category=<%=p_category%>"> 
										<%= p_name %>
										<br>
										</a>
									</td>	
								</tr>
								<tr>
									<td class="td_red" align ="left"><font color="red"><strong>
									<%=p_cost_price %>	</strong></font></td>
								</tr>
								<tr>
									<td>
									<img src="images/keeping.png" width="35" height="35" >
									<img src="images/bubble.png" width="32" height="32"  >
									<img src="images/cart.jpg" width="35" height="35" id="cart">
									
									</td>	
									
								</tr>
							</table>
						</td>
					<!-- 한줄에 4개씩 보여주기 -->	
				   <%
				   if(i%4==0){
				   %>
				       <tr>
				        <td height="10">
				       </tr>
				   <%
				   }	  //end if
				   %>		
						
<%
	 
	 }
%>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="10">
	</tr>
</table>
    
