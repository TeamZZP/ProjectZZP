<%@page import="java.util.HashMap"%>
<%@page import="com.dto.ChallengeDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
    //회원의 챌린지 목록 가져오기
 	List<ChallengeDTO> list = (List<ChallengeDTO>) request.getAttribute("challengeList");
	//각 게시글마다 도장 가져오기
	HashMap<String, String> stampListMap = (HashMap<String, String>) request.getAttribute("stampListMap");
	//회원의 프로필 이미지 가져오기
	String profile_img = (String) request.getAttribute("profile_img");
%>

<style>
	/*ZoomIn Hover Effect*/
     .hover-zoomin a {
      display: block;
      position: relative;
      overflow: hidden;
      border-radius: 15px;
    }
    .hover-zoomin img:not(.stamp) {
      width: 100%;
      height: auto;
      -webkit-transition: all 0.2s ease-in-out;
      -moz-transition: all 0.2s ease-in-out;
      -o-transition: all 0.2s ease-in-out;
      -ms-transition: all 0.2s ease-in-out;
      transition: all 0.2s ease-in-out;
    }
    .hover-zoomin:hover img:not(.stamp) {
      -webkit-transform: scale(1.1);
      -moz-transform: scale(1.1);
      -o-transform: scale(1.1);
      -ms-transform: scale(1.1);
      transform: scale(1.1);
    } 
    .stamp {
    	position: absolute; 
		left: 198px; 
		top: -15px; 
    }
</style>



<div class="row">

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
			int chall_comments = dto.getChall_comments();
	%>
					
     <div class="col-lg-4 col-sm-6">
       <div class="p-3">
	       <a href="ProfileMainServlet?userid=<%=userid%>"><img src="images/<%=profile_img%>" width="30" height="30"></a>&nbsp;&nbsp;
	       <a href="ProfileMainServlet?userid=<%=userid%>"><%=userid%></a><br>
       </div>
       <div class="hover-zoomin">
	       <a href="ChallengeDetailServlet?chall_id=<%=chall_id%>"> 
			<img src="/eclipse/upload/<%=chall_img%>" border="0" onerror="this.src='images/uploadarea.png'">
			<% if (stampListMap.containsKey(String.valueOf(chall_id))) { %>
			<img src="/eclipse/upload/<%=stampListMap.get(String.valueOf(chall_id))%>" class="stamp" width="110" height="110">
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
	
</div>
