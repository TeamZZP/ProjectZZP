<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.dto.ImagesDTO"%>
<%@page import="com.dto.CategoryProductDTO"%>
<%@page import="com.dto.CategoryDTO"%>
<%@page import="com.dto.PageDTO"%>
<%@page import="com.dto.ProductDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.dto.MemberDTO"%>


<style>
.container {
	padding-right: 15px;
	padding-left: 15px;
	margin-right: auto;
	margin-left: auto;
}

a {
	color: #646464;
	text-decoration: none;
}

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
<script>
var productLike = 0;

function productChoice(n) {
      console.log(n);
 <%
 	MemberDTO mdto = (MemberDTO) session.getAttribute("login");
	if (mdto != null) {%>

      var userid =  '<%=mdto.getUserid()%>';

		$.ajax({

			type : "get",
			url : "ProductLikeServlet",
			data : {
				"p_id" : n,
				"userid" : userid
			},
			dataType : "text",
			success : function(data) {
				
				alert(data);
				var like_img = '';
				if (data.likecheck == 0) {
					like_img = "images/like.png";
				} else {
					like_img = "images/liked.png";
				}
				$("#like_img" + n).attr('src', like_img);
				console.log("성공");
			},
			error : function(xhr, status, error) {
				alert(error);
			}

		}); //end ajax
<%} else {%>
	alert("로그인이 필요합니다.");
		location.href = "LoginUIServlet";
		event.preventDefault();
<%}%>

	}
	
	$(function() {
		
		//정렬 기준 선택시 form 제출
		$("#sortBy").on("change", function () {
			$("#prodForm").submit();
		});
		
		
		
		$("button[name=up]").on("click", function() {
			var p_id = $(this).attr("data-p_id");
			console.log(p_id +" up클릭");
			
			//input태그 수량변화
			var quantity = parseInt($("#quantity"+p_id).val());
			$("#quantity"+p_id).val(parseInt(quantity) + 1);

			var price = parseInt($("#price"+p_id).val());
			
			$("#total"+p_id).text((quantity+1)*price);
			//총합 구하기
		})//end up

		$("button[name=down]").on("click", function() {
			var p_id = $(this).attr("data-p_id");
			console.log(p_id +" down클릭");
			
			//input태그 수량변화
			var quantity = parseInt($("#quantity"+p_id).val());
			
			if(quantity !=1){
			$("#quantity"+p_id).val(parseInt(quantity) - 1);

			var price = parseInt($("#price"+p_id).val());
			
			$("#total"+p_id).text((quantity-1)*price);
			
			}
			
			
		})//end down
		
		
	})
</script>
<form action="" id="prodForm">	
<%
PageDTO pDTO=(PageDTO) request.getAttribute("pDTO");
String searchName=(String) request.getAttribute("searchName");
String searchValue=(String) request.getAttribute("searchValue");
String sortBy=(String) request.getAttribute("sortBy");

List<CategoryProductDTO> pDTO_list = pDTO.getList();

List<CategoryProductDTO> product_list = (List<CategoryProductDTO>) request.getAttribute("product_list");
%>
	
