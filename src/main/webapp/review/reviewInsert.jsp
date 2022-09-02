<%@page import="java.util.List"%>
<%@page import="com.dto.ProductOrderReviewDTO"%>
<%@page import="com.dto.PageDTO"%>
<%@page import="com.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <%
    	MemberDTO mDTO = (MemberDTO)session.getAttribute("login");
    	String userid = "";
    	if(mDTO == null){
    %>
	    <script>
	    $(function() {
	    	alert("로그인이 필요합니다");
	    	$("#reviewForm").attr("action", "LoginUIServlet");
	    	$("#reviewForm").submit();
		});//
	    </script>
    <%
    	} else {
    		userid = mDTO.getUserid();
    	}
    %>
    <%
  	 	String operate = "upload";
    %>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#REVIEW_TITLE").focus();
			$("#reviewInsert").click(function() {
				var REVIEW_TITLE = $("#REVIEW_TITLE").val();
				var REVIEW_CONTENT = $("#REVIEW_CONTENT").val();
				if (REVIEW_TITLE.length == 0) {
					alert("제목을 입력하십시오");
					event.preventDefault();
				} else if (REVIEW_CONTENT.length == 0) {
					alert("내용을 입력하십시오");
					event.preventDefault();
				}
			});//
			$("#reviewList").click(function () {
				$("#reviewForm").attr("action", "MyOrderServlet");
			});//
			$("#reviewInsert").click(function () {
				var operate = $("#reviewInsert").attr("data-operate");
				var userid = $("#reviewInsert").attr("data-userid");
				var REVIEW_IMG = $("#REVIEW_IMG").val();
				console.log(REVIEW_IMG);
				$("#reviewForm").attr("action", "reviewUploadServlet?USERID="+userid+"&operate="+operate);
			}); //
			function checkFileExtension(){ 
				let fileValue = $("#qFile").val(); 
				let reg = /(.*?)\.(jpg|jpeg|png|gif)$/;
				if (fileValue.match(reg)) {
					return true;
				} else {
					alert("jpg, jpeg, png, gif 파일만 업로드 가능합니다.");
					return false;
				}
			}//
		});//end ready
	</script>
<div style="text-align: center; display: flex; justify-content:center; height: 100px; margin-bottom: 10px;" >
		<img src="" alt="..." style="width: auto;">
</div>

<form id="reviewForm" enctype="multipart/form-data" method="post">
<input type="hidden" name="USERID" value="<%=userid%>">
<input type="hidden" name="oldFile" value="">
<div class="container justify-content-center">
<div class="row">
		<table>
		<%
			int ORDER_ID = Integer.parseInt(request.getParameter("ORDER_ID"));
			String P_NAME = request.getParameter("P_NAME");
			int P_ID = Integer.parseInt(request.getParameter("P_ID"));
		%>
			<tr> 
				<td> 
					<input type="hidden" name="ORDER_ID" value="<%=ORDER_ID%>">
					<input type="hidden" name="P_ID" value="<%=P_ID%>">
					<div class="input-group">
					  <span class="input-group-text">주문한 상품</span>
					  <input type="text" class="form-control" value="<%=P_NAME%>" readonly="readonly">
					</div>
				</td>
				<td colspan="2"> 
					<div class="input-group">
					  <label class="input-group-text" for="inputGroupSelect01">구매 만족도</label>
					  <select class="form-select"  name="REVIEW_RATE">
					    <option value="만족" selected>만족</option>
					    <option value="보통">보통</option>
					    <option value="불만족">불만족</option>
					  </select>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2"> 
					<div class="input-group">
					  <span class="input-group-text">제목</span>
					  <input type="text" class="form-control" name="REVIEW_TITLE" id="REVIEW_TITLE">
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div>
					  <textarea class="form-control" rows="15" cols="50" name="REVIEW_CONTENT" id="REVIEW_CONTENT" placeholder="내용을 입력하십시오."></textarea>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div>
					  <input class="form-control" accept="image/*" type="file" name="REVIEW_IMG" id="REVIEW_IMG" multiple>
					</div>
				</td>
			</tr>
			<tr>
				<td> <button id="reviewList" class="btn btn-success">목록</button> </td>
				<td style="text-align: right;">
					<button id="reviewInsert" data-userid="<%=userid %>" data-operate="<%=operate %>" class="btn btn-success">등록</button>
					<button id="reviewCancel" type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#bb">취소</button>
					
					<div class="modal fade" id="bb" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="staticBackdropLabel">취소</h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <div class="modal-body" style="text-align: left;">
					        이전 페이지로 돌아가시겠습니까?
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-success" onclick="history.back()">확인</button>
					        <button type="button" class="btn btn-success" data-bs-dismiss="modal">취소</button>
					      </div>
					    </div>
					  </div>
					</div>
				</td>
			</tr>
		</table>
</div>
</div>
</form>    