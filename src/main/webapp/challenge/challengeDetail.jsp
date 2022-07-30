<%@page import="com.dto.MemberDTO"%>
<%@page import="com.dto.ChallengeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	ChallengeDTO dto = (ChallengeDTO) request.getAttribute("dto");
	int chall_id = dto.getChall_id();
	String userid = dto.getUserid();
	String chall_title = dto.getChall_title();
	String chall_content = dto.getChall_content();
	String chall_category = dto.getChall_category();
	int chall_hits = dto.getChall_hits();
	int chall_liked = dto.getChall_liked();
	String chall_created = dto.getChall_created();
	String chall_img = dto.getChall_img();
	
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
		$("#deleteChallenge").on("click", function () {
			var mesg = "정말 삭제하시겠습니까? 한번 삭제한 글은 되돌릴 수 없습니다.";
			if (!confirm(mesg)) {
				event.preventDefault();
			}
		});
	});
</script>
</head>
<body>

<table border="1">
	<tr>
	  <td><%= chall_category %></td>
	  <td><%= chall_title %></td>
	  <td>
	  <!-- 해당 게시글의 글쓴이인 경우 -->
	  <% if (userid.equals(currUserid)) { %>
	  	<a href="ChallengeUIServlet?chall_id=<%= chall_id %>&userid=<%= currUserid %>">수정 </a>
	  	<a href="ChallengeDeleteServlet?chall_id=<%= chall_id %>&userid=<%= currUserid %>" id="deleteChallenge">삭제</a>
	  <% } else { %>
	  <!-- 그외의 경우 -->
	    <a href="">신고</a>
	  <% } %>
	  </td>
	</tr>
	<tr>
	  <td><%= chall_created %></td>
	  <td></td>
	  <td>조회수 <%= chall_hits %></td>
	</tr>
	<tr>
	  <td>프로필사진</td>
	  <td colspan="2"><%= userid %></td>
	</tr>
	<tr>
	  <td colspan="3"><img src="images/<%= chall_img %>" width="500" height="500"></td>
	</tr>
	<tr>
	  <td>♥ <%= chall_liked %></td>
	  <td></td>
	  <td>◇댓글수</td>
	</tr>
	<tr>
	  <td colspan="4"><%= chall_content %></td>
	</tr>
	<tr>
	  <td colspan="4">댓글목록</td>
	</tr>
	<tr>
	  <td colspan="4">댓글작성하기</td>
	</tr>
	<tr>
	  <td><a href="ChallengeListServlet">목록</a></td>
	  <td></td>
	  <td><a href="challengeWrite.jsp">글쓰기</a></td>
	</tr>
</table>