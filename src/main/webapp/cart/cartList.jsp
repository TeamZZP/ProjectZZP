<%@ page import="com.dto.CartDTO"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<style>
.heading {
   flex: 1;
   text-align: center;
}

a {
   color: black;
   text-decoration: none;
}

a:hover {
   color: black;
}

.cart_content {
   padding: 0 19px;
}

.cart_list li {
   display: flex;
   position: relative;
   padding: 24px;
   border-bottom: 5px solid green;
}

.cart_list li :frist-child {
   border-top: 5px solid green;
}

.cart_list li :last-child {
   border-bottom: none;
}

.cart_list li .cart_item_del {
   position: absolute;
   right: 0;
   top: 24;
   opacity: 0.3;
   cursor: pointer;
}

.cart_list li .cart_list_info {
   flex: 1;
   margin: 0px 20px;
}

.cart_list_info span {
   padding: 20px;
}

#cartAmount {
   border: none;
   width: 59px;
   height: 30px;
   border-radius: 4px;
   border: 1px solid #D0D0D0;
   text-align: center;
}

#amountUpdate {
   border: none;
   width: 59px;
   height: 30px;
   line-height: 30px;
   border-radius: 4px;
   border: 1px solid #D0D0D0;
   text-align: center;
}

.cart_total>div {
   display: flex;
   text-align: center;
   justify-content: space-evenly;
}
</style>

<div id="outer">
   <header>
      <div
         style="text-align: center; display: flex; justify-content: center; height: 100px; margin-bottom: 10px;">
         <img src="images/cart2.png">
      </div>
   </header>
</div>

<div class="container">
   <%
   int cartCount = (int) request.getAttribute("cartCount"); 
   int likeCount = (int) request.getAttribute("likeCount"); 
   %>
   <div class="row">
      <div class="btn-group" role="group" aria-label="Basic example">

         <button type="button" class="btn btn-outline-success" id="cart">
            <input type="checkbox" name="allCheck" id="allCheck" checked="checked"   > 장바구니(<%=cartCount%>)
         </button>
         <button type="button" class="btn btn-outline-success" id="like" onclick="location.href='ProductLikeListServlet';">
       <!--   <input type="checkbox" name="allCheck" id="allCheck"> -->찜한상품(<%=likeCount%>)</button>
      </div>
   </div>
   <%
   request.setCharacterEncoding("utf-8");

   List<CartDTO> list = (List<CartDTO>) request.getAttribute("cartList");
   if (list.size() == 0) {
   %>
   <div>
      <div class="no_item_cart" style="text-align: center; padding: 50px; line-height: 70px;"   > 
         <img src="images/cart.png" width="150" height="150" ><br>
         <span >장바구니에 담긴 상품이 없습니다.</span>
         <div>
            <button type="button" onclick="location.href='StoreServlet';"
               class="btn btn-success" >상품보러가기</button>
            <hr>
         </div>
      </div>
   </div>

   <%
   } else {
   Map<String, Integer> map = (Map<String, Integer>) request.getAttribute("map");
   int sum_money = map.get("sum_money");
   int fee = map.get("fee");
   int total = map.get("total");
%>
  <form action="#">
<% 
   for (int i = 0; i < list.size(); i++) {
      int cart_id = list.get(i).getCart_id();
      String userid = list.get(i).getUserid();
      int p_id = list.get(i).getP_id();
      String p_name = list.get(i).getP_name();
      int p_selling_price = list.get(i).getP_selling_price();
      int p_amount = list.get(i).getP_amount();
      String p_image = list.get(i).getP_image();
      
      
      System.out.println("상품명 :" + p_name);
      System.out.println("상품번호 :" + p_id);
   %>

 
      <div class="cart_content">
       <input type="hidden" name="userid" id="userid" value="<%=userid %>">
      	<div class="cart_info_div">
  		<input type="hidden" class="individual_sum_money_input" value="<%=sum_money %>">
         <input type="hidden" class="individual_fee_input" value="<%=fee %>">
		 <input type="hidden" class="individual_total_input" value="<%=total%>">
		 </div>
         <ul class="cart_list" style="line-height: 50px; font-size: 20px;">
            <li>
            <input type="checkbox" name="check" id="check" checked="checked"
               class="individual_cart_checkbox" value="<%=cart_id%>" 
               style="width: 30px; position: relative; bottom: 100px; margin-right: 10px;">
               <a href="ProductRetrieveServlet?p_id=<%=p_id%>"> <img
                  src="images/p_image/<%=p_image%>" width="200"
                  style="border: 10px;" height="200" ></a>
               <div class="cart_list_info">
               
                <input type="hidden" id="p_id" name="p_id" value="<%=p_id%>">
               
                  주문번호: <span name="cart_id"><%=cart_id%></span><br> 상품명: <a
                     href="ProductRetrieveServlet?p_id=<%=p_id%>"> <span
                     name="p_name"
                     style="font-weight: bold; margin: 8px; display: line"><%=p_name%></span></a>
                  <br>
                  <div class="amount">
                     <label>수량:</label> <input type="text" id="cartAmount<%=cart_id%>"
                        class="p_amount" name="p_amount"
                        style="text-align: right; line-height: 0px;" maxlength="3"
                        size="2" value="<%=p_amount%>"> <input type="button"
                        value="변경" id="updBtn" class="updBtn" style="line-height: 28px;"
                        data-xxx="<%=cart_id%>" data-price="<%=p_selling_price%>"
                        data-id="<%=userid%>" data-sum_money="<%=sum_money%>" /> <br>
                  </div>
                  상품가격 :<span id="item_price<%=cart_id%>"
                     style="margin-bottom: 15px;" class="item_price" ><%=p_selling_price * p_amount%></span><br>
               </div> <span class="cart_item_del"> <img src="images/delete.png"
                  width="20" height="20" class="delBtn" data-xxx="<%=cart_id%>"></span>
            </li>
         </ul>
      </div>
      <%
      }
      %>

      <div class="cart_total">
  
         <div class="shipping">
            <p>상품금액</p>
            <p>배송비</p>
            <p>총주문금액</p>
         </div>
         <div class="cart_info_div">
            <span class="price" id="sum_money"><%=sum_money%></span> <span
               class="price" id="fee"><%=fee%></span> <span class="price"
               id="total"><%=total%></span>
         </div>
      </div>
      <div style="float: right;" >
         <input type="submit" class="btn btn-success" id="order" value="주문하기">
         <input type="submit" class="btn btn-success" id="delAllCart"
            value="상품삭제">
      </div>

      <%
      }
      %>
   </form>
