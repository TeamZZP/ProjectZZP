<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.dto.MemberDTO"%>
<%@ page import="com.dto.CartDTO"%>
<%@ page import="com.dto.AddressDTO"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.HashMap"%>
<style>
	.imagediv{
		width: 100%;
	}
	.image{
		width: 100%;
		height: auto;
	}
	

	
</style>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		
		var list_size = $("#list_size").val();
		console.log(list_size);	
		$("#ordercount").text(" 총"+list_size+"개"); 
		
		
		$("#AddOrder").on("click", function() {
			$("form").attr("action", "AddOrderServlet");
		});

		$("#delivery_loc").on("change", function() {
			console.log($("#delivery_loc").val());
		});
	
		
	});
</script>
<div class="container">
	<div class="row">
		<div class="imagediv" style="text-align: center;">
				<img class="image" src="images/ordering.png" width="900">
		</div>
		<%
			int Last_sum_money = 0;
			int Last_total = 0;
			int total_price = 0;
			int sum_money = 0;
			int fee = 0;
			int total = 0;
			%>
		<form action="AddOrderServlet" method="post">
			 <table style=" border-collapse: collapse;" class="table">
					<h4 style="font-weight: bold; display:inline-block;">주문상품 정보</h4>
					
					<span style="float : right; font-weight: bold;"><span  id=total2 style="font-size:20px;  color: green;"></span>원</span>
					<span style="float : right; padding-right:10px; font-weight: bold;" id="ordercount"></span>
					<tr style="border-top-width: 5px; border-color: black;">
						<th scope="col">상품정보</th>
						<th scope="col"></th>
						<th scope="col" >수량</th>
						<th scope="col">상품가격</th>
					</tr>
					
				<%
				MemberDTO member = (MemberDTO) session.getAttribute("login");
					String email1=member.getEmail1();
					String email2=member.getEmail2();
				
				List<CartDTO> list = (List<CartDTO>) request.getAttribute("list");
				System.out.println(">>orderServet " + list);
				int list_size = list.size();
			
				
				for (int i = 0; i < list.size(); i++) {
					
					String userid = list.get(i).getUserid();
					int p_id = list.get(i).getP_id();
					String p_name = list.get(i).getP_name();
					int p_selling_price = list.get(i).getP_selling_price();
					String p_image = list.get(i).getP_image();
					int p_amount = list.get(i).getP_amount();
					//배송정보
					sum_money = p_selling_price*p_amount;
					Last_sum_money += sum_money;
					fee =  Last_sum_money >= 50000? 0: 3000;	
					total = sum_money+fee;
				 	
					
				%>	
					
					
					<tr class="order_content">
						<!-- 이미지사진  -->
						<td >
						<img src="images/p_image/<%=p_image%>" width="100" style="border: 10px;" height="100"></td>
							<!-- 상품명  -->
							<td style="line-height: 100px;">
							<span name="p_name" style="font-weight: bold; margin: 8px; display: line " ><%=p_name%></span></td>
							<!-- 수량  -->
							<td style="line-height: 100px;">
							<span id="cartAmount"  name="p_amount"
							 style=" font-weight: bold; font-size: 20px; vertical-align: middele; "><%=p_amount%>개</span></td>
							<!-- 개별 총 가격 -->
						<td style="line-height: 100px;"><span id="item_price"
							name="item_price" style="font-weight: bold; font-size: 20px; "
							class="item_price"><%=p_selling_price * p_amount%>원</span></td>	
					</tr>
					<% } %>
				</table>
						<%
				
						Last_total = Last_sum_money+fee;	
				/* 기본 배송지 출력  */
				AddressDTO address = (AddressDTO) request.getAttribute("address");
				
						int address_id=address.getAddress_id();
						String address_name=address.getAddress_name();
						String receiver_name=address.getReceiver_name();
						String receiver_phone=address.getReceiver_phone();
						String post_num=address.getPost_num();
						String addr1=address.getAddr1();
						String addr2=address.getAddr2();
						
				
				%>	
				<table style=" border-collapse: collapse; border-bottom: #ffffff" class="table" >
					<tr class="delivery" style="border-bottom-width: 5px; border-color: black;">
					<th colspan="4" style="font-size:20px; font-weight: bold;">배송 정보</th>
					</tr>
	
					<tr >
					   <th style="padding-left: 50px;">받는 분</th>
					   <td  style="width: 300px;"><input type="text" class="form-control" name="receiver_name" id="receiver_name" 
								 value="<%=receiver_name %>"  placeholder="이름을 입력하세요" /></td>
					    <td style="width: 300px;"></td>
					    <td style="width: 300px;"></td>
					</tr>
					<tr>
					   <th style="padding-left: 50px;">이메일</th>
					   <td ><input type="text" name="email1" id="email1"  value="<%= email1 %>" class="form-control"></td>
					   <td><div class="input-group">
									<div class="input-group-text">@</div>
									<input type="text" name="email2"  placeholder="직접입력" id="email2" class="form-control" value="<%= email2 %>">
								</div></td>
					   <td ><label class="visually-hidden" for="autoSizingSelect">Preference</label>
									<select id="emailSel" class="form-select" aria-label="Default select example">
										<option value="" selected disabled hidden>이메일 선택</option>
										<option value="daum.net">daum.net</option>
										<option value="naver.com">naver.com</option>
										<option value="google.com">google.com</option>
									</select></td> 
					</tr>
					<tr>
					   <th style="padding-left: 50px;">휴대전화</th>
					   <td><input type="text" class="form-control" value="<%=receiver_phone %>" name="receiver_phone" id="receiver_phone" placeholder="- 없이 입력하세요" /></td>
					    <td></td>
					</tr>
					<tr>
					   <th rowspan="2" style="padding-left: 50px;">주소</th>
					   <td> <div class="input-group">
                                 <span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
                                 <input type="text" name="post_num" id="sample4_postcode" value="<%=post_num %>" placeholder="우편번호" class="form-control">
								 <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" class=" btn btn-outline-success"><br>
                            </div></td>
					    <td></td>
					</tr>
					<tr>
					 <td>
                      	<input type="text" name="addr1" id="sample4_roadAddress" placeholder="도로명주소" class="form-control" value="<%= addr1 %>"></td>
                      <td><input type="text" name="addr2" id="sample4_jibunAddress" placeholder="지번주소" class="form-control" value="<%= addr2 %>">
								<span id="guide" style="color:#999"></span></td>
					</tr>
					<tr>
					   <th style="padding-left: 50px;">배송시요청사항</th>
					   <td><select id="delivery_loc" name="delivery_loc">
											<option value="frontDoor">문앞</option>
											<option value="directly_or_frontDoor">직접받고 부재 시 문앞</option>
											<option value="security">경비실</option>
											<option value="delievery_box">택배함</option>
									</select> </td>
					    <td></td>
					</tr>
					<tr style="border-bottom-width: 3px; border-color: black;"></tr>
					</table>
					<!--  결제정보 
					<tr style="border-bottom-width: 5px; border-color: black;">
					<th style="font-size:20px; font-weight: bold;">결제 정보</th>
					</tr>
					<tr>
					   <td>카드결제</td>	
					   <td></td>
					    <td></td>
					</tr>
					<tr>
					   <td>가상계좌</td>
					   <td></td>
					    <td></td>
					</tr>
					<tr>
					   <td>계좌이체</td>
					   <td></td>
					    <td></td>
					</tr>
						 -->
					<!-- 총 주문금액 -->
					
				<div>
					<input type="hidden" id="list_size" value="<%=list_size%>">
					<input type="hidden" id="Last_sum_money" name="Last_sum_money" value="<%=Last_sum_money%>">
					<input type="hidden" id="fee" name="fee" value="<%=fee%>">
					<input type="hidden" id="Last_total" name="Last_total" value="<%=Last_total%>">
				
					
					
					<div style="float: right; padding-right:100px; ">
						<span></span>
						<span ><%=Last_sum_money%>원</span>
						<p><%=fee%>원</p>
						<hr>
						<p style="color: green; font-weight: bold;"><span ><%=Last_total%></span>원</p>
					</div> 
					
						<div style="font-weight:bold; padding-left:100px; float: right;" >
						<span>주문금액</span>
						<p>배송비</p>
						<hr>
						<p>총결제금액 &nbsp;</p>
						</div>
				
					<div style="float: right;"><span  style="font-size:20px; font-weight: bold;">총 주문금액</span></div>
					
			</div>
		<div class="form-group" style="margin-top: 150px; text-align: center;">
			  <input type="submit" value="결제하기" id="addOrder" class="btn btn-success">  
              <input type="button" onclick="javascript:history.back();" value="취소" class="btn">
       </div>
       	</form>
		 </div> 
	</div>
