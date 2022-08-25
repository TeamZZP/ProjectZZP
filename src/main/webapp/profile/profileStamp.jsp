<%@page import="com.dto.StampDTO"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.LinkedHashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//회원의 도장 목록 가져오기
	LinkedHashMap<Integer, StampDTO> stampMap = (LinkedHashMap<Integer, StampDTO>) request.getAttribute("stampMap");
%>

<style>
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
      -webkit-transform: scale(1.05);
      -moz-transform: scale(1.05);
      -o-transform: scale(1.05);
      -ms-transform: scale(1.05);
      transform: scale(1.05);
    } 
</style>


<div class="row">

<%

		Set<Integer> keySet = stampMap.keySet();
		System.out.println(keySet);
		int count = 0;
		for (Integer key : keySet) {
			StampDTO dto = stampMap.get(key);
			int stamp_id = dto.getStamp_id();
			String stamp_img = dto.getStamp_img();
			String stamp_name = dto.getStamp_name();
			String stamp_content = dto.getStamp_content();
	%>
					
     <div class="col-lg-4 col-sm-6">
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
	
</div>