</div>
<script type="text/javascript"
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
 		  
	 
	$(function() {
		
		 //주문 버튼
		  $("#order").on("click", function() {
	      
	      $("form").attr("action", "OrderServlet");
	   })//order

		//체크박스 미선택시 alert창
		$("#delAllCart").on("click", function() {
			if ($(".individual_cart_checkbox").is(":checked") == false) {
				alert("삭제할 상품을 선택하세요.");
				event.preventDefault();
			}
			$("form").attr("action", "CartDelAllServlet");
		})//체크박스미선택
	
		//전체선택
	 	$("#allCheck").on("click", function() {
			console.log("click====");
			if ($(this).is(":checked")) {
				$("input[name=check]").prop("checked", true);//체크박스 전체 선택
				
				var sum_money = $("#sum_money").text();//현재 장바구니 상품 금액
				console.log("장바구니 금액 : "+sum_money);
				
				//체크박스 전체 가격 데이터 더한 값==text()
				$("input[name=check]").each(function (index, data) {
					var cart_id=$(this).val();
					console.log(cart_id);
					var item_price = $("#item_price" + cart_id).text();//상품 가격
					console.log("상품 가격 : "+item_price);
					
					sum_money =  parseInt(sum_money) + parseInt(item_price);//장바구니에 상품 가격 추가
					console.log("최종 장바구니 가격 : "+sum_money);
					
					$("#sum_money").text(sum_money);
					var fee = sum_money >= 50000 ? 0 : 3000;
					var total = sum_money + fee;
					$("#fee").text(fee);
					$("#total").text(total);
				});
			} else {
				$("input[name=check]").prop("checked", false);//체크박스 전체 선택 해제
				
				var sum_money = $("#sum_money").text();//현재 장바구니 상품 금액
				console.log("장바구니 금액 : "+sum_money);
				
				//체크박스 전체 가격 데이터 뺀 값==text()
				$("input[name=check]").each(function (index, data) {
					var cart_id=$(this).val();
					console.log(cart_id);
					var item_price = $("#item_price" + cart_id).text();//상품 가격
					console.log("상품 가격 : "+item_price);
					
					sum_money =  parseInt(sum_money) - parseInt(item_price);//장바구니에서 상품 가격 빼기
				});
				console.log("최종 장바구니 가격 : "+sum_money);
				
				$("#sum_money").text(sum_money);
				var fee = sum_money >= 50000 ? 0 : 3000;
				var total = sum_money + fee;
				$("#fee").text(fee);
				$("#total").text(total);
			}
		})//end fn
		
		//전체선택 안됐을 경우 체크 해제
		$("input[name=check]").click(function() {
			var total = $("input[name=check]").length;
			var checked = $("input[name=check]:checked").length;
	
			if(total != checked) $("#allCheck").prop("checked", false);
			else $("#allCheck").prop("checked", true); 
		});
		
		//개별체크박스 선택시 가격 변동
		$(".individual_cart_checkbox").on("click",function(){
			var n = $(this).val();
			console.log("체크박스의 카트 아이디 : "+n);

			var cart_id = $(this).attr("data-xxx");//cart_id
			var p_amount = $("#cartAmount" + cart_id).val();//수량
			console.log("수량 : "+p_amount);//undefined
			var sum_money = $("#sum_money").text();//현재 장바구니 상품 금액
			console.log("장바구니 금액 : "+sum_money);//
			var item_price = $("#item_price" + n).text();//상품 가격
			console.log("상품 가격 : "+item_price);//

			if($(this).is(":checked")==true){
				console.log("check true");
				console.log("상품 가격 : "+item_price);
				
				sum_money = parseInt(sum_money) + parseInt(item_price);//장바구니에 상품 가격 추가

				var fee = sum_money >= 50000 ? 0 : 3000;
				var total = sum_money + fee;

				$("#sum_money").text(sum_money);
				$("#fee").text(fee);
				$("#total").text(total);
			} else {
				console.log("check false XXX");
				console.log("상품 가격 : "+item_price);
				
				sum_money =  parseInt(sum_money) - parseInt(item_price);//장바구니에서 상품 가격 빼기

				var fee = sum_money >= 50000 ? 0 : 3000;
				var total = sum_money + fee;

				$("#sum_money").text(sum_money);
				$("#fee").text(fee);
				$("#total").text(total);
			}
		})//end individual_cart_checkbox
		
		//폼 제출시 선택된 체크박스 값만 가져오기
		/* $("#order").on("click", function() {
//			var select_obj = "";
			$("input[name=check]:checked").each(function (index, data) {
//				select_obj += ",";
				console.log($(this).val());
//				select_obj += $(this).val();
			});
			console.log("주문 버튼 클릭");
			event.preventDefault();
		});//end fn */

		
      
      //전체선택
        $("#a").on("click", function() {//#allCheck
        var result = this.checked;
        var item_price = "";
         $(".individual_cart_checkbox").each(function(idx, data) {
        	 /* var n = $(this).val(); */
        	 console.log(data);
        	
        	 
        	 item_price = $(".item_price");
        	 
        	 console.log(item_price);
        	$.each(item_price,function(idx,data){
        		console.log(data.innerText);
        		
        		var chk =data.innerText+",";
        		console.log(chk);
        		
        	})
            data.checked = result;
         })
         
       })//end allcheck  
      
		//개별 삭제
		$(".delBtn").on("click", function() {
			var cart_id = $(this).attr("data-xxx");
			location.href = "CartDelServlet?cart_id=" + cart_id;
		})//end
		
		//장바구니 수량 수정
		$(".updBtn").on("click", function() {
			var cart_id = $(this).attr("data-xxx"); //cart_id
			var p_selling_price = $(this).attr("data-price");
			var p_amount = $("#cartAmount" + cart_id).val();
			var sum_money = $(this).attr("data-sum_money"); //총금액
			
			console.log(cart_id, p_selling_price, p_amount, sum_money)
			
			var userid = $(this).attr("data-id");

			$.ajax({
				type : "get",
				url : "CartUpdateServlet",
				data : {
					cart_id : cart_id,
					p_amount : p_amount,
					sum_money : sum_money
				},
				dataType : "text",
				success : function(data, status, xhr) {
					var sum = p_amount * p_selling_price;
					$("#item_price" + cart_id).text(sum);

					sum_money = parseInt(data);
					var fee = sum_money >= 50000 ? 0 : 3000;
					var total = sum_money + fee;

					$("#sum_money").text(sum_money);
					$("#fee").text(fee);
					$("#total").text(total);
				},
				error : function(xhr, status, error) {
					console.log(error);
				}
			}) // end ajax
		})//end updBtn
   })//end
</script>
