<%@page import="com.dto.MemberDTO"%>
<%@page import="com.dto.ChallengeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/* 
	request에 저장된 dto가 있을 경우: 글 수정 페이지
	저장된 dto가 없을 경우: 글쓰기 페이지
 */
	ChallengeDTO dto = (ChallengeDTO) request.getAttribute("dto");
	int chall_id = 0;
	String chall_category = null;
	String chall_title = null;
	String chall_img = null;
	String chall_content = null;
	
	//dto의 존재 유무에 따라 form의 전송 페이지를 달리 한다.
	String formAction = "ChallengeAddServlet"; 
	
	if (dto != null) {
		chall_id = dto.getChall_id();
		chall_category = dto.getChall_category();
		chall_title = dto.getChall_title();
		chall_img = dto.getChall_img();
		chall_content = dto.getChall_content();
		formAction = "ChallengeUpdateServlet";
	}
	
	//session에 저장된 userid 읽어오기 
	MemberDTO member = (MemberDTO) session.getAttribute("login"); 
	String currUserid = null;
	if (member != null) {
		currUserid = member.getUserid();
	}
%>

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function () {
		
	});
</script>

<form action="<%= formAction %>" method="post">
<input type="hidden" name="chall_id" value="<%= chall_id %>">
<input type="hidden" name="userid" value="<%= currUserid %>">
<table border="1">
	<tr>
	  <td>
		<select name="chall_category">
		  <option value="" selected disabled hidden>분류 선택하기</option>
	 	  <option <% if("이 달의 챌린지".equals(chall_category)) {%>selected<%} %>>이 달의 챌린지</option>
	 	  <option <% if("쓰레기 줄이기".equals(chall_category)) {%>selected<%} %>>쓰레기 줄이기</option>
	 	  <option <% if("소비 줄이기".equals(chall_category)) {%>selected<%} %>>소비 줄이기</option>
	 	  <option <% if("아껴쓰기".equals(chall_category)) {%>selected<%} %>>아껴쓰기</option>
	 	  <option <% if("기부하기".equals(chall_category)) {%>selected<%} %>>기부하기</option>
		</select>
	  </td>
	  <td>
		제목: <input type="text" name="chall_title" <% if(chall_title!=null) {%>value="<%=chall_title%>"<%} %>>
	  </td>
	</tr>
	<tr>
	  <% if(chall_img==null) {%>
	  	<td colspan="2">사진 올리기<input type="text" name="chall_img"></td>
	  <%} else { %>
	 	<td colspan="2">
	 		<img src="images/<%= chall_img %>" width="500" height="500"><br>
	 		이미지수정하기<input type="text" name="chall_img" value="<%= chall_img %>">
	 	</td>
	  <%} %>
	</tr>
	<tr>
	  <td colspan="2">본문 작성<input type="text" name="chall_content" <% if(chall_content!=null) {%>value="<%=chall_content%>"<%} %>></td>
	</tr>
	<tr>
	  <td><a>취소</a></td>
	  <% if(dto==null) {%>
	 	<td><input type="submit" value="글쓰기"></td>
	  <%} else { %>
	  	<td><input type="submit" value="수정하기"></td>
	  <%} %>
	</tr>
</table>
</form>