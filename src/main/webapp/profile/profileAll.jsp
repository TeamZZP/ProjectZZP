<%@page import="com.dto.ChallengeDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//해당 회원 아이디 가져오기
	String userid = (String) request.getAttribute("userid");
	//회원의 챌린지 목록 가져오기
	List<ChallengeDTO> challengeList = (List<ChallengeDTO>) request.getAttribute("challengeList");
	int challNum = challengeList.size();
	if (challNum > 4) {
		challNum = 4;
	}
%>

		<div>
		  <div class="row p-2 mx-4">
		    <div class="col">챌린지 <span class="text-success fw-bold"><%= challengeList.size() %></span></div>
			 <div class="col"><div class="float-end"><small><a class="category" data-category="challenge">전체보기</a></small></div></div>
		  </div>
		  <div class="text-center mt-2">
		        <% for (int i = 0; i < challNum; i++) { 
		        	ChallengeDTO challDTO = challengeList.get(i);
		        	int chall_id = challDTO.getChall_id();
		        	String chall_img = challDTO.getChall_img();
		        %>
		        <a href="ChallengeDetailServlet?chall_id=<%=chall_id%>"> 
					<img src="/eclipse/upload/<%=chall_img%>" border="0" align="middle" class="img"
						width="200" height="200" onerror="this.src='images/uploadarea.png'"></a>
		        <% } 
		        if (challNum < 4) {
		        	System.out.println(challNum);
		        	for (int i = 0; i < 4-challNum; i++) {
		        %>
		        	<img src="images/none.png" class="img" width="200" height="200" >
		        <% }
		        } %>
	      </div>
		</div>