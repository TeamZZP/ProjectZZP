<%@page import="com.dto.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   ProductDTO dto = (ProductDTO)session.getAttribute("Retrieve");
   String p_id = dto.getP_id();
   String p_name = dto.getP_name();
   String p_content = dto.getP_content();
   String p_category = dto.getP_category();
   int p_cost_price =dto.getP_cost_price();
   int p_selling_price =dto.getP_cost_price();
   int p_discount =dto.getP_cost_price();
   String p_created = dto.getP_created();
   int p_stock =dto.getP_stock();
   String p_img = dto.getP_img();

%>    
<form name="productRetrieveForm" method="GET" action="#">
      

   <table width="100%" cellspacing="0" cellpadding="0">
      <tr>
         <td height="30">
      </tr>
      <tr>
         <td>
            <table align="center" width="710" cellspacing="0" cellpadding="0"
               border="0" style='margin-left: 30px'>
               <tr>
                  <td class="td_default"><font size="5"><b>- 상품 정보 -</b></font>
                     &nbsp;</td>
               </tr>
               <tr>
                  <td height="5"></td>
               </tr>
               <tr>
                  <td height="1" colspan="8" bgcolor="CECECE"></td>
               </tr>
               <tr>
                  <td height="10"></td>
               </tr>

<<<<<<< HEAD
					<tr>
						<td rowspan="7">
							<div>
								<img src="images/p_image/<%=p_img %>.jpg"
							border="0" align="center" width="300" />
							<ul>
								<li><a href="#a"><img src="images/p_image/<%=p_img %>.jpg" height="50" width="50"></a></li>
							</ul>
							</div>
						</td>
						
					<tr>
						<td class="td_title" >상품명</td>
						<td class="td_default" colspan="2" style='padding-left: 30px'><%=p_name %></td>
					</tr>
					<tr>
						<td class="td_title">가격</td>	
						<td class="td_red" colspan="2" style='padding-left: 30px'>
						<%=p_selling_price %>
						</td>
					</tr>
					<tr>
						<td class="td_title">제품소개</td>
						<td class="td_default" colspan="2" style='padding-left: 30px'>
						 <%=p_content %><br>
						</td>
						</tr> 
						<tr>
						</tr>
					<tr>
						<td class="td_title">배송비</td>
						<td colspan="2"><font color="#2e56a9" size="2"
							style='padding-left: 30px'>
							<b> 무료배송</b> </font> 
							<font size="2">(도서산간지역 별도 배송비 추가)</font></td>
					</tr>
					

               <tr>
                  <td rowspan="7"><img src="images/p_image/<%=p_img %>.jpg"
                     border="0" align="center" width="300" />
                  </td>
                  
               <tr>
                  <td class="td_title">상품명</td>
                  <td class="td_default" colspan="2" style='padding-left: 30px'><%=p_name %></td>
               </tr>
               <tr>
                  <td class="td_title">가격</td>   
                  <td class="td_red" colspan="2" style='padding-left: 30px'>
                  <%=p_selling_price %>
                  </td>
               </tr>
               <tr>
                  <td class="td_title">제품소개</td>
                  <td class="td_default" colspan="2" style='padding-left: 30px'>
                   <%=p_content %><br>
                  </td>
                  </tr> 
                  <tr>
                  </tr>
               <tr>
                  <td class="td_title">배송비</td>
                  <td colspan="2"><font color="#2e56a9" size="2"
                     style='padding-left: 30px'><b> 무료배송</b> </font> <font size="2">(도서
                        산간지역 별도 배송비 추가)</font></td>
               </tr>
               


               <tr>
                  <td class="td_title">주문수량</td>
                  <td style="padding-left: 30px">
                  <input type="text"
                     name="gAmount" value="1" id="gAmount"
                     style="text-align: right; height: 18px">
                     <img src="images/up.png" id="up" width="20" height="20"> 
                     <img src="images/down.png" id="down" width="23" height="23">
                     </td>
               </tr>
               <tr>
               </tr>
            </table>
               
         </td>
      </tr>
   </table>


	<br> <button >구매</button>
	&nbsp;&nbsp;
	<button >장바구니</button><br>
	<a href="#info">상세정보</a>&nbsp;<a href="#review">구매평</a>&nbsp;<a href="#Q&A">Q&A</a><br>
	
	<a id="info">상세정보</a><br> 
	<a id="review">구매평</a><br> 
	
	<a id="Q&A">Q&A</a> <br>
	


   <br> <button onclick="reqCheck('order')" style="background-color: green"><font color = #ffffff>구매</font></button>
   &nbsp;&nbsp;
   <button onclick="reqCheck('cart')" style="background-color: green"><font color = #ffffff>장바구니</font></button>

</form>
    