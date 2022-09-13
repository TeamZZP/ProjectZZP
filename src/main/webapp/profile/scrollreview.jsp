<%@page import="com.dto.MemberDTO"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.dto.ReviewDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.dto.PageDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//회원의 리뷰 목록 가져오기
	PageDTO pDTO = (PageDTO) request.getAttribute("reviewPageDTO");
	List<ReviewDTO> reviewList = pDTO.getList();
	//페이징
	int perPage = pDTO.getPerPage(); 
	int totalCount = pDTO.getTotalCount();
	int totalPage = totalCount/perPage;
	if (totalCount%perPage!=0) totalPage++;
	int curPage = pDTO.getCurPage();
	
	//리뷰에 해당하는 상품 정보 가져오기
	HashMap<Integer, HashMap<String, String>> prodMap = (HashMap<Integer, HashMap<String, String>>) request.getAttribute("prodMap");
	
	//session에 저장된 userid 읽어오기 
	MemberDTO member = (MemberDTO) session.getAttribute("login"); 
	String userid = null;
	if (member != null) {
		userid = member.getUserid();
	}

%>

<% for (int i = 0; i < reviewList.size(); i++) {	
	ReviewDTO dto = reviewList.get(i);
	int review_id = dto.getReview_id();
	int p_id = dto.getP_id();
	String review_title = dto.getReview_title();
	String review_content = dto.getReview_content();
	String review_rate = dto.getReview_rate();
	String review_img = dto.getReview_img();
	String review_created = dto.getReview_create().substring(0,10);
	
	HashMap<String, String> map = prodMap.get(p_id);
	String p_name = map.get("P_NAME");
	String image_route = map.get("IMAGE_ROUTE");
%>
	<tr class="reviewPost">
		<td style="padding:5 0 0 10px;" width="30%" class="text-center">
			<a href="ProductRetrieveServlet?p_id=<%=p_id%>"> 
			<img src="images/p_image/<%=image_route%>" border="0" align="middle" class="img pb-1"
					 style="width: 70%;"	onerror="this.src='images/uploadarea.png'"><br>
			<%= p_name %></a>
		</td>
		<td width="50%" class="align-middle">
			  <b><%= review_title %></b><br><br>
			  <%= review_content %><br>
			  <%= review_rate %>
		</td>
		<td width="20%" class="align-middle">
			<div><%= review_created %></div>
		</td>
	</tr>
<%
		}
%>