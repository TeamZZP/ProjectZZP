<%@page import="java.util.List"%>
<%@page import="com.dto.QuestionDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

     <table  style="text-align: center;">
    	<tr>
    		<td>번호</td>
    		<td>상품</td>
    		<td>카테고리</td>
    		<td>제목</td>
    		<td>작성일</td>
    	</tr>
    <%
    	List<QuestionDTO> list = (List<QuestionDTO>)session.getAttribute("questionList");
    	for(QuestionDTO dto : list){
    %>
    	<tr>
    		<td> <%= dto.getQ_ID() %> </td>
    		<td> <%= dto.getP_ID() %> </td>
    		<td> <%= dto.getQ_CATEGORY() %> </td>
    		<td> <a href="QuestionOneSelect?Q_ID=<%= dto.getQ_ID() %>"> <%= dto.getQ_TITLE() %> </a> </td>
    		<td> <%= dto.getQ_CREATED() %> </td>
    	</tr>
    <%
    	}
    %>
    <tr>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td>  
    		<button onclick="location.href='questionInsert.jsp'">글쓰기</button>
    	</td>
    </tr>
    </table>
   