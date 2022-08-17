<%@page import="com.dto.MemberDTO"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.dto.CommentsDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <% 
 List<CommentsDTO> commentsList = (List<CommentsDTO>) request.getAttribute("commentsList");
 HashMap<String, String> profileMap = (HashMap<String, String>) request.getAttribute("profileMap");
 String currProfile_img = (String) request.getAttribute("currProfile_img");
 
  //session에 저장된 userid 읽어오기 
	MemberDTO member = (MemberDTO) session.getAttribute("login"); 
	String currUserid = null;
	if (member != null) {
		currUserid = member.getUserid();
	}
 
	
	HashMap<Integer, String> parentMap = new HashMap<Integer, String>();
    for (CommentsDTO comment : commentsList) {
    	int comment_id = comment.getComment_id();
    	String comment_content = comment.getComment_content();
    	String comment_created = comment.getComment_created();
    	String commentUserid = comment.getUserid();
    	int parent_id = comment.getParent_id();
    	int group_order = comment.getGroup_order();
    	int step = comment.getStep();
    	parentMap.put(comment_id, commentUserid);
		%>
        <div class="d-flex flex-row p-3"> 
          <% if (step != 0) { %>
          <div style="width: 60px;"></div>
          <% } %>
        	<div class="profile">
        		<a href="ProfileMainServlet?userid=<%= commentUserid %>">
        			<img src="images/<%= profileMap.get(commentUserid) %>" width="30" height="30" class="rounded-circle mr-3"></a>
            </div>
            <div class="w-100">
                <div class="d-flex justify-content-between align-items-center">
                    <div class="d-flex flex-row align-items-center"> 
                    	<a href="ProfileMainServlet?userid=<%= commentUserid %>">
                    	<span class="mr-2"><%= commentUserid %></span></a> 
                    </div> 
                    <small id="commentTime<%= comment_id %>"></small>
                    	<script>$("#commentTime<%= comment_id %>").html(displayedAt('<%= comment_created %>'));</script>
                </div>
                <p class="text-justify mb-0">
                	<% if (step != 0) { %><span style="color: green;">@<%= parentMap.get(parent_id) %> &nbsp;</span><% } %>
                	<%= comment_content %></p>
                <div class="d-flex flex-row user-feed"> 
                	<a class="reply ml-3" data-cid="<%= comment_id %>" data-user="<%= commentUserid %>">답글 달기</a> &nbsp;&nbsp;&nbsp;
                	<!-- 해당 댓글의 작성자인 경우 -->
                	<% if (commentUserid!=null && commentUserid.equals(currUserid)) { %>
					<a class="ml-3 commentDelBtn" data-cid="<%= comment_id %>">삭제</a> 
					<!-- 그외의 경우 --> 
					<% } else { %> 
					<a class="ml-3">신고</a> 
					<% } %>
                </div>
            </div>
        </div>
        
        
        <!-- 답글 입력창 -->
        <div id="reply<%= comment_id %>" style="display: none;">
            <div class="d-flex flex-row p-3">
            	<div style="width: 60px;"></div>
            	<div class="profile">
            		<img src="images/<%= currProfile_img %>" width="30" height="30" class="rounded-circle mr-3">
            	</div>
            	<div class="reply_box d-flex flex-row align-items-center w-100 text-justify mb-0">
            		<%-- <label class="idTag">@<%= commentUserid %></label> --%>
            		<input type="text" class="reply_content form-control" name="comment_content" id="reply_content<%= comment_id %>"> 
            		<button class="commentBtn commentReplyBtn" 
            			data-cid="<%= comment_id %>" data-group="<%= group_order %>"
            			data-parent="<%= parentMap.get(parent_id) %>">입력</button>
            			<!-- 답글 대상 아이디 보이기 -->
                		<script type="text/javascript">
                		 $("#reply_content<%= comment_id %>").on("input", function () {
        					if (String($(this).val()).indexOf("@<%= commentUserid %>  ") == -1) {
        						$(this).val("@<%= commentUserid %>  ");
        					}
        				 }); 
                		</script>
            	</div>
            </div>
        </div>
    <%} %><!-- end for -->
    