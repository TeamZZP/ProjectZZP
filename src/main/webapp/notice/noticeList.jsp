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
    <table  style="text-align: center;" class="table table-hover">
    	<tr>
    		<td>번호</td>
    		<td>제목</td>
    		<td>작성일</td>
    		<td>조회</td>
    	</tr>
    	<tr>
    		<td colspan="4">
    			<table border="1" style="border-collapse: collapse;" class="table table-hover">
    				<tr>
    					<td colspan="4"> &nbsp; &nbsp; &nbsp; &nbsp; zzp 메인 공지 게시판 &nbsp; &nbsp; &nbsp; &nbsp; </td>
    				</tr>
    				<%
			    		List<NoticeDTO> mainNoticeList = (List<NoticeDTO>)session.getAttribute("mainNoticeList");
			    		for(NoticeDTO MainListDTO : mainNoticeList){
			    	%>
    				<tr>
    					<td> <%= MainListDTO.getNOTICE_ID() %> </td>
    					<td> <a href="NoticeOneSelectServlet?NOTICE_ID=<%= MainListDTO.getNOTICE_ID() %>"> <%= MainListDTO.getNOTICE_TITTLE() %> </a> </td>
    					<td> <%= MainListDTO.getNOTICE_CREATED() %> </td>
    					<td> <%= MainListDTO.getNOTICE_HITS() %> </td>
    				</tr>
    				<%
			    		}
			    	%>
    			</table>
    		</td>
    	</tr>
    	<%
			List<NoticeDTO> noticeList = (List<NoticeDTO>)session.getAttribute("noticeList");
			for(NoticeDTO noticeDTO : noticeList){
		%>
    	<tr>
    		<td> <%= noticeDTO.getNOTICE_ID() %> </td>
    		<td><a href="NoticeOneSelectServlet?NOTICE_ID=<%= noticeDTO.getNOTICE_ID() %>"> <%= noticeDTO.getNOTICE_TITTLE() %> </a> </td>
    		<td> <%= noticeDTO.getNOTICE_CREATED() %> </td>
    		<td> <%= noticeDTO.getNOTICE_HITS() %> </td>
    	</tr>
    	<%
			}
		%>
    </table>