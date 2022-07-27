<%@page import="com.dto.ChallengeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	ChallengeDTO dto = (ChallengeDTO) request.getAttribute("dto");
%>
<script type="text/javascript">
function back() {
	history.back(); //이전페이지로 이동
}
</script>
</head>
<body>

<table border="1">
	<tr>
	  <td><%= dto.getChall_category() %></td>
	  <td><%= dto.getChall_title() %></td>
	  <td><%= dto.getChall_created() %></td>
	</tr>
	<tr>
	  <td>프로필사진</td>
	  <td colspan="2"><%= dto.getUserid() %></td>
	</tr>
	<tr>
	  <td colspan="3"><img src="img/<%= dto.getChall_img() %>" width="500" height="500"></td>
	</tr>
	<tr>
	  <td>♥ <%= dto.getChall_liked() %></td>
	  <td>◇</td>
	  <td></td>
	</tr>
	<tr>
	  <td colspan="3"><%= dto.getChall_content() %></td>
	</tr>
	<tr>
	  <td colspan="3">댓글목록</td>
	</tr>
	<tr>
	  <td colspan="3">댓글작성하기</td>
	</tr>
	<tr>
	  <td><a href="javascript:back()">목록</a></td>
	  <td></td>
	  <td><a href="challengeWrite.jsp">글쓰기</a></td>
	</tr>
</table>