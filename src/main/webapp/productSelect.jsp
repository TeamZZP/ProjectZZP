<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.dto.ProductDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function () {
			$("#search").click(function() {
				console.log("hi")
				var searchValue = $("#searchValue").val()
				console.log(searchValue);
				if (searchValue.length == 0) {
					alert("검색어가 없습니다");
				} else {
					console.log(searchValue);
					$.ajax({
						type:"post",
						url:"QuestionProdSelet",
						data:{
							category:$("#category").val(),
							searchValue:$("#searchValue").val()
						},
						dataType:"text",
						success: function (data, status, xhr) {
							console.log(data);
							
						},
						error: function (xhr, status, error) {
							
						}
					});//end ajax 
				}
			});//searchClick
		})//end ready
	</script>
</head>
<body>
	<table border="1" style="border-collapse: collapse;">
		<tr>
			<td colspan="3">
				<select name="category" id="category">
					<option value="P_NAME">상품명</option>
					<option value="P_ID">상품코드</option>
				</select>
				<input type="text" name="searchValue" id="searchValue">
				<button id="search">검색하기</button>
			</td>
		</tr>
		<tr>
			<td style="color: blue;" colspan="2">총 <span id="count"></span> 개의 상품이 검색되었습니다.</td>
			<td> 
				<select name="pNum">
					<option value="5">5개씩보기</option>
					<option value="10">10개씩보기</option>
				</select> 
			</td>
		</tr>
		<tr>
			<td>상품 이미지</td>
			<td>상품 정보</td>
			<td>선택</td>
		</tr>
		<tr id="pList">
		</tr>
	</table>
</body>
</html>