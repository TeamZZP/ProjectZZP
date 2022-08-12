<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.dto.ImagesDTO" %>
    <%@page import="com.dto.CategoryProductDTO" %>
    <%@page import="com.dto.CategoryDTO" %>
    <%@page import="com.dto.PageDTO" %>
    <%@page import="com.dto.ProductDTO" %>
    <%@page import="java.util.List" %>
    <%@page import="com.dto.MemberDTO" %>
    
    
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
 
<script type="text/javascript"
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
var productLike = 0;

function productChoice(n) {
      console.log(n);

     
     <%
     
   MemberDTO mdto = (MemberDTO)session.getAttribute("login");
   if(mdto != null){%>

      var userid =  '<%=mdto.getUserid()%>'; 

	 $.ajax({
        
          type: "get",
          url: "ProductLikeServlet",
          data:  {
                "p_id":n ,
                "userid":userid
                },
                dataType : "json",
                success : function(data,status,xhr){
                   //이미지 바뀌는부분
                },error : function (xhr,status,error){
                 console.log(error);
                }


     }); //end ajax

   <%}else{%>
    alert("로그인이 필요합니다.");
    event.preventDefault();
   <%}%>


     } 
   $(function() {
      $("#up").on("click",function(){
         //input태그 수량변화
         var quantity = parseInt($("#quantity").val()); 
         $("#quantity").val(parseInt(quantity)+1);
         
         var price = $("#price").val();
            //총합 구하기
            $("#total").text((quantity+1)*price);
      })//end up
      
      $("#down").on("click",function(){
         var quantity = parseInt($("#quantity").val()); 
         
         if(quantity != 1){
            $("#quantity").val(parseInt(quantity)-1);
            var price = $("#price").val();
            $("#total").text((quantity-1)*price);
			}
		})//end down
		
		$("#cart").on("click",function(){
			
		})//
		
	})//
        
</script>

  <div class="container ">
     <div class="row">
       <h1 class="display=3" align="center" style="font-family: 'GulimChe' ">. </h1>
      </div>
      
     <% List<CategoryProductDTO> product_list = (List<CategoryProductDTO>)request.getAttribute("product_list"); 

     %>
   


 <div id = "categoryProductContainer" class="container" >
		<div class="row" align="center">
				<%
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
				<a href="ProductRetrieveServlet?p_id=<%=p_id%>">
					<img src="images/p_image/<%=p_image%>.png "  class="img-thumbnail" style=" width:300; height:300; "></a> 
				<a href="ProductRetrieveServlet?p_id=<%=p_id%>">
					<a style="margin-bottom:0.3em; font-weight:normal; color:#646464; font-size: 25px;"><%=p_name %></a></a> 
				<p style="color: green; font-size: 20px;"><%=p_selling_price %>원</p>
				<!-- 찜기능  -->
				<a id="productChoice" href="javascript:productChoice(<%=p_id%>)"><img src="images/like.png" width="30" height="30"></a>
				<a><img src="images/bubble.png" width="25" height="22"> </a>
				<!-- 장바구니 모달창-->
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
				      <!--  <button type="button" class="gnb_close_btn"><i class="fa fa-times" aria-hidden="true"></i></button> -->
						<!-- 내용 시작 -->
				      	<div class="cont">
					        <div class="opt_block no-border order_quantity_area" style="height: auto; "> 	
					        <div class="area_tit holder">		
					        <span class="option_title inline-blocked" style="margin-bottom: 7px">수량</span></div> 	
					        <div class="area_count holder">		
					        <div class="option_btn_wrap" style="top:0;"> 			
					        <div class="option_btn_tools" style="float: none;"> 
					        <input id="quantity" value="1" >
							<button type="button" class="btn btn-outline-success" id="up">+</button>
							<button type="button" class="btn btn-outline-success" id="down">-</button><br>	
					        <input type="hidden" id="price" value="<%=p_selling_price%>">
					        <hr>
					        <a>총 상품금액</a><span id="total"><%=p_selling_price%></span>원
					       	</div>		
					        </div> 	
					        </div> 
					        </div>
					       </div>
				      </div>
				      <div class="modal-footer">
				        <a href="" class="shopping">계속쇼핑하기</a>
				        <a href="productCartServlet" id="cart">장바구니저장</a>
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
     