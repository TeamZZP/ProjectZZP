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
			$("#qTittle").focus();
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
				var qFile = $("#qFile").val();
				console.log(qFile);
				$("#questionForm").attr("action", "QuestionUploadServlet?USERID="+userid+"&operate="+operate);
			})
			$("#pID").click(function () {
				window.open("questionproductSelect.jsp","","width=400px height=500px");
			});
			function checkFileExtension(){ 
				let fileValue = $("#qFile").val(); 
				let reg = /(.*?)\.(jpg|jpeg|png|gif)$/;
				if (fileValue.match(reg)) {
					return true;
				} else {
					alert("jpg, jpeg, png, gif 파일만 업로드 가능합니다.");
					return false;
				}
			}
		});//end ready
	</script>
<div style="text-align: center; display: flex; justify-content:center; height: 100px; margin-bottom: 10px;" >
		<img src="images/question.png" alt="..." style="width: auto;">
</div>

<form action="" id="questionForm" enctype="multipart/form-data" method="post">
<input type="hidden" name="USERID" value="<%=userid%>">
<input type="hidden" name="oldFile" value="">
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
					<% 
						String P_ID = request.getParameter("P_ID");		
						String P_Name = request.getParameter("P_Name");	
					%>
					  <button id="pID" class="btn btn-outline-secondary" type="button">상품 정보</button>
					  <input type="text" class="form-control shadow-none" name="P_Name" id="P_Name" readonly="readonly" <%if(P_Name != null){ %>value="<%=P_Name%>"<%} %>>
					  <input type="hidden" id="P_ID" name="P_ID" <%if(P_Name != null){ %>value="<%=P_ID%>"<%} %>>
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
					  <textarea class="form-control" rows="15" cols="50" name="Q_CONTENT" id="qContent" placeholder="내용을 입력하십시오."></textarea>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div>
					  <input class="form-control" accept="image/*" type="file" name="qFile" id="qFile" multiple>
					</div>
				</td>
			</tr>
			<tr>
				<td> <button id="QuestionList" class="btn btn-success">목록</button> </td>
				<td style="text-align: right;">
					<button id="QuestionInsert" data-userid="<%=userid %>" data-operate="<%=operate %>" class="btn btn-success">등록</button>
					<button id="QuestionCancel" type="reset" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#aa">취소</button>
					
					<div class="modal fade" id="aa" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
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