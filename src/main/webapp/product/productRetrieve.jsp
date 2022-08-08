<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.dto.ProductDTO"%>
<%@page import="com.dto.MemberDTO"%>
<%@page import="com.dto.ImagesDTO" %>
<%@page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


  
  
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

$(function() {
	
	$("#up").click(function() {
		
		var count=$("#count").val();
		$("#count").val(parseInt(count)+1);
		
		//수정
	    $("#total").text($("#count").val()* $("#total").text());
		
	});//end up
	
    $("#down").click(function() {
		
    	var count=$("#count").val();
    	
    	if(count>1){
		$("#count").val(parseInt(count)-1);
    	}else{
    		$("#count").val(1);
    	}
    	
    	 $("#total").text($("#count").val()* $("#total").text());
    	
	});//end down
	
	
	
	
	
	
})//end ready

function imageChange(this) {
	
	//수정
	String src2 = this.src;
	
	$("#firstImage").attr(src,src2 )
	
}



</script>


<%

ProductDTO pdto = (ProductDTO)request.getAttribute("ProductRetrieveDTO");

int c_id = pdto.getC_id();
String p_content = pdto.getP_content();
int p_cost_price = pdto.getP_cost_price();
String p_created = pdto.getP_created();
int p_discount = pdto.getP_discount();
int p_id = pdto.getP_id();
String p_name = pdto.getP_name();
int p_selling_price = pdto.getP_selling_price();
int p_stock = pdto.getP_stock();

%>  
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<%
List<ImagesDTO> ilist = (List<ImagesDTO>)request.getAttribute("ImagesRetrieveList");

System.out.println("productRetrieve.jsp에서 파싱한 pdto=="+pdto);
System.out.println("productRetrieve.jsp에서 파싱한 ilist=="+ilist);%>



<html>
<head>


<body>
<form action="#">
<div class="row">
<div class="col-md-1"></div>
<div class="col-md-5">
<table > <!-- 제품사진 -->

<% 
for(int i = 0; i <ilist.size();i++){

	
	String image_route = ilist.get(i).getImage_route();
	int image_rnk = ilist.get(i).getImage_rnk();
	String update_date = ilist.get(i).getUpdate_date();
%>

<% if(image_rnk ==1){%> 
<tr>
<td colspan="4">
<img id="firstImage" src="images/p_image/<%= ilist.get(i).getImage_route()%>.png" class="img-thumbnail" style="height: 500; width: 600;"></td>
</tr>
<%}%>

<tr>


	
	
	<div class="row">
	<div class="col-md-6">
	<td>
	<%if (image_rnk !=1){%> 
		<img src="images/p_image/<%= ilist.get(i).getImage_route()%>.png" class="img-thumbnail" style="height: 100; width: 100;" onmouseover="imageChange(this)">
	<%}%>
	</td>
	</div>
	</div>
	


</tr>
</table>
<%}%>
</div>	
<div class="col-md-1"></div>
<div class="col-md-5">
<table> <!-- 상품 설명 -->
<tr>
<td>상품명 &nbsp</td>
<td> </td>
<td><%= p_name%></td>
</tr>

<tr>
<td> &nbsp  </td>
</tr>

<tr>
<td>설명 &nbsp</td>
<td> </td>
<td><%= p_content %></td>
</tr>

<tr>
<td> &nbsp  </td>
</tr>

<tr>
<td>가격 &nbsp</td>
<td> </td>
<td><p id="sellingPrice"> <%= p_selling_price%></p>  &nbsp원</td>
</tr>

<tr>
<td> &nbsp  </td>
</tr>

<tr>
<td>배송비 &nbsp</td> 
<td> </td>
<td>3,000원(50,000원 이상 무료배송)
</td>
</tr>

<tr>
<td> &nbsp  </td>
</tr>

<tr>
<td>수량</td> 
<td></td>
<td><input id="count" value="1">
<button type="button" class="btn btn-outline-success" id="up">+</button>
<button type="button" class="btn btn-outline-success" id="down">-</button></td>
</tr>

<tr>
<td> &nbsp  </td>
</tr>

<tr>
<td>총</td> 
<td></td>
<td><a id="total" ><%=p_selling_price%></a> &nbsp원</td>
</tr>

<tr>
<td> &nbsp  </td>
</tr>

<tr>
<td><button type="button" class="btn btn-success">주문하기</button></td>
<td>&nbsp&nbsp&nbsp&nbsp</td>
<td><button type="button" class="btn btn-success">장바구니</button></td>
</tr>

</table>
</div> 
</div>

</body>
</form>

<div class="row">
 <div class="btn-group" role="group" aria-label="Basic example">
<button type="button" class="btn btn-outline-success">제품상세</button>
<button type="button" class="btn btn-outline-success">구매후기</button>
<button type="button" class="btn btn-outline-success">QnA</button>
</div>


</div>
</html>
