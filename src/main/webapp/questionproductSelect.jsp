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
			$(".check").click(function () {
				var pID = $(this).attr("data-pID");
				console.log(pID);
				opener.$("#pId").val(pID);
				window.close();
			});
		})//end ready
	</script>
</head>
<body>
	<form action="QuestionProdSelet" method="get">
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
	 	</table>
	</form>
	<%
		Integer SelectNum = (Integer)request.getAttribute("SelectNum");
		if(SelectNum == null){SelectNum = 0;}
	%>
	<table border="1" style="border-collapse: collapse;">
		<tr>
			<td style="color: blue;" colspan="2">총 <%=SelectNum%> 개의 상품이 검색되었습니다.</td>
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
		<%
			List<ProductDTO> list = (List<ProductDTO>)request.getAttribute("SelectList");
			if(list != null){
				for(ProductDTO pDTO : list){
					String img = pDTO.getP_img();
					String pName = pDTO.getP_name();
					String pContent = pDTO.getP_content();
					int pPrice = pDTO.getP_cost_price();
		%>
		<tr>
			<td> <img alt="상품사진" src="images/p_image/<%=img%>.jpg" width="100px" height="100px"></td>
			<td> <%=pName %> <br> <%=pContent %> <br> <%=pPrice %> </td>
			<td> <button class="check" data-pID="<%=pDTO.getP_id()%>">선택</button> </td>
		</tr>
		<%
				}//for
			}//if
		%>
	</table>
</body>
</html>