<%@page import="com.dto.QuestionDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	QuestionDTO dto = (QuestionDTO)session.getAttribute("questionOneSelect");
	System.out.print("questionDetail " + dto);
%>

<table>
	<caption style="caption-side: top;">문의 내용</caption>
	<tr>
		<td colspan="2">제목 <%= dto.getQ_TITLE() %> </td>
	</tr>
	<tr>
		<td>작성일 <%= dto.getQ_CREATED() %></td>
		<td>작성자 <%= dto.getUSERID() %> </td>
	</tr>
	<tr>
		<td colspan="2"> <%= dto.getQ_CONTENT() %> </td>
	</tr>
	<tr>
		<td>
		 	<button onclick="location.herf='QuestionListServlet'">목록</button> 
		</td>
		<td>
			<button>수정</button> 
		 	<button>삭제</button>
		</td>
	</tr>
</table>