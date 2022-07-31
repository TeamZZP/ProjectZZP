<%@page import="java.util.List"%>
<%@page import="com.dto.ChallengeDTO"%>
<%@page import="com.dto.PageDTO"%>
<%@page import="com.dto.MemberDTO"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	HashMap<String, String> profileMap = (HashMap<String, String>) request.getAttribute("profileMap");
	String userid = profileMap.get("USERID");
	String profile_img = profileMap.get("PROFILE_IMG");
	String profile_txt = profileMap.get("PROFILE_TXT");
	
	PageDTO pDTO = (PageDTO) request.getAttribute("pDTO");
	List<ChallengeDTO> challList = pDTO.getList();
	
	//session에 저장된 userid 읽어오기 
	MemberDTO member = (MemberDTO) session.getAttribute("login"); 
	String currUserid = null;
	if (member != null) {
		currUserid = member.getUserid();
	}
%>

<table border="1" style="float: left">
  <tr>
    <td>
      <img src="images/<%= profile_img %>" width="200" border="0" align="middle"><br>
      <%= userid %><br>
      <%= profile_txt %><br>
      <% if (userid.equals(currUserid)) { %>
      	<a href="">수정</a>
      <%} %>
    </td>
  </tr>
</table>

<table border="1">
  <tr>
    <td colspan="2">챌린지</td>
    <td>전체보기</td>
  </tr>
  <tr>
    <td colspan="3">
      <table>
        <tr>
        <% for (int i=0; i<3; i++) { 
        	ChallengeDTO challDTO = challList.get(i);
        	int chall_id = challDTO.getChall_id();
        	String chall_img = challDTO.getChall_img();
        %>
        	<td>
        	<a href="ChallengeDetailServlet?chall_id=<%=chall_id%>"> 
				<img src="images/<%=chall_img%>" border="0" align="middle"
						width="150" height="150"></a>
        	</td>
        <% } %>
        </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td height="10"></td>
  </tr>
  
</table>

