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
	
	.deli tr{
	  border-bottom : none;
	}
</style>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {

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
			HashMap<String, Integer> map = (HashMap<String, Integer>) request.getAttribute("map");
			int sum_money = map.get("sum_money");
			int fee = map.get("fee");
			int total = map.get("total");
			%>
		<form>
			 <table style=" border-collapse: collapse;" class="table">
					<h4 style="font-weight: bold; display:inline-block;">주문상품 정보</h4><span style="float : right; font-weight: bold; "><span style="color: red;"><%=total %></span>원</span>
					<tr style="border-top-width: 5px; border-color: black;">
						<th scope="col">상품정보</th>
						<th scope="col"></th>
						<th scope="col" >수량</th>
						<th scope="col">상품가격</th>
					</tr>
				<%
				MemberDTO mdto = (MemberDTO) session.getAttribute("login");
				List<CartDTO> list = (List<CartDTO>) request.getAttribute("list");
				System.out.println(">>orderServet " + list);
				int total_price = 0;
				for (int i = 0; i < list.size(); i++) {
					String userid = list.get(i).getUserid();
					int p_id = list.get(i).getP_id();
					String p_name = list.get(i).getP_name();
					int p_selling_price = list.get(i).getP_selling_price();
					String p_image = list.get(i).getP_image();
					int p_amount = list.get(i).getP_amount();
				%>

					<tr class="order_content">
						<!-- 이미지사진  -->
						<td >
						<img src="images/p_image/<%=p_image%>" width="100" styl	="border: 10px;" height="100"></td>
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
				</table>
						<%
				}
				
				List<AddressDTO> add_list = (List<AddressDTO>) request.getAttribute("add_list");

				for (int i = 0; i < add_list.size(); i++) {
					if (add_list.get(i).getDefault_chk() == 1) {

						AddressDTO add_dto = add_list.get(i);
					}
				%>	
				<table style=" border-collapse: collapse; border-bottom: #ffffff" class="table" >
					<tr class="delivery" style="border-bottom-width: 5px; border-color: black;">
					<th colspan="4" style="font-size:20px; font-weight: bold;">배송 정보</th>
					</tr>
				
					<tr >
					   <td>받는 분</td>
					   <td><input type="text" class="form-control" name="username" id="username" 
								  readonly="readonly" value=""  placeholder="이름을 입력하세요" /></td>
					    <td></td>
					    <td></td>
					</tr>
					<tr>
					   <td>이메일</td>
					   <td> <input type="text" name="email1" id="email1" readonly="readonly" value="" class="form-control"></td>
					   <td colspan="2">@<input type="text" name="email2"  placeholder="직접입력"  id="email2" class="form-control"><td>
					    
					</tr>
					<tr>
					   <td >휴대전화</td>
					   <td><input type="text" class="form-control" name="phone" id="phone" placeholder="- 없이 입력하세요" /></td>
					    <td></td>
					</tr>
					<tr>
					   <td rowspan="2">주소</td>
					   <td> <div class="input-group">
                                 <span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
                                 <input type="text" name="post_num" id="sample4_postcode" placeholder="우편번호" class="form-control">
								 <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" class="btn btn-outline-success"><br>
                            </div></td>
					    <td></td>
					</tr>
					<tr>
					 <td><div>
                      	<input type="text" name="addr1" id="sample4_roadAddress" placeholder="도로명주소" class="form-control"></div></td>
                      <td><div><input type="text" name="addr2" id="sample4_jibunAddress" placeholder="지번주소" class="form-control">
								<span id="guide" style="color:#999"></span></div></td>
					</tr>
					<tr>
					   <td>배송시요청사항</td>
					   <td><select id="delivery_loc" name="delivery_loc">
											<option value="frontDoor">문앞</option>
											<option value="directly_or_frontDoor">직접받고 부재 시 문앞</option>
											<option value="security">경비실</option>
											<option value="delievery_box">택배함</option>
									</select> </td>
					    <td></td>
					</tr>
					<!-- 결제정보  -->
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
						
					<!-- 총 주문금액 -->
					<tr style="border-bottom-width: 3px; border-color: black;"></tr>
					<tr>
					   <th style="font-size:20px; font-weight: bold;">총 주문금액</th>	
					</tr>
					
				
				</tbody>
				<%} %>
			</table>
		</form>
		 </div> 
	</div>
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