<script type="text/javascript"
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(function() {
		
		var Last_total = $("#Last_sum_money").val();
		var fee =  $("#fee").val();
		var Last_total =  $("#Last_total").val();
		
		$("#total2").text(Last_total);
		console.log(Last_total+" "+fee+" "+Last_total);
		
		$("form").on("submit", function() {
			var receiver_name=$("#receiver_name").val();
			var email1 = $("#email1").val();
			var email2 = $("#email2").val();
			var receiver_phone=$("#receiver_phone").val();
			
		/* 	var address_name=$("#inputAddressName").val(); */
		
			
			var post_num=$("#sample4_postcode").val();
			var addr1=$("#sample4_roadAddress").val();
			var addr2=$("#sample4_jibunAddress").val();
			var numChk = /^[0-9]*.{11}$/;
			//var check=$("#gridCheck").val();
			
			if (receiver_name=="" || receiver_phone=="" ||
					post_num=="" || addr1=="" || addr2=="") {//공백 불가
				alert("배송지 정보를 입력해주세요.");
				event.preventDefault();
			} else if (receiver_phone != "" && !numChk.test(receiver_phone)) {//연락처는 숫자 11자리만 가능
				alert("연락처를 형식에 맞게 입력해주세요.");
				$("#receiver_phone").val("");
				$("#receiver_phone").focus();
				event.preventDefault();
			} else if (receiver_name.length > 3){
				alert("수령인은 3글자 이내로 입력해주세요.");
				$("#receiver_name").val("");
				$("#receiver_name").focus();	
				event.preventDefault();
			} 
		});//end submit
		
		
	})//end 
</script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample4_roadAddress').value = fullRoadAddr;
                document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
</script>