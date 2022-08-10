<%@page import="com.dto.MemberDTO"%>
<%@page import="com.dto.QuestionDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	QuestionDTO qDTO = (QuestionDTO)session.getAttribute("questionOneSelect");
	System.out.print("questionUpdate " + qDTO);
	
	String operate = "update";
	
	MemberDTO mDTO = (MemberDTO)session.getAttribute("login");
	String userid = "";
	if(mDTO != null){
		userid = mDTO.getUserid();
	}
%>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function () {
		if ($("#pId").val() == "null") {
			$("#pId").val("");
		}
		$("#questionUpdate").click(function () {
			var operate = $("#questionUpdate").attr("data-operate");
			var userid = $("#questionUpdate").attr("data-userid");
			$("#questionForm").attr("action", "QuestionUploadServlet?USERID="+userid+"&operate="+operate);  
		})
		$("#pID").click(function () {
			window.open("questionproductSelect.jsp","","width=400px height=500px");
		});
		$("#QuestionList").click(function () {
			$("#questionForm").attr("action", "QuestionListServlet");
		})
	});//end ready
</script>
<div style="text-align: center; display: flex; justify-content:center; height: 100px; margin-bottom: 10px;" >
		<img src="images/question.png" alt="..." style="width: auto;">
</div>
<form action="" id="questionForm" method="post" enctype="multipart/form-data">
<div class="container justify-content-center">
<div class="row">
 <input type="hidden" name="Q_ID" value="<%=qDTO.getQ_ID()%>">
 <input type="hidden" name="USERID" value="<%=userid%>">
		<table>
			<tr>
				<td colspan="2">
					<div class="input-group">
					  <span class="input-group-text">제목</span>
					  <input type="text" class="form-control" name="Q_TITLE" id="qTittle" value="<%=qDTO.getQ_TITLE()%>">
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2"> 
					<div class="input-group">
					  <button id="pID" class="btn btn-outline-secondary" type="button">상품 정보</button>
					  <input type="text" class="form-control" value="<%=qDTO.getP_ID()%>" name="P_ID" id="pId">
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2"> 
					<div class="input-group">
					  <label class="input-group-text" for="inputGroupSelect01">문의 글 카테고리</label>
					  <select class="form-select"  name="Q_BOARD_CATEGORY">
					   	<option value="1" <%if(1 == qDTO.getQ_BOARD_CATEGORY()){ %>selected="selected"<%}%>>상품문의</option>
						<option value="2" <%if(2 == qDTO.getQ_BOARD_CATEGORY()){ %>selected="selected"<%}%>>문의 게시판</option>
					  </select>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2"> 질문 카테고리
					<div class="input-group">
					  <label class="input-group-text" for="inputGroupSelect01">질문 카테고리</label>
					  <select name="Q_CATEGORY" class="form-select">
					    <option <%if("상품".equals(qDTO.getQ_CATEGORY())){ %>selected="selected"<%} %>>상품</option>
						<option <%if("배송".equals(qDTO.getQ_CATEGORY())){ %>selected="selected"<%} %>>배송</option>
						<option <%if("교환".equals(qDTO.getQ_CATEGORY())){ %>selected="selected"<%} %>>교환</option>
						<option <%if("환불".equals(qDTO.getQ_CATEGORY())){ %>selected="selected"<%} %>>환불</option>
						<option <%if("기타".equals(qDTO.getQ_CATEGORY())){ %>selected="selected"<%} %>>기타</option>
					  </select>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<textarea class="form-control" rows="15" cols="50" name="Q_CONTENT" id="qContent"><%= qDTO.getQ_CONTENT() %></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div>
					  <label for="formFileMultiple" class="form-label">올린 첨부파일</label>
					  <img alt="" src="/eclipse/upload/<%=qDTO.getQ_IMG()%>" width="100px" height="100px"> <br>
					  <label for="formFileMultiple" class="form-label">변경할 첨부파일</label>
					  <input class="form-control" type="file" accept="image/*" name="qFile">
					</div>
				</td>
			</tr>
			<tr>
				<td> <button id="QuestionList" class="btn btn-outline-success" >목록</button> </td>
				<td style="text-align: right;">
					<button type="submit" id="questionUpdate" class="btn btn-outline-success" data-userid="<%=userid %>" data-operate="<%=operate %>" >등록</button>
					<button type="reset" class="btn btn-outline-success" >취소</button>
				</td>
			</tr>
		</table>
</div>
</div>
</form>