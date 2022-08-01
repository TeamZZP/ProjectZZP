<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.dto.PageDTO"%>
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
	
	<table border="1" style="border-collapse: collapse; text-align: center;" class="table table-hover">
    				<colgroup style="caption-side: top;" >zzp 고정 공지</colgroup>
    				<tr>
				    	<td>번호</td>
				    	<td>제목</td>
				    	<td>작성일</td>
				    	<td>조회</td>
    				</tr>
    				<%
				 		PageDTO noticePageDTO = (PageDTO)session.getAttribute("noticePageDTO");
				 		List<NoticeDTO> noticeList = noticePageDTO.getList();
				 		for(int i = 0; i < noticeList.size(); i++){
				 			NoticeDTO nDTO = noticeList.get(i);
					%>
    				<tr>
    					<td> <%= nDTO.getNOTICE_ID() %> </td>
    					<td> <a href="NoticeOneSelectServlet?NOTICE_ID=<%= nDTO.getNOTICE_ID() %>"> <%= nDTO.getNOTICE_TITTLE() %> </a> </td>
    					<td> <%= nDTO.getNOTICE_CREATED() %> </td>
    					<td> <%= nDTO.getNOTICE_HITS() %> </td>
    				</tr>
    				<%
			    		}
			    	%>
			    	<tr>
						<td colspan="4">
						 <%
					        int NcurPage = noticePageDTO.getCurPage();
					        int NperPage = noticePageDTO.getPerPage();
							int NtotalCount = noticePageDTO.getTotalCount();
							int NtotalPage = NtotalCount/NperPage; //페이지수 구하기
							if(NtotalCount%NperPage!=0) NtotalCount++; //페이지수 구하기 나머지가 있으면 +1
					        for(int i=1; i <= NtotalPage; i++){//1페이지부터 시작함으로 i=1
					          	if(i== NcurPage){
					          		out.print(i+"&nbsp;"); //현재페이지
					          	}else{
					          		out.print("<a style='color: green;' href = 'NoticeListServlet?MainCurPage="+i+"'>" + i + " </a>");  
					          	} //다른 페이지 선택시 링크로 이동
					        }//end for
					  	 %>
						</td>
					</tr>
    </table>
    <table border="1" style="text-align: center; border-collapse: collapse;" class="table table-hover">
    	<tr>
    		<td>번호</td>
    		<td>제목</td>
    		<td>작성일</td>
    		<td>조회</td>
    	</tr>
    	<%
	 		PageDTO pDTO = (PageDTO)session.getAttribute("pDTO");
	 		List<NoticeDTO> list = pDTO.getList();
	 		for(int i = 0; i < list.size(); i++){
	 			NoticeDTO nDTO = list.get(i);
		%>
    	<tr>
    		<td> <%= nDTO.getNOTICE_ID() %> </td>
    		<td><a href="NoticeOneSelectServlet?NOTICE_ID=<%= nDTO.getNOTICE_ID() %>"> <%= nDTO.getNOTICE_TITTLE() %> </a> </td>
    		<td> <%= nDTO.getNOTICE_CREATED() %> </td>
    		<td> <%= nDTO.getNOTICE_HITS() %> </td>
    	</tr>
    	<%
			}
		%>
		<tr>
			<td colspan="4">
			 <%
		        int curPage = pDTO.getCurPage();
		        int perPage = pDTO.getPerPage();
				int totalCount = pDTO.getTotalCount();
				int totalPage = totalCount/perPage; //페이지수 구하기
				if(totalCount%perPage!=0) totalPage++; //페이지수 구하기 나머지가 있으면 +1
		        for(int i=1; i <= totalPage; i++){//1페이지부터 시작함으로 i=1
		          	if(i== curPage){
		          		out.print(i+"&nbsp;"); //현재페이지
		          	}else{
		          		out.print("<a style='color: green;' href = 'NoticeListServlet?curPage="+i+"'>" + i + " </a>");  
		          	} //다른 페이지 선택시 링크로 이동
		        }//end for
		  	 %>
			</td>
		</tr>
    </table>