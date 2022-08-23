<%@page import="com.dto.ReviewDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<style>
	table.review {
	  border-collapse: separate;
	  border-spacing: 0px;
	  text-align: left;
	  line-height: 1.5;
	  margin : 20px 10px;
	}
	table.review td {
	  width: 350px; 
	  padding: 10px;
	  vertical-align: top;
	  border-bottom: 1px solid #8FBC8F;
	}
	</style>
	
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
		$(document).ready(function () {
			$(".show").click(function () {
				var review = $(this).attr("data-review");
				var show = $("#show"+review);
				console.log(show);
				$("#hiden"+review).slideToggle("slow");
			});
		});//end ready
	</script>
	
<%
	List<ReviewDTO> ReviewList = (List<ReviewDTO>)session.getAttribute("ReviewList");
	if(ReviewList != null){
%>	
	<table class="review" style="text-align: center;">
	<caption style="caption-side: top; text-align: center;">구매후기</caption>
		<tr>
			<td colspan="6" style="background-color: #8FBC8F;"></td>
		</tr>
		<tr>
			<td></td>
			<td>번호</td>
			<td>작성자</td>
			<td>작성일</td>
			<td>제목</td>
			<td>만족도</td>
		</tr>
		<%
			for(ReviewDTO rDTO : ReviewList){
				String user = rDTO.getUSERID();
				String created = rDTO.getREVIEW_CREATED().substring(0, 10);
		%>
		<tr class="show" id="show<%=rDTO.getREVIEW_ID()%>" data-review="<%=rDTO.getREVIEW_ID()%>">
			<td><img alt="리뷰" src="images/review/review.png" width="50px" height="50px"></td>
			<td><%=rDTO.getREVIEW_ID()%></td>
			<td>
				<%
					String use = "";
					for (int j = 0; j < user.substring(5).length(); j++) {
						use += "*";
				%> <%
					}
				%> <%=user.substring(0, 5).concat(use)%>
			</td>
			<td><%=created%></td>
			<td><%=rDTO.getREVIEW_TITLE()%></td>
			<td><%=rDTO.getREVIEW_RATE() %></td>
		</tr>
		<tr id="hiden<%=rDTO.getREVIEW_ID()%>" style="display: none;">
			<td colspan="6" style="text-align: right; padding-right: 50px;"><%=rDTO.getREVIEW_CONTENT() %></td>
		</tr>
		<%	} %>
	</table>
<%
	}
%>
