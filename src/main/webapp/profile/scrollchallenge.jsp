<%@page import="java.util.HashMap"%>
<%@page import="com.dto.ChallengeDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.dto.PageDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	//회원의 챌린지 목록 가져오기
	PageDTO pDTO = (PageDTO) request.getAttribute("pDTO");
	//페이징
	int perPage = pDTO.getPerPage(); 
	int totalCount = pDTO.getTotalCount();
	int totalPage = totalCount/perPage;
	if (totalCount%perPage!=0) totalPage++;
	int curPage = pDTO.getCurPage();
	
	List<ChallengeDTO> challengeList = pDTO.getList();
	String userid = null;
	if(challengeList.size()>0) {
		userid = challengeList.get(0).getUserid();
	}
	//회원의 챌린지 개수 가져오기
	int challNum = (Integer) request.getAttribute("challNum");
	//각 게시글마다 도장 가져오기
	HashMap<String, String> stampListMap = (HashMap<String, String>) request.getAttribute("stampListMap");
	//회원의 프로필 이미지 가져오기
	String profile_img = (String) request.getAttribute("profile_img");
	
%>


<%
		for (int i=1; i<= challengeList.size(); i++) {
			ChallengeDTO dto = challengeList.get(i-1);
			int chall_id = dto.getChall_id();
			String chall_title = dto.getChall_title();
			String chall_content = dto.getChall_content();
			String chall_category = dto.getChall_category();
			int chall_hits = dto.getChall_hits();
			int chall_liked = dto.getChall_liked();
			String chall_created = dto.getChall_created();
			String chall_img = dto.getChall_img();
			int chall_comments = dto.getChall_comments();
	%>
					
     <div class="challengePost col-xl-4 col-md-6">
       <div class="p-3">
	       <a href="ProfileMainServlet?userid=<%=userid%>"><img src="images/<%=profile_img%>" width="30" height="30"></a>&nbsp;&nbsp;
	       <a href="ProfileMainServlet?userid=<%=userid%>"><%=userid%></a><br>
       </div>
       <div class="hover-zoomin">
	       <a href="ChallengeDetailServlet?chall_id=<%=chall_id%>"> 
			<img src="/eclipse/upload/<%=chall_img%>" border="0" onerror="this.src='images/uploadarea.png'">
			<% if (stampListMap.containsKey(String.valueOf(chall_id))) { %>
			<img src="/eclipse/upload/<%=stampListMap.get(String.valueOf(chall_id))%>" class="stamp">
			<%} %>
		   </a>
	   </div>
	   <div class="p-2 text-center">
	       <img src="images/like.png" width="30" height="30"> <%=chall_liked%> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		   <img src="images/bubble.png" width="30" height="25"> <%=chall_comments%>
	   </div>
	   <div class="pb-5 text-center">
	   		<a href="ChallengeDetailServlet?chall_id=<%=chall_id%>"><%=chall_title%></a>
	   </div>
     </div>
	<%
	 	} //end for
	%>
