<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.dto.PageDTO"%>
<%@page import="com.dto.ChallengeDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	a {
		text-decoration: none;
		color: black;
	}
	/*ZoomIn Hover Effect*/
     .hover-zoomin a {
      display: block;
      position: relative;
      overflow: hidden;
      border-radius: 15px;
    }
    .hover-zoomin img {
      width: 100%;
      height: auto;
      -webkit-transition: all 0.2s ease-in-out;
      -moz-transition: all 0.2s ease-in-out;
      -o-transition: all 0.2s ease-in-out;
      -ms-transition: all 0.2s ease-in-out;
      transition: all 0.2s ease-in-out;
    }
    .hover-zoomin:hover img {
      -webkit-transform: scale(1.1);
      -moz-transform: scale(1.1);
      -o-transform: scale(1.1);
      -ms-transform: scale(1.1);
      transform: scale(1.1);
    } 
    
    .form-select {
    	display: inline;
    	width: 150px;
    }
    

</style>
<%
	PageDTO pDTO = (PageDTO) request.getAttribute("pDTO");
	List<ChallengeDTO> list = pDTO.getList();
	String searchName = (String) request.getAttribute("searchName");
	String searchValue = (String) request.getAttribute("searchValue");
	String sortBy = (String) request.getAttribute("sortBy");

	//프로필 가져오기
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
 	$(document).ready(function () {
 		//정렬 기준 선택시 form 제출
		$("#sortBy").on("change", function () {
			$("form").submit();
		});
	}); 
</script>

<form action="ChallengeListServlet">
<div class="container">
   <div class="row">
     <div class="col-sm-6">
       <a href="ChallengeDetailServlet?chall_id=1" class="">[이 달의 챌린지] 용기내! 챌린지</a>
     </div>
     <div class="col-sm-6">
       <div class="float-end">
		<select name="sortBy" id="sortBy" class="form-select">
			<option value="chall_id" selected>정렬</option>
			<option value="chall_id" <%if ("chall_id".equals(sortBy)) {%>selected <%}%>>최신순</option>
			<option value="chall_liked" <%if ("chall_liked".equals(sortBy)) {%>selected <%}%>>인기순</option>
			<option value="chall_comments" <%if ("chall_comments".equals(sortBy)) {%> selected <%}%>>댓글 많은순</option>
		</select> 
		<a href="ChallengeUIServlet" class="btn btn-outline-success" style="margin-bottom: 5px;">글쓰기</a>
	   </div>
	 </div>
	 <div style="height: 10px"></div>
	 
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
			
			HashMap<String, String> map = profileList.get(i-1);
			String profile_img = map.get("PROFILE_IMG");
	%>
					
     <div class="col-lg-3 col-md-4 col-sm-6">
       <div class="p-3">
	       <a href="ProfileMainServlet?userid=<%=userid%>"><img src="images/<%=profile_img%>" width="30" height="30"></a>&nbsp;&nbsp;
	       <a href="ProfileMainServlet?userid=<%=userid%>"><%=userid%></a><br>
       </div>
       <div class="hover-zoomin">
	       <a href="ChallengeDetailServlet?chall_id=<%=chall_id%>"> 
			<img src="/eclipse/upload/<%=chall_img%>" border="0" onerror="this.src='images/uploadarea.png'"></a>
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

	<!-- 검색기능 -->
	<div class="d-flex justify-content-center p-2">
		<select name="searchName" class="form-select p-2">
			<option value="userid" <% if("userid".equals(searchName)) {%>selected<%} %>>아이디</option>
			<option value="chall_title" <% if("chall_title".equals(searchName)) {%>selected<%} %>>제목</option>
			<option value="chall_content" <% if("chall_content".equals(searchName)) {%>selected<%} %>>내용</option>
		</select>
		&nbsp;
		<input type="text" name="searchValue" class="form-control" style="width: 200px;" <% if(searchValue!=null && !searchValue.equals("null")) {%>value="<%=searchValue%>"<%} %>>
		&nbsp;
		<button class="btn btn-outline-success">검색</button>
	</div>
		
	<!-- 페이징 -->
	  <div class="p-2 text-center">
	  <% 
		    int curPage = pDTO.getCurPage(); 
		    int perPage = pDTO.getPerPage(); 
		    int totalCount = pDTO.getTotalCount();
		    int totalPage = totalCount/perPage;
		    if (totalCount%perPage!=0) totalPage++;
		    for (int p=1; p<=totalPage; p++) {
		    	if (p==curPage) {
		    		out.print("<b>"+p+"</b>&nbsp;&nbsp;");
		    	} else {
		    		out.print("<a href='ChallengeListServlet?curPage="+p
		    				+"&searchName="+searchName+"&searchValue="+searchValue
		    				+"&sortBy="+sortBy+"'>"+p+"</a>&nbsp;&nbsp;");
		    	} 
		    }
	  %>
	  </div>
   </div>
</div> 	
</form>    
    
    