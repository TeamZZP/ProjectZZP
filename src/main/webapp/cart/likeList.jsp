
<%@ page import="com.dto.CartDTO"%>
<%@ page import="com.dto.product_likedDTO"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

	 .hover-zoomin a {
      display: block;
      position: relative;
      overflow: hidden;
      border-radius: 15px;
    }
    .hover-zoomin img {
      width: 250px;
      height: 250px;
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
	$(function() {

	})//end
</script>
<div id="outer">
	<div
		style="text-align: center; display: flex; justify-content: center; height: 100px; margin-bottom: 10px;">
		<img src="images/like2.png">
	</div>
</div>
<%
int cartCount = (int) request.getAttribute("cartCount");
int likeCount = (int) request.getAttribute("likeCount");
%>
<div class="container">
	<div class="row"  align="center">
		<div class="btn-group" role="group" aria-label="Basic example">

			<button type="button" class="btn btn-outline-success" id="cart"
				onclick="location.href='CartListServlet';">
				<input type="checkbox" name="allCheck" id="allCheck"> 장바구니(<%=cartCount%>)
			</button>
			<button type="button" class="btn btn-outline-success" id="like">
				<input type="checkbox" name="allCheck" id="allCheck">찜한상품(<%=likeCount%>)
			</button>
		</div>
		<%
		request.setCharacterEncoding("utf-8");

		List<product_likedDTO> list = (List<product_likedDTO>) request.getAttribute("list");
		if (list.size() == 0) {
		%>
		<div>
			<div class="no_item_cart"
				style="text-align: center; padding: 50px; line-height: 70px;">
				<img src="images/liked.png" width="150" height="150"><br>
				<span>찜한 상품이 없습니다.</span>
				<div>
					<button type="button" onclick="location.href='StoreServlet';"
						class="btn btn-success">상품보러가기</button>
				</div>
			</div>
		</div>

		<%
		}

		for (int i = 0; i < list.size(); i++) {
		String userid = list.get(i).getUserid();
		int p_id = list.get(i).getP_id();
		String p_name = list.get(i).getP_name();
		int p_selling_price = list.get(i).getP_selling_price();
		String p_image = list.get(i).getP_image();
		%>

		<div class="col-lg-3 col-md-4 col-sm-6">
			<div class="p-3">
				<div class="hover-zoomin">
					<a href="ProductRetrieveServlet?p_id=<%=p_id%>"> 
					<img src="images/p_image/<%=p_image%>" width="200" height="200"></a>
				</div>
			</div>
			<div>
				<a href="ProductRetrieveServlet?p_id=<%=p_id%>"> <span
					style="margin-bottom: 0.3em; font-weight: normal; color: #646464; font-size: 25px;"><%=p_name%></span></a>
			</div>
			<div>
				<p style="color: green; font-size: 20px;"><%=p_selling_price%>원
				</p>
			</div>
		</div>

		<%
		}
		%>
	</div>
</div>
