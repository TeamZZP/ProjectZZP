<%@page import="com.dto.ImagesDTO"%>
<%@page import="com.dto.PageDTO"%>

<%@page import="com.dto.ProductDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ZZP</title>
<link type="text/css" rel="stylesheet" href="<c:url value='/bootstrap/css/bootstrap.css'/>"/>    
<link type="text/css" rel="stylesheet" href="<c:url value='/bootstrap/css/bootstrap.min.css'/>"/>    
<script src="<c:url value='/bootstrap/js/bootstrap.js'/>" type="text/javascript"></script>
<script src="<c:url value='/bootstrap/js/bootstrap.min.js'/>" type="text/javascript"></script>

	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function () {
			$(".check").click(function () {
				var pID = $(this).attr("data-pID");
				var pName = $(this).attr("data-pName");
				opener.$("#P_Name").val(pName);
				opener.$("#P_ID").val(pID);
				window.close();
			});
		})//end ready
	</script>
</head>
<body>
<%
	String category = request.getParameter("category"); //카테고리
	String searchValue = request.getParameter("searchValue"); //검색어
	if(searchValue == null){searchValue = "";}
%>
	<form action="QuestionProdSelectServlet" method="post">
		<table border="1" style="border-collapse: collapse; border: 1px solid green;">
			<tr>
				<td>
					<select  name="category" id="category" class="form-select">
						<option value="P_NAME" <%if("P_NAME".equals(category)){ %> selected="selected" <%} %>>상품명</option>
						<option value="P_ID" <%if("P_ID".equals(category)){ %> selected="selected" <%} %>>상품코드</option>
					</select>
				</td>
				<td colspan="2">
					<div class="input-group">
					  <input type="text" name="searchValue" id="searchValue" value="<%=searchValue%>" class="form-control">
					  <button class="btn btn-outline-secondary" type="submit" id="search">검색하기</button>
					</div>
				</td>
			</tr>
	<%
		String prodNum = (String)request.getAttribute("prodNum"); 
		System.out.print("검색한 갯수 가져온거" + prodNum);
		Integer SelectNum = (Integer)request.getAttribute("SelectNum");
		if(SelectNum == null){SelectNum = 0;}
	%>
		<tr>
			<td style="color: blue;" colspan="2">총 <%=SelectNum%> 개의 상품이 검색되었습니다.</td>
			<td> 
				<select class="form-select" name="prodNum" id="prodNum">
					<option value="5" <%if("5".equals(prodNum)){ %> selected="selected" <%} %>>5개씩보기</option>
					<option value="10" <%if("10".equals(prodNum)){ %> selected="selected" <%} %>>10개씩보기</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>상품 이미지</td>
			<td>상품 정보</td>
			<td>선택</td>
		</tr>
		<%
			PageDTO list = (PageDTO)request.getAttribute("SelectList");
			List<ImagesDTO> imgList = (List<ImagesDTO>)request.getAttribute("iDTO");
			if(list != null){
				List<ProductDTO> pList = list.getList();
				for (int i = 0; i < pList.size(); i++) {
					ProductDTO pDTO = pList.get(i);
					String pName = pDTO.getP_name();
					String pContent = pDTO.getP_content();
					int pPrice = pDTO.getP_cost_price();
					
					ImagesDTO iDTO = imgList.get(i);
					String imgs = iDTO.getImage_route();
		%>
		<tr>
			<td> <img alt="상품사진" src="images/p_image/<%=imgs%>.png" width="100px" height="100px"></td>
			<td> <%=pName %> <br> <%=pContent %> <br> <%=pPrice %> </td>
			<td> <button class="btn btn-outline-success check" data-pID="<%=pDTO.getP_id()%>" data-pName="<%=pName %>" >선택</button> </td>
		</tr>
		<%
			}//end prod for
		%>
		<tr>
			<td>
		<%
			        int curPage = list.getCurPage();
			        String p = (String)request.getAttribute("perPage");
					int perPage = Integer.parseInt(p);
					int totalCount = list.getTotalCount();
					int totalPage = totalCount/perPage; //페이지수 구하기
					if(totalCount%perPage!=0) totalPage++; //페이지수 구하기 나머지가 있으면 +1
			        for(int i=1; i<= totalPage; i++){//1페이지부터 시작함으로 i=1
			          	if(i== curPage){
			          		out.print(i+"&nbsp;"); //현재페이지
			          	}else{
			          		out.print("<a style='color: green;' href ='QuestionProdSelectServlet?curPage="+i
			          				+"&category="+category+"&searchValue="+searchValue
			          				+"&prodNum="+prodNum+"'>" + i + "</a>");  
			          	} //다른 페이지 선택시 링크로 이동
			        }//end for
			}//end if
		 %>
			</td>
		</tr>
	</table>
</form>
</body>
</html>