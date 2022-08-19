<%@page import="com.dto.QuestionProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
		$(document).ready(function () {
			var img = opener.$("#upload").attr("src"); 
			$("#upload").attr("src", img);
			
			$("#uploadDel").click(function () {
				console.log("클릭");
				$.ajax({
					type:"post",
					url:"imgDelServlet",
					data:{
						img : $("#upload").attr("src")
					},
					dataType:"text",
					success: function (data, status, xhr) {
						window.close();
					},
					erorr: function (xhr, status, error) {
						
					}
				});//end ajax
			});//
		});//end ready
	</script>
	<style type="text/css">
		img:hover {
			cursor: pointer;
		}
	</style>
</head>
<body>
	<table>
		<tr>
			<td>
				<b>내 첨부파일</b>
			</td>
			<td style="text-align: right;">
				<img alt="삭제" src="images/question/close.png" width="20px" height="20px" id="uploadDel" title="삭제">
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<img alt="첨부파일" src="" id="upload" width="380px" height="500px" title="첨부파일">
			</td>
		</tr>
	</table>
</body>
</html>