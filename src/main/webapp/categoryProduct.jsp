<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.dto.ImagesDTO" %>
    <%@page import="com.dto.CategoryProductDTO" %>
    <%@page import="com.dto.CategoryDTO" %>
    <%@page import="com.dto.PageDTO" %>
    <%@page import="com.dto.ProductDTO" %>
    <%@page import="java.util.List" %>
    <%@page import="com.dto.MemberDTO" %>
  <style>
  .hover-zoomin a {
      display: block;
      position: relative;
      overflow: hidden;
      border-radius: 15px;
    }
    .hover-zoomin img {
      width: 300px;
      height: 300px;
      -webkit-transition: all 0.2s ease-in-out;
      -moz-transition: all 0.2s ease-in-out;
      -o-transition: all 0.2s ease-in-out;
      -ms-transition: all 0.2s ease-in-out;
      transition: all 0.2s ease-in-out;
    }
    .hover-zoomin:hover img {
      -webkit-transform: scale(1.1);
      -moz-transform: scale(1.1);
      -o-transform: scale(1.1);
      -ms-transform: scale(1.1);
      transform: scale(1.1);
    } 
  
  </style>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">    
	$(function(){
		
	})//end function
</script>
    <div class="row" align="center">
				<%
				 List<CategoryProductDTO> product_list = (List<CategoryProductDTO>)request.getAttribute("product_list"); 
				
				
				 for ( int i = 0 ; i < product_list.size() ; i++ ) {
					   
					    int p_id = product_list.get(i).getP_id();
					    String p_name =product_list.get(i).getP_name();
						String p_content =product_list.get(i).getP_content();
						int c_id =product_list.get(i).getC_id();
						int p_cost_price =product_list.get(i).getP_cost_price();
						int p_selling_price =product_list.get(i).getP_selling_price();
						int p_discount =product_list.get(i).getP_discount();
						String p_created=product_list.get(i).getP_created();
						int p_stock =product_list.get(i).getP_stock();
						String userid =product_list.get(i).getUserid();
						String p_image = product_list.get(i).getP_image();
					%>
	<div class="col-lg-3 col-md-4 col-sm-6">
			<div class="hover-zoomin">
				<a href="ProductRetrieveServlet?p_id=<%=p_id%>"> <img
					src="images/p_image/<%=p_image%>"></a>
			</div>
			<div class="p-2 text-center">
				<a href="ProductRetrieveServlet?p_id=<%=p_id%>"> <span
					style="margin-bottom: 0.3em; font-weight: normal; color: #646464; font-size: 25px;"><%=p_name%></span></a>
			</div>
			<div>
				<p style="color: green; font-size: 20px;"><%=p_selling_price%>원
				</p>
			</div>
			<!-- 찜기능  -->
			<div class="p-2 text-center">
				<a id="productChoice" href="javascript:productChoice(<%=p_id%>)">
					<img src="images/like.png" width="30" height="30">
				</a>

				<!-- 장바구니 모달창-->
				<!-- Button trigger modal -->
				<button type="button" class="btn" id="cartimg" data-bs-toggle="modal"
					data-bs-target="#addcart<%=p_id %>">
					<img src="images/cart.png" width="25" height="25">
				</button>
			
				<!-- Modal -->
				<form action="addCartServlet">
					<input type="hidden" name="p_id" value="<%=p_id%>"> <input
						type="hidden" name="p_image" value="<%=p_image%>"> <input
						type="hidden" name="p_name" value="<%=p_name%>">
					
					<div class="modal fade" id="addcart<%=p_id %>" data-bs-backdrop="static"
						data-bs-keyboard="false" tabindex="-1"
						aria-labelledby="staticBackdropLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="cart_title"
										style=" text-align: center">
										<%=p_name%>
									</h5>
									
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">
										<div class="opt_block no-border order_quantity_area"
											style="height: auto;">
											<div class="area_tit holder">
												<span class="option_title inline-blocked"
													style="margin-bottom: 7px">수량</span>
											</div>
											<div class="area_count holder">
												<div class="option_btn_wrap" style="top: 0;">
													<div class="option_btn_tools" style="float: none;">
														<input name="p_amount" id="quantity" value="1" style="text-align: center; ">
														<button type="button" class="btn btn-outline-success"
															id="up">+</button>
														<button type="button" class="btn btn-outline-success"
															id="down">-</button>
															<br> <input type="hidden" id="price" name="p_selling_price" value="<%=p_selling_price%>">
														<a>총 상품금액 : </a><span id="total"><%=p_selling_price%></span>원
													</div>
												</div>
											</div>
										</div>
								</div>
								<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">계속쇼핑하기</button>
								<button type="submit" class="btn btn-success">장바구니저장</button>
							</div>
							</div>
						</div>
					</div>
					</form>
			</div>
		</div>
		<%
		}
		%>
	</div>
