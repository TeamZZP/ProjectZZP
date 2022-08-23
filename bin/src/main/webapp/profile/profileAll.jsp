<%@page import="java.util.Set"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.HashMap"%>
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
	//회원의 도장 목록 가져오기
	LinkedHashMap<String, String> stampImgMap = (LinkedHashMap<String, String>) request.getAttribute("stampImgMap");
	
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
		
		
		
		
		
		<div>
		  <div class="row p-2 mx-4 mt-5">
		    <div class="col">도장 <span class="text-success fw-bold"><%= stampImgMap.size() %></span></div>
			 <div class="col"><div class="float-end"><small><a class="category" data-category="stamp">전체보기</a></small></div></div>
		  </div>
		  <div class="text-center mt-2">
		        <%  Set<String> keySet = stampImgMap.keySet();
		        		System.out.println(keySet);
		       		int count = 0;
		        	for (String key : keySet) {
		        		String stamp_img = stampImgMap.get(key);
		        %>
					<img src="/eclipse/upload/<%=stamp_img%>" border="0" align="middle" class="img"
						width="200" height="200" onerror="this.src='images/uploadarea.png'">
		        <%  	count++;
		        		if (count==4) break;
		        	} 
		        if (stampImgMap.size() < 4) {
		        	for (int i = 0; i < 4-stampImgMap.size(); i++) {
		        %>
		        	<img src="images/none.png" class="img" width="200" height="200" >
		        <% }
		        } %>
	      </div>
		</div><!-- end stamp -->