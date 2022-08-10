<%@page import="com.dto.QuestionDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
  	 	 List<QuestionDTO> prodQuestionList = (List<QuestionDTO>)session.getAttribute("prodQuestionList");
    %>
    
    <table>
    	<tr>
    		<td> </td>
    	</tr>
    </table>