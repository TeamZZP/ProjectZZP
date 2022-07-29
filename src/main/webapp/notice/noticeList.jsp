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
			    		List<NoticeDTO> mainNoticeList = (List<NoticeDTO>)session.getAttribute("pointNotice");
			    		for(NoticeDTO dto : mainNoticeList){
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
    	<%
			List<NoticeDTO> noticeList = (List<NoticeDTO>)session.getAttribute("noticeList");
			for(NoticeDTO dto : noticeList){
		%>
    	<tr>
    		<td> <%= dto.getNOTICE_ID() %> </td>
    		<td> <%= dto.getNOTICE_TITTLE() %> </td>
    		<td> <%= dto.getNOTICE_CREATED() %> </td>
    		<td> <%= dto.getNOTICE_HITS() %> </td>
    	</tr>
    	<%
			}
		%>
    </table>