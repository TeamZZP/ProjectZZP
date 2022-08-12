
<%@ page import="com.dto.CartDTO"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<table width="90%" cellspacing="0" cellpadding="0" border="0" align="center">

	<tr>
		<td height="30">
	</tr>

	<tr>
		<td colspan="5" class="td_default"  align="center"> 
		<font size="5"><b> 장바구니</b></font> &nbsp;
		</td>
	</tr>

	<tr>
		<td height="15">
	</tr>

	<tr>
		<td colspan="10">
			<hr size="1" color="CCCCCC">
		</td>
	</tr>

	<tr>
		<td height="7">
	</tr>

	<tr>
		<td class="td_default" align="center">
		<input type="checkbox" name="allCheck" id="allCheck"> <strong>전체선택</strong></td>
		<td class="td_default" align="center"><strong>주문번호</strong></td>
		<td class="td_default" align="center" colspan="2"><strong>상품정보</strong></td>
		<td class="td_default" align="center"><strong>판매가</strong></td>
		<td class="td_default" align="center" colspan="2"><strong>수량</strong></td>
		<td class="td_default" align="center"><strong>합계</strong></td>
		<td></td>
	</tr>

	<tr>
		<td height="7">
	</tr>
	
	
	
	<tr>
		<td colspan="10">
			<hr size="1" color="CCCCCC">
		</td>
	</tr>
	
<%
	request.setCharacterEncoding("utf-8");

	List<CartDTO> list = (List<CartDTO>) request.getAttribute("cartList");
	if(list == null){
		%>
			<h1>저장된게 없습니다!!!!!!!!!!	</h1>
			
		<%}else{
			for (int i = 0; i <= list.size(); i++) {
			
			int cart_id = list.get(i).getCart_id();
			String userid = list.get(i).getUserid();
			int p_id = list.get(i).getP_id();
			String p_name = list.get(i).getP_name();
			int p_selling_price = list.get(i).getP_selling_price();
			int p_amount = list.get(i).getP_amount();
			String p_image = list.get(i).getP_image();
			
			%>
			<form>
				<table width="90%" cellspacing="0" cellpadding="0" border="0" align="center">
					<tr>
			<td class="td_default" width="80">
			
			<input type="checkbox"
				name="check" id="check81" class="check" value="81"></td>
			<td class="td_default" width="80"><%=cart_id %></td>
			<td class="td_default" width="80"><img
				src="images/p_image/<%=p_image %>.png" border="0" align="center"
				width="80" /></td>
			<td class="td_default" width="300" style='padding-left: 30px'>
			<%=p_name %></td>
			<td class="td_default" align="center" width="110">
			<%=p_selling_price %>
			</td>
			<td class="td_default" align="center" width="90"><input
				class="input_default" type="text" name="cartAmount"
				id="cartAmount" style="text-align: right" maxlength="3"
				size="2" value="<%=p_amount%>"></input></td>
			<td><input type="button" value="수정"
				onclick="amountUpdate('81')" /></td>
			<td class="td_default" align="center" width="80"
				style='padding-left: 5px'><span id="sum81">
				<%= p_selling_price*p_amount %>
				</span></td>
			<td><input type="button" value="주문"
				onclick="order('81','a')"></td>
			<td class="td_default" align="center" width="30"
				style='padding-left: 10px'><input type="button" value="삭제"
				onclick="delCart('81')"></td>
			<td height="10"></td>
		</tr>
				
		<%}%>
		</table>
		</form>
			<tr>
		<td colspan="10">
			<hr size="1" color="CCCCCC">
		</td>
	</tr>
	<tr>
		<td height="30">
	</tr>

	<tr>
		<td align="center" colspan="5"><a class="a_black"
			href="javascript:orderAllConfirm(myForm)"> 전체 주문하기 </a>&nbsp;&nbsp;&nbsp;&nbsp; 
			<a class="a_black" href="javascript:delAllCart(myForm)"> 전체 삭제하기 </a>&nbsp;&nbsp;&nbsp;&nbsp;
			<a class="a_black" href="index.jsp"> 계속 쇼핑하기 </a>&nbsp;&nbsp;&nbsp;&nbsp;
		</td>
	</tr>
	<tr>
		<td height="20">
	</tr>

</table>
		<%}%>
		