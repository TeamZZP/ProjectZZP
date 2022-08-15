<%@page import="com.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	MemberDTO member=(MemberDTO) session.getAttribute("login");
	String userid=member.getUserid();
%>
<html>
<head>
<meta charset="UTF-8">
<title>ZZP</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
	});//end ready
</script>
</head>
<body>
<jsp:include page="common/header.jsp" flush="true"></jsp:include><br>
	<input type="hidden" name="userid" id="userid" value="<%= userid %>">

<div class="container"><!-- ¿중앙 정렬? -->
	<div class="col-md-5">
		<form class="row g-3"><!-- ¿한 줄에 그리드 3개? -->
		  <div class="col-md-6">
		    <label for="inputAddressName" class="form-label">배송지명</label><!-- 줄 안 바꾸고 싶음 -->
		    <input type="text" class="form-control" id="inputAddressName">
		  </div>
		  <div class="col-md-6"></div><!-- 줄바꿈 -->
		  <div class="col-md-6">
		    <label for="inputReceiverName" class="form-label">수령인</label>
		    <input type="text" class="form-control" id="inputReceiverName">
		  </div>
		  <div class="col-12">
		    <label for="inputReceiverPhone" class="form-label">연락처</label>
		    <input type="text" class="form-control" id="inputReceiverPhone">
		  </div>
		  <div class="col-md-5">
		    <label for="" class="form-label" style="font-weight: bold;">주소</label>
		    <input type="text" name="post" class="form-control" id="sample4_postcode" placeholder="우편번호">
		  </div>
		  <div class="col-md-3"></div><!-- 공백 -->
		  <div class="col-md-4">
		    <label for="" class="form-label">우편번호 찾기</label>
		    <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" class="btn btn-outline-success form-control" readonly="readonly">
		  </div>
		  <div class="col-md-7">
		    <input type="text" name="addr1" id="sample4_roadAddress" placeholder="도로명주소" class="form-control" readonly="readonly">
		  </div>
		  <div class="col-md-5">
		    <input type="text" name="addr2" id="sample4_jibunAddress" placeholder="상세 주소를 입력하세요." class="form-control">
		    <span id="guide" style="color:#999"></span>
		  </div>
		  <div class="col-12">
		    <div class="form-check">
		      <input class="form-check-input" type="checkbox" id="gridCheck">
		      <label class="form-check-label" for="gridCheck">
		        기본 배송지로 설정
		      </label>
		    </div>
		  </div>
		  <div class="col-12">
		    <button type="submit" class="btn btn-success">완료</button>
		  </div>
		</form>
	</div>


<div class="row justify-content-center">
	<div class="col-md-4">	
		<form action="AddressAddServlet" method="post">
		  <div class="row mb-3"><!-- ??? -->
		    <label for="inputAddressName" class="col-sm-3 col-form-label">배송지명</label>
		    <div class="col-sm-6">
		      <input type="text" class="form-control" id="inputAddressName">
		    </div>
		  </div>
		  <div class="row mb-3">
		    <label for="inputReceiverName" class="col-sm-3 col-form-label">수령인</label>
		    <div class="col-sm-6">
		      <input type="text" class="form-control" id="inputReceiverName">
		    </div>
		  </div>
		  <div class="row mb-3">
		    <label for="inputReceiverPhone" class="col-sm-3 col-form-label">연락처</label>
		    <div class="col-sm-6">
		      <input type="text" class="form-control" id="inputReceiverPhone">
		    </div>
		  </div>
	</div>
	<div class="col-md-6">
		 	<!-- 주소 -->
			<div class="form-group">
				<label for="address" class="cols-sm-2 control-label" style="font-weight: bold;">주소</label>
				<div class="cols-sm-8">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
						<input type="text" name="post" id="sample4_postcode" placeholder="우편번호" class="form-control col-md-5" readonly="readonly">
					<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" class="btn btn-outline-success"><br>
					</div>
					<div class="row g-3" style="margin-top: -10px;">
						<div class="col-md-5">
							<input type="text" name="addr1" id="sample4_roadAddress" placeholder="도로명주소" class="form-control" readonly="readonly">
						</div>
						<div class="col-md-5">
							<input type="text" name="addr2" id="sample4_jibunAddress" placeholder="상세 주소를 입력하세요." class="form-control">
							<span id="guide" style="color:#999"></span>
						</div>                  
					</div>
				</div>
			</div>
		  <div class="row mb-3">
		    <div class="col-sm-4 offset-sm-6">
		      <div class="form-check">
		        <input class="form-check-input" type="checkbox" id="gridCheck1">
		        <label class="form-check-label" for="gridCheck1">
		          기본 배송지로 설정
		        </label>
		      </div>
		    </div>
		  </div>
		  <button type="submit" class="btn btn-success">배송지 추가</button>
		</form>	
	</div>
</div>




</div>
<jsp:include page="common/footer.jsp" flush="true"></jsp:include><br>
</body>
</html>
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