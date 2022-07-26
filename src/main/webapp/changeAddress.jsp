<%@page import="com.dto.MemberDTO"%>
<%@page import="com.dto.AddressDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	AddressDTO addressidAddress=(AddressDTO) session.getAttribute("addressidAddress");
	
	int address_id=addressidAddress.getAddress_id();
	String address_name=addressidAddress.getAddress_name();
	String receiver_name=addressidAddress.getReceiver_name();
	String receiver_phone=addressidAddress.getReceiver_phone();
	String post_num=addressidAddress.getPost_num();
	String addr1=addressidAddress.getAddr1();
	String addr2=addressidAddress.getAddr2();
	int default_chk=addressidAddress.getDefault_chk();
%>
<html>
<head>
<meta charset="UTF-8">
<title>ZZP</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		if (<%= default_chk %> == 1) {//기본 배송지 체크 상태로 출력되도록
			$("#gridCheck2").attr("checked","checked");
			$("#gridCheck2").attr("disabled", "true");//체크 상태인데 서블릿에 데이터가 안 넘어가서 기본 해제됨//hidden 이용
			//$("#gridCheck").prop("disabled", "true");//체크 상태인데 서블릿에 데이터가 안 넘어가서 기본 해제됨
			$("#gridCheck").val("true");//check true 값 설정
//			$("#mesg").text("기본 배송지 설정은 해제할 수 없습니다.");
 			$("#mesg").on("click", function() {//disabled여서 click 불가--checkbox 감싼 div에 설정함
				alert("기본 배송지 설정은 해제할 수 없습니다.\n수정을 원하는 경우 다른 배송지를 기본으로 설정하세요.");
			});
		}
		//완료 클릭, 서블릿에서 update, 배송지 목록으로
		$("form").on("submit", function() {
			var address_name=$("#inputAddressName").val();
			var receiver_name=$("#inputReceiverName").val();
			var receiver_phone=$("#inputReceiverPhone").val();
			var post_num=$("#sample4_postcode").val();
			var addr1=$("#sample4_roadAddress").val();
			var addr2=$("#sample4_jibunAddress").val();
			var numChk = /^[0-9]*.{11}$/;
			//var check=$("#gridCheck").val();
			
			if (address_name=="" || receiver_name=="" || receiver_phone=="" ||
					post_num=="" || addr1=="" || addr2=="") {//공백 불가
				alert("배송지 정보를 입력해주세요.");
				event.preventDefault();
			} else if (receiver_phone != "" && !numChk.test(receiver_phone)) {//연락처는 숫자 11자리만 가능
				alert("연락처를 형식에 맞게 입력해주세요.");
				$("#inputReceiverPhone").val("");
				$("#inputReceiverPhone").focus();
				event.preventDefault();
			} else if (receiver_name.length > 3){
				alert("수령인은 3글자 이내로 입력해주세요.");
				$("#inputReceiverName").val("");
				$("#inputReceiverName").focus();
				event.preventDefault();
			} else {//기본 배송지로 설정 체크한 경우 value true 설정
				//event.preventDefault();
				var checked=$("#gridCheck2").is(":checked");
				if (checked) {//check trun면 val true
					$("#gridCheck").val(checked);
					console.log($("#gridCheck").val());
				}
				//check false면 val 그대로 false
			}
		});//end submit
		$("#cancle").on("click", function() {
			alert("배송지 수정을 취소합니다.");
			location.href="AddressListServlet";
		});
	});//end ready
</script>
</head>
<body>
<jsp:include page="common/header.jsp" flush="true"></jsp:include><br>
<form action="AddressChangeServlet" method="post" class="row g-2">
<input type="hidden" name="address_id" id="address_id" value="<%= address_id %>">
	<div class="row justify-content-center">
		<div class="col-md-5">
			  <div class="col-md-5">
			    <label for="inputAddressName" class="form-label" style="font-weight: bold;">배송지명</label><!-- 줄 안 바꾸고 싶음 -->
			    <input type="text" class="form-control" name="address_name" id="inputAddressName" value="<%= address_name %>">
			  </div>
			  <div class="col-md-7"></div><!-- 줄바꿈 -->
			  <div class="col-md-5">
			    <label for="inputReceiverName" class="form-label" style="font-weight: bold;">수령인</label>
			    <input type="text" class="form-control" name="receiver_name" id="inputReceiverName" value="<%= receiver_name %>">
			  </div>
			  <div class="col-md-7"></div><!-- 줄바꿈 -->
			  <div class="col-md-5">
			    <label for="inputReceiverPhone" class="form-label" style="font-weight: bold;">연락처</label>
			    <input type="text" class="form-control" name="receiver_phone" id="inputReceiverPhone" value="<%= receiver_phone %>">
			  </div>
			  <div class="col-md-7"></div><!-- 줄바꿈 -->
			  <!-- 주소 -->
				<div class="col-12">
						<div class="form-group">
							<label for="address" class="cols-sm-2 control-label" style="font-weight: bold;">주소</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
									<input type="text" name="post" id="sample4_postcode" value="<%= post_num %>" class="form-control" readonly="readonly">
									<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" class="btn btn-outline-success"><br>
								</div>
								<div class="row g-3" style="margin-top: -10px;">
									<div class="col-md-6">
										<input type="text" name="addr1" id="sample4_roadAddress" value="<%= addr1 %>" class="form-control" readonly="readonly">
									</div>
									<div class="col-md-6">
										<input type="text" name="addr2" id="sample4_jibunAddress" value="<%= addr2 %>" class="form-control">
										<span id="guide" style="color:#999"></span>
									</div>                  
								</div>
							</div>
						</div>
				</div>
			  <div class="col-12">
			    <div class="form-check" id="mesg">
			      <input class="form-check-input" type="checkbox" id="gridCheck2" name="default_chk2"><!-- 실제로 보여지는 체크박스 -->
			      <label class="form-check-label" for="gridCheck" id="">
			        기본 배송지로 설정
			      </label>
			      <input class="form-check-input" type="hidden" id="gridCheck" name="default_chk" value="false"><!-- 서블릿에서 데이터 파싱용 hidden -->
			    </div>
			  </div>
			
		</div>
		<div class="col-12">
			<div style="width : 525px; float : right;">
				<button type="submit" id="succ" class="btn btn-success">수정</button>
				<button type="reset" id="cancle" class="btn btn-success">취소</button>
			</div>
		</div>
	</div>
</form>
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