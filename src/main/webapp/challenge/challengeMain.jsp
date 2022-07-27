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
<a href="challengeWrite.jsp">글쓰기</a>

<table border="1">
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
	  	<img src="img/<%= chall_img %>" width="250" height="250">
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
</table>