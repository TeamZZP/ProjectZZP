<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ZZP</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">   
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> 
<script type="text/javascript">
$(function() {
	//아이디 중복 확인
	$("#useridBtn").click(function() {
		console.log("button");
		console.log($("#userid").val());
		$.ajax({
			type: "get",
			url: "../MemberIdCheckServlet",
			dataType: "text",
			data: {
				userid: $("#userid").val()
			},
			success: function(responseData, status, xhr) {
				$("#result").text(responseData);
			},
			error: function(xhr, status, error) {
				console.log(error);
			}
		}); 
	});
	
	//parent창으로 값 전달
	$("#useId").click(function() {
		opener.$("#userid").val($("#userid").val());
		opener.$("#passwd").focus();
		window.close();
	});
	
	//취소
	$("#closeWin").click(function() {
		window.close();
	});
});
</script>
</head>
<body>
<input type="text" readonly class="form-control-plaintext" value="[ 아이디 중복 확인 ]" style="font-weight: bold;">
  <div class="row gx-3 gy-2 align-items-cente">
  	<div class="col-sm-3">
   	 	<label class="visually-hidden" for="specificSizeInputName">ID</label>
    	<input type="text" class="form-control" id="userid" placeholder="아이디 입력" >
 	 </div>
 	 <div class="col-auto">
    	<button type="submit" class="btn btn-outline-success" id="useridBtn">중복확인</button>
  	 </div>
  </div>
<span id="result"></span><br>
<button class="btn btn-success" id="useId">사용하기</button>
<button class="btn btn-success" id="closeWin">취소</button>
</body>
</html>