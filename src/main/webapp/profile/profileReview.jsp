<%@page import="com.dto.ReviewDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.dto.MemberDTO"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.dto.PageDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//회원의 리뷰 목록 가져오기
	PageDTO reviewPageDTO = (PageDTO) request.getAttribute("reviewPageDTO");
	List<ReviewDTO> reviewList = reviewPageDTO.getList();
	
	//리뷰에 해당하는 상품 정보 가져오기
	HashMap<Integer, HashMap<String, String>> prodMap = (HashMap<Integer, HashMap<String, String>>) request.getAttribute("prodMap");

	//session에 저장된 userid 읽어오기 
	MemberDTO member = (MemberDTO) session.getAttribute("login"); 
	String currUserid = null;
	if (member != null) {
		currUserid = member.getUserid();
	}

%>

<style>
-
</style>

<div class="row">
<table id="reviewTable" class="table table-hover table-borderless" style="table-layout: fixed">
	
<% for (int i = 0; i < reviewList.size(); i++) {	
	ReviewDTO dto = reviewList.get(i);
	int review_id = dto.getREVIEW_ID();
	int p_id = dto.getP_ID();
	String review_title = dto.getREVIEW_TITLE();
	String review_content = dto.getREVIEW_CONTENT();
	String review_rate = dto.getREVIEW_RATE();
	String review_img = dto.getREVIEW_IMG();
	String review_created = dto.getREVIEW_CREATED();
	
	HashMap<String, String> map = prodMap.get(p_id);
	String p_name = map.get("P_NAME");
	String image_route = map.get("IMAGE_ROUTE");
%>
	<tr>
		<td style="padding:5 0 0 10px;" width="30%" class="text-center">
			<span> <a href="ProductRetrieveServlet?p_id=<%=p_id%>"> 
					<img src="images/p_image/<%=image_route%>" border="0" align="middle" class="img"
					 style="width: 70%;"	onerror="this.src='images/uploadarea.png'"></a></span><br>
			<span><%= p_name %></span>
		</td>
		<td width="50%">
			<table>
			  <tr height="20%"><td><%= review_title %></td></tr>
			  <tr height="60%"><td><%= review_content %></td></tr>
			  <tr height="20%"><td><%= review_rate %></td></tr>
			</table>
		</td>
		<td width="20%" style="text-align: center;">
			<span><%= review_created %></span>
		</td>
<%
		}
%>
	</tr>
	
	
	
</table>

</div>