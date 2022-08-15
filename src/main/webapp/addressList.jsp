<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>ZZP</title>
<script>

function deleteAdd (x) {//모달의 삭제 버튼 클릭시 배송지 삭제
	
	$.ajax({
		type : "post",
		url : "AddressDeleteServlet",//페이지 이동 없이 해당 url에서 작업 완료 후 데이터만 가져옴
		dataType : "text",
		data : {//서버에 전송할 데이터
			"address_id" : x
		},
		success : function(data, status, xhr) {
			alert("해당 배송지가 삭제되었습니다."); 
			$("#deleteAddress").modal('hide');
			$('.modal-backdrop').hide();  //모달창 닫고 백드롭 hide
			$("#addTable").remove();
			console.log(data);
			$("#addTableDiv").append(data);
			
		},
		error: function(xhr, status, error) {
			console.log(error);
		}						
	});//end ajax
};//end fn
</script>
</head>
<body>
<jsp:include page="common/header.jsp" flush="true"></jsp:include><br>
<jsp:include page="mypage/addressList.jsp" flush="true"></jsp:include><br>
<jsp:include page="common/footer.jsp" flush="true"></jsp:include><br>
</body>
</html>