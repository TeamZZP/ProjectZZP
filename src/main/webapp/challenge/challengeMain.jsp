<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.dto.PageDTO"%>
<%@page import="com.dto.ChallengeDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	#challMainContent {
		margin: 0 auto;
	}
	a {
		text-decoration: none;
		color: black;
	}
</style>
<%
	PageDTO pDTO = (PageDTO) request.getAttribute("pDTO");
	List<ChallengeDTO> list = pDTO.getList();
	String searchName = (String) request.getAttribute("searchName");
	String searchValue = (String) request.getAttribute("searchValue");
//	String sortBy = (String) request.getAttribute("sortBy");
	HashMap<Integer, Integer> commentsMap = (HashMap<Integer, Integer>) request.getAttribute("commentsMap");
	ArrayList<HashMap<String, String>> profileList = (ArrayList<HashMap<String, String>>) request.getAttribute("profileList");
	
	
	//session에 저장된 메시지가 있는 경우 경고창 띄워주고 삭제하기
	String mesg = (String) session.getAttribute("mesg");
	if (mesg != null) {
%>
	<script type="text/javascript">
		alert("<%= mesg %>");
	</script>
<% } 
	session.removeAttribute("mesg");
%>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
/* 	$(document).ready(function () {
		$("#sortBy").on("change", function () {
			location.href = "ChallengeListServlet?sortBy="+$(this).val();
		});
	}); */
</script>

<div id="challMainContent">

<table width="100%" cellspacing="0" cellpadding="0">

	<tr>
		<td>
			<table align="center" width="710" cellspacing="0" cellpadding="0" border="0">
				<tr>
					<td colspan="3">
						<a href="">이 달의 챌린지 [ 용기내! 챌린지 ] 참여하러 가기</a>
					</td>
					<td>
							<select name="sortBy" id="sortBy">
								<option value="none" selected disabled hidden>정렬</option>
								<option value="chall_id">최신순</option>
								<!-- <option value="thisMonthChall">이 달의 챌린지</option> -->
								<option value="chall_liked">인기순</option>
								<option value="mostCommented">댓글 많은순</option>
							</select>
							
						<a href="ChallengeUIServlet">글쓰기</a>
					</td>
				</tr>

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
						
						HashMap<String, String> map = profileList.get(i-1);
						String profile_img = map.get("PROFILE_IMG");
					%>

					<td>

						<table style='padding: 15px'>

							<tr>
								<td align="center"><a href="ProfileMainServlet?userid=<%= userid %>"><img src="images/<%= profile_img %>" width="30" height="30"></a></td>
								<td align="center"><a href="ProfileMainServlet?userid=<%= userid %>"><%= userid %></a></td>
								
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
								<td align="center"><img src="images/keeping.png" width="20" height="20"> <%=chall_liked%></td>
								<td align="center"><img src="images/bubble.png" width="20" height="17"> <%= commentsMap.get(chall_id) %></td>
							</tr>
							<tr>
								<td height="10">
							</tr>
							<tr>
								<td colspan="2" align="center">
								<a href="ChallengeDetailServlet?chall_id=<%=chall_id%>">
								<%=chall_title%></a></td>
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

	  	<!-- 검색기능 -->
	  	<tr>
	  		<td colspan="4" align="center" height="10">
		  	<form action="ChallengeListServlet">
			    <select name="searchName">
			      <option value="userid">아이디</option>
			      <option value="chall_title">제목</option>
			      <option value="chall_content">내용</option>
			    </select>
			    <input type="text" name="searchValue">
			    <button class="btn btn-outline-success" style="height: 30px">검색</button>
		    </form>
		    </td>
	    </tr>
		
		<!-- 페이징 -->
		<tr>
			<td colspan="4" align="center" height="10"><% 
		    int curPage = pDTO.getCurPage(); 
		    int perPage = pDTO.getPerPage(); 
		    int totalCount = pDTO.getTotalCount();
		    int totalPage = totalCount/perPage;
		    if (totalCount%perPage!=0) totalPage++;
		    for (int p=1; p<=totalPage; p++) {
		    	if (p==curPage) {
		    		out.print("<b>"+p+"</b>&nbsp;&nbsp;");
		    	} else {
		    		out.print("<a href='ChallengeListServlet?curPage="+p+"&searchName="+searchName+"&searchValue="+searchValue+"'>"+p+"</a>&nbsp;&nbsp;");
		    		/* out.print("<a href='ChallengeListServlet?curPage="+i+
		    				"&searchName="+searchName+"&searchValue="+searchValue+"&sortBy="+sortBy+"'>"+i+"</a>&nbsp;");  */
		    	} 
		    }
		    
		//    System.out.println(curPage+" "+searchName+" "+searchValue+" "+sortBy);
		    %></td>
		</tr>
	
			</table>
		</td>
	</tr>
	<tr>
		<td height="10">
	</tr>
	
</table>

</div>
 	




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