<div id="categoryProductContainer" class="container ">
	<div class="row " align="center">
		<div class="row">
		  <div class="col">
      	  		<div class="float-end">
			  	  <!-- 정렬 -->
				  <select class="form-select sortBy" name="sortBy" id="sortBy" data-style="btn-info" 
				  		  style="width: 145px; margin-left: -24px; display: inline;">
					    <option value="p_id" selected>정렬</option>
					    <option value="p_id" <% if("p_id".equals(sortBy)){%>selected<%}%>>최신상품순</option>
					    <option value="p_selling_price" <% if("p_selling_price".equals(sortBy)){%>selected<%}%>>판매가순</option>
					    <option value="p_name" <% if("p_name".equals(sortBy)){%>selected<%}%>>상품명순</option>
				  </select>
			  </div>
	    	</div>
		</div>
		

		<%
		for (int i = 0; i < pDTO_list.size(); i++) {
			
			
			
			int p_id = pDTO_list.get(i).getP_id();
			String p_name = pDTO_list.get(i).getP_name();
			String p_content = pDTO_list.get(i).getP_content();
			int c_id = pDTO_list.get(i).getC_id();
			int p_cost_price = pDTO_list.get(i).getP_cost_price();
			int p_selling_price = pDTO_list.get(i).getP_selling_price();
			int p_discount = pDTO_list.get(i).getP_discount();
			String p_created = pDTO_list.get(i).getP_created();
			int p_stock = pDTO_list.get(i).getP_stock();
			String userid = pDTO_list.get(i).getUserid();
			String p_image = pDTO_list.get(i).getP_image();
			
			
			int likecheck = 0;
			
			if (mdto != null) {
				List<Integer> likecheckList = (List<Integer>) request.getAttribute("likecheck");
				likecheck = likecheckList.get(i);
			} else {
				likecheck = 0;
			}
		%>


		<div class="col-lg-3 col-md-4 col-sm-6">
			<div class="hover-zoomin">
				<a href="ProductRetrieveServlet?p_id=<%=p_id%>"> <img
					src="images/p_image/<%=p_image%> "></a>
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

					<%
					if (likecheck == 1) {
					%> <img id="like_img<%=p_id%>"
					src="images/liked.png" width="30" height="30" class="liked">
					<%
					} else {
					%> <img id="like_img<%=p_id%>" src="images/like.png"
					width="30" height="30" class="liked"> 
					
					<% } %>

				</a>

				<!-- 장바구니 모달창-->
				<!-- Button trigger modal -->
				<button type="button" class="btn" data-bs-toggle="modal"
					data-bs-target="#addcart<%=p_id%>">
					<img src="images/cart.png" width="25" height="25">
				</button>

				<div class="black_bg"></div>
				<!-- Modal -->
				<form action="addCartServlet">
					<input type="hidden" name="p_id" value="<%=p_id%>"> <input
						type="hidden" name="p_image" value="<%=p_image%>"> <input
						type="hidden" name="p_name" value="<%=p_name%>">

					<div class="modal fade" id="addcart<%=p_id%>"
						data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
						aria-labelledby="staticBackdropLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header" id="header">
									<h5 class="modal-title" id="cart_title"
										style="text-align: center">
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
														<input name="p_amount" id="quantity<%=p_id %>" value="1" style="text-align: center; ">
														<button type="button" class="btn btn-outline-success"
															id="up<%=p_id %>" name="up" data-p_id="<%=p_id %>" >+</button>
														<button type="button" class="btn btn-outline-success"
															id="down<%=p_id %>"  name="down"  data-p_id="<%=p_id %>" >-</button>
															<br> <input type="hidden" id="price<%=p_id %>" name="p_selling_price" value="<%=p_selling_price%>">
														<a>총 상품금액 : </a><span id="total<%=p_id %>"><%=p_selling_price%></span>원
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
		

			<!-- 페이징 -->
	 <div class="p-2 text-center">
	<%
		int curPage = pDTO.getCurPage();
		int perPage = pDTO.getPerPage();
		int totalCount = pDTO.getTotalCount();
		int totalPage = totalCount/perPage;
		if(totalCount%perPage!=0) totalPage++;
		for(int p=1; p<=totalPage; p++){
			if(p==curPage){
				out.print("<b>"+p+"</b>&nbsp;&nbsp;");
			} else {
				out.print("<a id='search' href='StoreServlet?curPage="+p
	    				+"&searchName="+searchName+"&searchValue="+searchValue
	    				+"&sortBy="+sortBy+"&category=product'>"+p+"</a>&nbsp;&nbsp;");
			}
		} 
	%>
	</div>
	</div>
</div>
</form>