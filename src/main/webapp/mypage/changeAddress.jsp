<%@page import="com.dto.OrderDTO"%>
<%@page import="com.dto.AddressDTO"%>
<%@page import="com.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<%
	MemberDTO dto=(MemberDTO) session.getAttribute("login");
	AddressDTO address=(AddressDTO) session.getAttribute("address");
	//OrderDTO orders=(OrderDTO) session.getAttribute("orders");
	
	String userid=dto.getUserid();
	String username=dto.getUsername();
	String phone=dto.getPhone();
	
	String post_num=address.getPost_num();
	String addr1=address.getAddr1();
	String addr2=address.getAddr2();
	
	if (addr2 == null) {
		addr2="상세 주소를 입력하세요.";
	}
	
	//String order_request=orders.getOrder_request();
%>
<html>
<head>
<meta charset="UTF-8">
<title>주소 수정</title>
<link type="text/css" rel="stylesheet" href="<c:url value='/bootstrap/css/bootstrap.css'/>"/>    
<link type="text/css" rel="stylesheet" href="<c:url value='/bootstrap/css/bootstrap.min.css'/>"/>    
<script src="<c:url value='/bootstrap/js/bootstrap.js'/>" type="text/javascript"></script>
<script src="<c:url value='/bootstrap/js/bootstrap.min.js'/>" type="text/javascript"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#submit").on("click", function () {
			var post=$("#sample4_postcode").val();
			var addr1=$("#sample4_roadAddress").val();
			var addr2=$("#sample4_jibunAddress").val();
			opener.$("#sample4_postcode").val(post);//부모창에 업데이트
			opener.$("#sample4_roadAddress").val(addr1);//부모창에 업데이트
			opener.$("#sample4_jibunAddress").val(addr2);//부모창에 업데이트
			$("form").attr("action", "../AccountChangeServlet");
			alert("주소가 변경되었습니다.");
		});//end fn
		$("#sample4_jibunAddress").on("click", function() {
			if ($(this).val()=="상세 주소를 입력하세요.") {
				$(this).val("");
				$(this).removeAttr("readonly");
			}
		});
		$("#close").on("click", function() {
			close();
		});//end fn
	});//end ready
</script>
</head>
<body>
<div style = "padding: 15px 5px 5px 20px;">
<form action=" " method="get">
<input type="hidden" name="userid" id="userid" value="<%= userid %>">
<b>이름</b><br>
<%= username %><br>
<br>
<b>주소</b><br>
우편번호: <input type="text" name="post" id="sample4_postcode" placeholder="우편번호" readonly="readonly" value="<%= post_num %>">
	<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" class="btn btn-outline-success"><br>
도로명 주소: <input type="text" name="addr1" id="sample4_roadAddress" placeholder="도로명주소" readonly="readonly" value="<%= addr1 %>" style="width: 450px"><br>
상세 주소: <input type="text" name="addr2" id="sample4_jibunAddress" placeholder="지번주소" readonly="readonly" value="<%= addr2 %>" style="width: 300px"><br>
	<span id="guide" style="color:#999"></span><br>
연락처: <input type="text" name="phone" id="phone" placeholder="<%= phone %>"/><br>
<%-- <input type="text" name="deliveryReq" value="<%= order_request %>"><br> --%>
<input type="checkbox" value="기본 배송지로 선택"><br>
<button id="submit" class="btn btn-success">저장</button>&nbsp;&nbsp;<button id="close" class="btn btn-success">창 닫기</button>
<button class="btn btn-success">삭제</button><br>
</form>
</div>
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