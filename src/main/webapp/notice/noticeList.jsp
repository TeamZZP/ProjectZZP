<%@page import="java.util.List"%>
<%@page import="com.dto.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    		<td>제목</td>
    		<td>작성일</td>
    		<td>조회</td>
    	</tr>
    	<tr>
    		<td colspan="4">
    			<table border="1" style="border-collapse: collapse;">
    				<tr>
    					<td colspan="4"> &nbsp; &nbsp; &nbsp; &nbsp; zzp 메인 공지 게시판 &nbsp; &nbsp; &nbsp; &nbsp; </td>
    				</tr>
    				<%
			    		List<NoticeDTO> list = (List<NoticeDTO>)session.getAttribute("pointNotice");
			    		for(NoticeDTO dto : list){
			    	%>
    				<tr>
    					<td> <%= dto.getNOTICE_ID() %> </td>
    					<td> <a href="NoticeOneSelectServlet?NOTICE_ID=<%= dto.getNOTICE_ID() %>"> <%= dto.getNOTICE_TITTLE() %> </a> </td>
    					<td> <%= dto.getNOTICE_CREATED() %> </td>
    					<td> <%= dto.getNOTICE_HITS() %> </td>
    				</tr>
    				<%
			    		}
			    	%>
    			</table>
    		</td>
    	</tr>
    	<tr>
    		<td> 1 </td>
    		<td> 배송안내 </td>
    		<td> 2020-7-22 </td>
    		<td> 1 </td>
    	</tr>
    </table>