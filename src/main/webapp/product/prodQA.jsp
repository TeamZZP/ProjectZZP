<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.dto.QuestionDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(documnet).ready(function () {

	}); //end ready
</script>

<form method="post" action="#">
    <table>
    <%
  	 	 List<QuestionDTO> prodQuestionList = (List<QuestionDTO>)session.getAttribute("prodQuestionList");
    	 for(QuestionDTO qDTO : prodQuestionList){
    		 String user = qDTO.getUSERID();
    		 String created = qDTO.getQ_CREATED().substring(0,10); 
    %>
    	<tr id="questionDetail">
    		<td> <img alt="Q" src="../images/question/" width="50px" height="50px"> </td>
    		<td> <%=qDTO.getQ_STATUS() %> </td>
    		<td> <% 
    			   String use = "";	
    			   for(int j=0; j < user.substring(5).length(); j++){
    				use += "*";
    			%>
    			<% } %>
    			<%= user.substring(0, 5).concat(use) %>
    		</td>
    		<td> <%=created %> </td>
    	</tr>
    	<tr>
    		<td colspan="4"></td>
    		<td><%=qDTO.getQ_TITLE() %></td>
    	</tr>
    <%
    	 }
    %>
    </table>
</form>