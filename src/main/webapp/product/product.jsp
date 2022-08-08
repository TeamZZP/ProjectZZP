<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.dto.ImagesDTO" %>
    <%@page import="com.dto.CategoryProductDTO" %>
    <%@page import="com.dto.CategoryDTO" %>
    <%@page import="java.util.List" %>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  
  <style>
  .container {
  padding-right: 15px;
  padding-left: 15px;
  margin-right: auto;
  margin-left: auto;
}

a{
	color : #646464;
	text-decoration: none;
	
}


</style>


  <div class="container ">
 		<h1 class="display=3" align="center">상품 목록</h1>
		</div>
	    <%
    
    //List<ImagesDTO> ilist = (List<ImagesDTO>)request.getAttribute("ImagesList");
    List<CategoryProductDTO> plist = (List<CategoryProductDTO>)request.getAttribute("productList");
   	

   // System.out.println("product/product.jsp에서 getAttribute한 ImagesDTO list==="+ilist);
   // System.out.println("product/product.jsp에서 getAttribute한 ProductDTO list==="+plist);
    
  %>
	<div class=container >
		<div class="row" align="center">
				<%
				 for ( int i = 0 ; i < plist.size() ; i++ ) {
					   
					    int p_id = plist.get(i).getP_id();
					    String p_name =plist.get(i).getP_name();
						String p_content =plist.get(i).getP_content();
						int c_id =plist.get(i).getC_id();
						int p_cost_price =plist.get(i).getP_cost_price();
						int p_selling_price =plist.get(i).getP_selling_price();
						int p_discount =plist.get(i).getP_discount();
						String p_created=plist.get(i).getP_created();
						int p_stock =plist.get(i).getP_stock();
						String userid =plist.get(i).getUserid();
						String p_image = plist.get(i).getP_image();
					%>
			<div class="col-md-3">
				<a href="ProductRetrieveServlet?p_id=<%=p_id%>">
					<img src="images/p_image/<%=p_image%>.png "  class="img-thumbnail" style=" width:300; height:300; "></a> 
				<a href="ProductRetrieveServlet?p_id=<%=p_id%>">
					<h2 style="margin-bottom:0.3em; font-weight:normal; color:#646464; font-size: 25px; display: "><%=p_name %></h2></a> 
				<p style="color: green; font-size: 20px;"><%=p_selling_price %>원</p>
				<a><img src="images/like.png" width="30" height="30"></a>
				<a><img src="images/bubble.png" width="25" height="22"> </a>
				<a><img src="images/cart.jpg" width="25" height="25"></a>
				<!-- Button trigger modal -->
				 <a type="button" class="btn " data-bs-toggle="modal" data-bs-target="#staticBackdrop">
				 	<img src="images/cart.jpg" width="25" height="25"></a>
				<!-- Modal -->
				<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
				  <div class="modal-dialog modal-dialog-scrollable">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="staticBackdropLabel">장바구니</h5>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
				      <div class="modal-body">
				       <button type="button" class="gnb_close_btn"><i class="fa fa-times" aria-hidden="true"></i></button>
						<!-- 내용 시작 -->
				      	<div class="cont">
					        <p>선택하신 상품이 장바구니에 담겼습니다.</p>
					       </div>
				      </div>
				      <div class="modal-footer">
				        <a href="<?php echo G5_SHOP_URL; ?>/list.php?ca_id=<?php echo $it['ca_id']; ?>" class="shopping">계속쇼핑하기</a>
				        <a href="<?php echo G5_SHOP_URL; ?>/cart.php" class="carting">장바구니보기</a>
				      </div>
				    </div>
				  </div>
				</div>
								
							</div>
			<%
				}
			%>	
		</div>
  </div>
