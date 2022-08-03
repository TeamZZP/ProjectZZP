<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>zzp</title>
<style type="text/css">
table{
width: 100%;
height: 100%;
}
</style>

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

$(function() {
	
	$("#login").click(function() {
		
         opener.location.href="LoginUIServlet";
 
		 window.close();
		
	});//end login
	
	$("#join").click(function() {

		opener.location.href="MemberUIServlet";
		 window.close();
		 
	});//end join
	
})

</script>


</head>
<body>

<table>
<tr>

<td >회원이십니까?</td>
<td >회원이 아니십니까?</td>

</tr>

<tr>
<td ><button id ="login">로그인 바로가기</button></td>
<td ><button id="join">회원가입 하기</button></td>
</tr>

</table>
</body>
</html>