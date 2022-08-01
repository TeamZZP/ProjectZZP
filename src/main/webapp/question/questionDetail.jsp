<%@page import="com.dto.MemberDTO"%>
<%@page import="com.dto.QuestionDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	QuestionDTO qDTO = (QuestionDTO)session.getAttribute("questionOneSelect");
	System.out.print("questionDetail " + qDTO);
%>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function () {
		$("#questionList").click(function () {
			$("#detailForm").attr("action", "QuestionListServlet");
		});
		$("#questionUpdate").click(function () {
			$("#detailForm").attr("action", "questionUpdate.jsp");
		});
		$("#questionDelete").click(function () {
			$("#detailForm").attr("action", "QuestionDeleteServlet?Q_ID=<%=qDTO.getQ_ID()%>");
		});
		if ($("#pId").val() == "null") {
			$("#pId").val("");
		}
	});//end ready
</script>
	<form method="post" id="detailForm">
		<table>
			<caption style="caption-side: top;">문의 내용</caption>
			<tr>
				<td colspan="2">제목 <%= qDTO.getQ_TITLE() %> </td>
			</tr>
			<tr>
				<td>작성일 <%= qDTO.getQ_CREATED() %></td>
				<td>작성자 <%= qDTO.getUSERID() %> </td>
			</tr>
			<tr>
				<td colspan="2"> <%= qDTO.getQ_CONTENT() %> </td>
			</tr>
			<tr>
				<td>
				 	<button id="questionList">목록</button> 
				</td>
				<td>
					<button id="questionUpdate">수정</button> 
				 	<button id="questionDelete">삭제</button>
				</td>
			</tr>
		</table>
	</form>