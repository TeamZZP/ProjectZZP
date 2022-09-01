<%@page import="com.dto.StampDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.dto.PageDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
	//회원의 도장 목록 가져오기
	PageDTO pDTO = (PageDTO) request.getAttribute("pDTO");
	List<StampDTO> list = pDTO.getList();
	//페이징
	int perPage = pDTO.getPerPage(); 
	int totalCount = pDTO.getTotalCount();
	int totalPage = totalCount/perPage;
	if (totalCount%perPage!=0) totalPage++;
	int curPage = pDTO.getCurPage();
	
	String userid = null;
	if(list.size()>0) {
		userid = list.get(0).getUserid();
	}
%>   
    
<%
		for (StampDTO dto : list) {
			int stamp_id = dto.getStamp_id();
			String stamp_img = dto.getStamp_img();
			String stamp_name = dto.getStamp_name();
			String stamp_content = dto.getStamp_content();
	%>
     <div class="oneStamp col-xl-4 col-md-6">
       <div class="hover-zoomin">
			<img src="/eclipse/upload/<%=stamp_img%>" border="0" onerror="this.src='images/uploadarea.png'"
					 data-bs-toggle="modal" data-bs-target="#stampModal<%=stamp_id%>">
	   </div>
     </div>
     
     <!-- Modal -->
	<div class="modal fade" id="stampModal<%=stamp_id%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel"><%= stamp_name %></h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body text-center">
	      <img src="/eclipse/upload/<%=stamp_img%>" width="400">
	      </div>
	      <div class="modal-footer mb-3 text-center">
	       <%= stamp_content %>
	      </div>
	    </div>
	  </div>
	 </div>

	<%
	 	} //end for
	%>