<%@page import="java.util.List"%>
<%@page import="com.dto.PageDTO"%>
<%@page import="com.dto.MemberDTO"%>
<%@page import="com.dto.StampDTO"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.LinkedHashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//회원의 도장 목록 가져오기
	PageDTO pDTO = (PageDTO) request.getAttribute("pDTO");
	List<StampDTO> list = pDTO.getList();
	int totalCount = pDTO.getTotalCount();
	//session에 저장된 userid 읽어오기 
	MemberDTO member = (MemberDTO) session.getAttribute("login"); 
	String userid = null;
	if (member != null) {
		userid = member.getUserid();
	}
%>

<style>
	a {
		color : black;
		text-decoration: none;
	}
	.currCategory {
		color: green; 
		font-weight: bold;
	}
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


<div class="container">
<div class="row">
	<div class="col-lg-2">
		<div class="col">
			<a href="MypageServlet">마이페이지 홈</a>
		</div>
	   <div class="col">
			<a href="MyOrderServlet">주문 내역</a> 
		</div>
	   <div class="col">반품/취소/교환 목록</div>
	   <div class="col">
	   		<a href="ProfileCategoryServlet?category=myreview&userid=<%=userid%>">내 구매후기</a>
	   </div>
	   <div class="col">
	   		<a href="ProfileCategoryServlet?category=mychallenge&userid=<%=userid%>">내 챌린지</a>
	   </div>
	   <div class="col">
	   		<a href="ProfileCategoryServlet?category=mystamp&userid=<%=userid%>" class="currCategory">내 도장</a>
	   </div>
	   <div class="col">
	      <a href="MyQuestionServlet">내 문의 내역</a>
	   </div>
	   <div class="col">
	      <a href="AddressListServlet">배송지 관리</a>
	   </div>
	   <div class="col">
	      <a href="checkPasswd.jsp">계정 관리</a>
	   </div>
	</div>
<div class="col-lg-10">

<table class="table table-hover text-center">
	<tr class="table-success">
		<th>내 도장 <span class="text-success fw-bold"><%= totalCount %></span></th>
	</tr>
</table>

<div class="row ms-3">

<%
for (StampDTO dto : list) {
	int stamp_id = dto.getStamp_id();
	String stamp_img = dto.getStamp_img();
	String stamp_name = dto.getStamp_name();
	String stamp_content = dto.getStamp_content();
	%>
					
     <div class="col-xl-4 col-md-6">
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


	<!-- 페이징 -->
	  <div class="p-2 text-center">
	  <% 
		    int curPage = pDTO.getCurPage(); 
		    int perPage = pDTO.getPerPage(); 
		    int totalPage = totalCount/perPage;
		    if (totalCount%perPage!=0) totalPage++;
		    for (int p=1; p<=totalPage; p++) {
		    	if (p==curPage) {
		    		out.print("<b>"+p+"</b>&nbsp;&nbsp;");
		    	} else {
		    		out.print("<a href='ProfileCategoryServlet?category=mystamp&userid="+userid+"&curPage="+p+"'>"+p+"</a>&nbsp;&nbsp;");
		    	} 
		    }
	  %>
	  </div>


</div>
</div>
</div>