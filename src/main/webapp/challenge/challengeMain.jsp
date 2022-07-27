<%@page import="com.dto.ChallengeDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<ChallengeDTO> list = (List<ChallengeDTO>) request.getAttribute("list");
%>
<a href="">이 달의 챌린지 [ 용기내! 챌린지 ] 참여하러 가기</a>
<select name="sortChallenge">
	<option value="" selected disabled hidden>정렬</option>
	<option>최신순</option>
	<option>이 달의 챌린지</option>
	<option>최근 좋아요순</option>
	<option>최근 댓글 많은순</option>
</select>
<a href="ChallengeUIServlet">글쓰기</a>


<table width="100%" cellspacing="0" cellpadding="0">

	<tr>
		<td>
			<table align="center" width="710" cellspacing="0" cellpadding="0" border="0">

				<tr>
					<td height="5"></td>
				</tr>
				<tr>
					<td height="1" colspan="8" bgcolor="CECECE"></td>
				</tr>
				<tr>
					<td height="10"></td>
				</tr>

				<tr>

					<%
					for (int i=1; i<= list.size(); i++) {
						ChallengeDTO dto = list.get(i-1);
						int chall_id = dto.getChall_id();
						String userid = dto.getUserid();
						String chall_title = dto.getChall_title();
						String chall_content = dto.getChall_content();
						String chall_category = dto.getChall_category();
						int chall_hits = dto.getChall_hits();
						int chall_liked = dto.getChall_liked();
						String chall_created = dto.getChall_created();
						String chall_img = dto.getChall_img();
					%>

					<td>

						<table style='padding: 15px'>

							<tr>
								<td align="center">프로필사진</td>
								<td align="center"><%=userid%></td>
							</tr>
							<tr>
								<td height="10">
							</tr>
							<tr>
								<td colspan="2">
								<a href="ChallengeDetailServlet?chall_id=<%=chall_id%>"> 
									<img src="images/<%=chall_img%>" border="0" align="middle"
										width="250" height="250">
								</a></td>
							</tr>
							<tr>
								<td height="10">
							</tr>
							<tr>
								<td align="center">♥ <%=chall_liked%></td>
								<td align="center">◇</td>
							</tr>
							<tr>
								<td height="10">
							</tr>
							<tr>
								<td colspan="2" align="center"><%=chall_title%></td>
							</tr>
						</table>

					</td>
					<!-- 한줄에 4개씩 보여주기 -->
					<%
					if (i % 4 == 0) {
					%>
				
				<tr>
					<td height="20">
				</tr>
				<%
				} //end if
				%>

				<%
 	} //end for
%>
			</table>
		</td>
	</tr>
	<tr>
		<td height="10">
	</tr>
</table>





<%-- <table border="1">
	<% for (ChallengeDTO dto : list) { 
		int chall_id = dto.getChall_id();
		String userid = dto.getUserid();
		String chall_title = dto.getChall_title();
		String chall_content = dto.getChall_content();
		String chall_category = dto.getChall_category();
		int chall_hits = dto.getChall_hits();
		int chall_liked = dto.getChall_liked();
		String chall_created = dto.getChall_created();
		String chall_img = dto.getChall_img();
	%>
	<tr>
	  <td>프로필사진</td>
	  <td><%= userid %></td>
	</tr>
	<tr>
	  <td colspan="2">
	  	<a href="ChallengeDetailServlet?chall_id=<%= chall_id %>">
	  	<img src="images/<%= chall_img %>" width="250" height="250">
	  	</a></td>
	</tr>
	<tr>
	  <td>♥ <%= chall_liked %></td>
	  <td>◇</td>
	</tr>
	<tr>
	  <td><%= chall_title %></td>
	</tr>
	<% } %>
</table> --%>
