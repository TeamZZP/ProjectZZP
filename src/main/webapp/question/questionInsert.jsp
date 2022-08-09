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
    	$("#questionForm").attr("action", "LoginUIServlet");
    	$("#questionForm").submit();
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
			$("#QuestionInsert").click(function() {
				var qtittle = $("#qTittle").val();
				var qContent = $("#qContent").val();
				if (qtittle.length == 0) {
					alert("제목을 입력하십시오");
					event.preventDefault();
				} else if (qContent.length == 0) {
					alert("내용을 입력하십시오");
					event.preventDefault();
				}
			});
			
			$("#QuestionList").click(function () {
				$("#questionForm").attr("action", "QuestionListServlet");
			})
			$("#QuestionInsert").click(function () {
				var operate = $("#QuestionInsert").attr("data-operate");
				var userid = $("#QuestionInsert").attr("data-userid");
				$("#questionForm").attr("action", "QuestionUploadServlet?USERID="+userid+"&operate="+operate);
			})
			$("#pID").click(function () {
				window.open("questionproductSelect.jsp","","width=400px height=500px");
			});
		});//end ready
	</script>
<div style="text-align: center; display: flex; justify-content:center; height: 100px; margin-bottom: 10px;" >
		<img src="images/question.png" alt="..." style="width: auto;">
</div>

<form action="" id="questionForm" enctype="multipart/form-data" method="post">
<input type="hidden" name="USERID" value="<%=userid%>">
<div class="container justify-content-center">
<div class="row">
		<table>
			<tr>
				<td colspan="2"> 
					<div class="input-group">
					  <span class="input-group-text">제목</span>
					  <input type="text" class="form-control" name="Q_TITLE" id="qTittle">
					</div>
				</td>
			</tr>
			<tr>
				<th colspan="2"> 
					<div class="input-group">
					  <button id="pID" class="btn btn-outline-secondary" type="button">상품 정보</button>
					  <input type="text" class="form-control" name="P_ID" id="pId">
					</div>
				</th>
			</tr>
			<tr>
				<td colspan="2"> 
					<div class="input-group">
					  <label class="input-group-text" for="inputGroupSelect01">문의 글 카테고리</label>
					  <select class="form-select"  name="Q_BOARD_CATEGORY">
					    <option value="1" selected>상품문의</option>
					    <option value="2">문의 게시판</option>
					  </select>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2"> 
					<div class="input-group">
					  <label class="input-group-text" for="inputGroupSelect01">질문 카테고리</label>
					  <select name="Q_CATEGORY" class="form-select">
					    <option>상품</option>
					    <option>배송</option>
					    <option>교환</option>
					    <option>환불</option>
					    <option selected>기타</option>
					  </select>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div>
					  <textarea class="form-control" rows="15" cols="50" name="Q_CONTENT" id="qContent" placeholder="내용을 입력하십시오"></textarea>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div>
					  <label for="formFileMultiple" class="form-label">첨부파일</label>
					  <input class="form-control" accept="image/*" type="file" name="qFile" multiple>
					</div>
				</td>
			</tr>
			<tr>
				<td> <button id="QuestionList" class="btn btn-success">목록</button> </td>
				<td style="text-align: right;">
					<button id="QuestionInsert" data-userid="<%=userid %>" data-operate="<%=operate %>" class="btn btn-success">등록</button>
					<button type="reset" class="btn btn-success">취소</button>
				</td>
			</tr>
		</table>
</div>
</div>
</form>