<%@page import="com.dto.MemberDTO"%>
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
    <%
		NoticeDTO nDTO = (NoticeDTO)session.getAttribute("noticeOne");
		System.out.print("nDTO확인 " + nDTO);
		
		NoticeDTO nextDTO = (NoticeDTO)session.getAttribute("nextDTO");
	%>
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript">
				function NoticeList() {
					$("#DetailForm").attr("action", "NoticeListServlet");
				}
				function NoticeDelete() {
					$("#DetailForm").attr("action", "NoticeDeleteServlet");
				}
	</script>
	<div style="text-align: center; display: flex; justify-content:center; height: 100px; margin-bottom: 10px;" >
		<img src="images/notice3.png" alt="..." style="width: auto;">
	</div>
	<form action="NoticeUpdate.jsp" method="post" id="DetailForm">
		<input type="hidden" name="nId" value="<%=nDTO.getNOTICE_ID()%>">
		<table border="1" style="border-collapse: collapse;" >
			<tr>
				<td colspan="2">제목 <%=nDTO.getNOTICE_TITTLE()%></td>
			</tr>
			<tr>
				<td>작성일 <%=nDTO.getNOTICE_CREATED()%></td>
				<td>조회 <%=nDTO.getNOTICE_HITS()%></td>
			</tr>
			<tr>
				<td colspan="2"><%=nDTO.getNOTICE_CONTENT()%></td>
			</tr>
			<tr>
				<td><button onclick="NoticeList()" class="btn btn-outline-success" >목록</button></td>
				<%
					MemberDTO mDTO = (MemberDTO)session.getAttribute("login");
					if(mDTO != null){
						int admin = mDTO.getRole();
						if (admin == 1){
				%>
				<td><button type="submit" id="NoticeUpdate" class="btn btn-outline-success" >수정</button>
					<button onclick="NoticeDelete()" class="btn btn-outline-success" >글 삭제</button>				
				</td>
				<%
						}
					}
				%>
			</tr>
			<tr>
				<td colspan="2">
					다음글 <a href="NoticeOneSelectServlet?NOTICE_ID=<%=nextDTO.getNOTICE_ID()%>"> <%= nextDTO.getNOTICE_TITTLE() %>  </a>
				</td>
			</tr>
		</table>
	</form>