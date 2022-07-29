<%@page import="com.dto.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <%
		NoticeDTO nDTO = (NoticeDTO)session.getAttribute("noticeOne");
		System.out.print("nDTO확인 " + nDTO);
		
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
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript">
			function NoticeList() {
				$("form").attr("action", "NoticeListServlet");
			}
			function NoticeDelete() {
				$("form").attr("action", "NoticeDeleteServlet");
			}
	</script>
	<form action="NoticeUpdateServlet" method="post">
		<input type="hidden" name="nId" value="<%=nDTO.getNOTICE_ID()%>">
		<table border="1" style="border-collapse: collapse;">
			<tr>
				<td colspan="2">제목 <input type="text" name="nTittle" value="<%=nDTO.getNOTICE_TITTLE()%>"> </td>
			</tr>
			<tr>
				<td> 수정일 </td>
				<td>조회 <%=nDTO.getNOTICE_HITS()%></td>
			</tr>
			<tr>
				<td colspan="2"> <textarea rows="10" cols="50" name="nContent"><%=nDTO.getNOTICE_CONTENT()%></textarea> </td>
			</tr>
			<tr>
				<td><button onclick="NoticeList()">목록보기</button></td>
				<td>
					<button type="submit">수정 완료</button>
					<button onclick="NoticeDelete()">글 삭제</button>
				</td>
			</tr>
		</table>
	</form>