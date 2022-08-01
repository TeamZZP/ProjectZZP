<%@page import="java.util.List"%>
<%@page import="com.dto.QuestionDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<%
	String mesg = (String)session.getAttribute("mesg");
	if(mesg != null){
%>
	<script>
		alert("<%=mesg%>");
	</script>
<%
	}
	session.removeAttribute("mesg");
%>
     <table  style="text-align: center;">
    	<tr>
    		<td>번호</td>
    		<td>상품</td>
    		<td>카테고리</td>
    		<td>제목</td>
    		<td>작성일</td>
    		<td>작성자</td>
    	</tr>
    <%
    	List<QuestionDTO> list = (List<QuestionDTO>)session.getAttribute("questionList");
    	for(QuestionDTO dto : list){
    %>
    	<tr>
    		<td> <%= dto.getQ_ID() %> </td>
    		<td> <span id="pId<%=dto.getP_ID()%>"><%=dto.getP_ID()%></span> </td>
    		<td> <%= dto.getQ_CATEGORY() %> </td>
    		<td> <a href="QuestionOneSelect?Q_ID=<%= dto.getQ_ID() %>&USERID=<%=dto.getUSERID()%>"> <%= dto.getQ_TITLE() %> </a> </td>
    		<td> <%= dto.getQ_CREATED() %> </td>
    		<td> <%= dto.getUSERID() %> </td>
    	</tr>
    <%
    	}
    %>
    <tr>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td></td>
    	<td>  
    		<button onclick="location.href='questionInsert.jsp'">글쓰기</button>
    	</td>
    </tr>
    </table>
   