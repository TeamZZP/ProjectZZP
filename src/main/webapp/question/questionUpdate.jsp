<%@page import="com.dto.QuestionDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	QuestionDTO qDTO = (QuestionDTO)session.getAttribute("questionOneSelect");
	System.out.print("questionUpdate " + qDTO);
%>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function () {
		if ($("#pId").val() == "null") {
			$("#pId").val("");
		}
		$("#questionUpdate").click(function () {
			$("#questionForm").attr("action", "QuestionUpdateServlet");
		})
	});//end ready
</script>
 <form action="" id="questionForm" method="post">
 <input type="hidden" name="qId" value="<%=qDTO.getQ_ID()%>">
		<table>
			<tr>
				<td colspan="2"> 제목 <input type="text" name="qTittle" id="qTittle" value="<%=qDTO.getQ_TITLE()%>"> </td>
			</tr>
			<tr>
				<td colspan="2"> 상품정보 <input type="text" name="pId" id="pId" value="<%=qDTO.getP_ID()%>"> </td>
			</tr>
			<tr>
				<td colspan="2"> 문의 글 카테고리
					<select name="qboard_category">
						<option value="1" <%if(1 == qDTO.getQ_BOARD_CATEGORY()){ %>selected="selected"<%}%>>상품문의</option>
						<option value="2" <%if(2 == qDTO.getQ_BOARD_CATEGORY()){ %>selected="selected"<%}%>>문의 게시판</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2"> 질문 카테고리
					<select name="qcategory">
						<option <%if("상품".equals(qDTO.getQ_CATEGORY())){ %>selected="selected"<%} %>>상품</option>
						<option <%if("배송".equals(qDTO.getQ_CATEGORY())){ %>selected="selected"<%} %>>배송</option>
						<option <%if("교환".equals(qDTO.getQ_CATEGORY())){ %>selected="selected"<%} %>>교환</option>
						<option <%if("환불".equals(qDTO.getQ_CATEGORY())){ %>selected="selected"<%} %>>환불</option>
						<option <%if("기타".equals(qDTO.getQ_CATEGORY())){ %>selected="selected"<%} %>>기타</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2"> <textarea rows="10" cols="40" name="qContent" id="qContent"><%= qDTO.getQ_CONTENT() %></textarea> </td>
			</tr>
			<tr>
				<td colspan="2">첨부파일 <input type="file" name="qFile" value="<%=qDTO.getQ_IMG()%>"> </td>
			</tr>
			<tr>
				<td> <button id="QuestionList">목록</button> </td>
				<td>
					<button type="submit" id="questionUpdate">등록</button>
					<button type="reset">취소</button>
				</td>
			</tr>
		</table>
	</form>