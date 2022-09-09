<%@page import="com.dto.QuestionProductDTO"%>
<%@page import="com.dto.AnswerDTO"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.dto.MemberDTO"%>
<%@page import="com.dto.QuestionDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	QuestionProductDTO qDTO = (QuestionProductDTO)session.getAttribute("questionOneSelect");
	System.out.print("questionDetail " + qDTO);
	
	AnswerDTO aDTO = (AnswerDTO)session.getAttribute("aDTO");	
	
	String date = qDTO.getQ_created();
	String day = date.substring(0,10);
	System.out.print("날짜 " + day);
%>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function () {
		$("#questionList").click(function () {
			$("#detailForm").attr("action", "QuestionListServlet");
		});//
		$("#questionUpdate").click(function () {
			$("#detailForm").attr("action", "questionUpdate.jsp");
		});//
		$("#questionDelete").click(function () {
			$("#detailForm").attr("action", "QuestionDeleteServlet?Q_ID=<%=qDTO.getQ_id()%>");
		});//
		$("#before").click(function () {
			history.back();
			event.preventDefault();
		});//
		if ($("#pId").val() == "null") {
			$("#pId").val("");
		}//
		$("#answerBtn").click(function() {
			console.log("클릭됨");
			var answer = $("#answer").val();
			var qID = $("#answerBtn").attr("data-qid");
			$.ajax({
				type:"post",
				url:"QuestionAnswerServlet",
				data:{
					answer : $("#answer").val(),	
					qID : qID
				},
				datatype:"text",
				success: function (date, status, xhr) {
					alert("답변완료");
					$("#answerCheck").text(date);
					$("#answer").text(date);
				},
				error: function (xhr, status, error) {
					alert("에러");
				}
			});//end ajax
		});//
		$("#uploadBtu").click(function () {
			window.open("showImg.jsp", "", "width=400px height=500px");
		});
	});//end ready
</script>
<div style="text-align: center; display: flex; justify-content:center; height: 100px; margin-bottom: 10px;" >
		<img src="images/question.png" alt="..." style="width: auto;">
</div>
	<form method="post" id="detailForm">
	<div class="container justify-content-center">
	<div class="row">
		<table>
			<tr>
				<td colspan="2"> 
					<div class="input-group">
					  <span class="input-group-text">제목</span>
					  <input type="text" class="form-control shadow-none" value="<%= qDTO.getQ_title() %>" readonly="readonly">
					</div>
				</td>
			</tr>
			<tr>
				<td> 
					<div class="input-group">
					  <span class="input-group-text">작성일</span>
					  <input type="text" class="form-control shadow-none" value="<%=day %>" readonly="readonly">
					</div>
				</td>
				<td> 
					<div class="input-group">
					  <span class="input-group-text">작성자</span>
					  <input type="text" class="form-control shadow-none" value="<%= qDTO.getUserid() %>" readonly="readonly">
					</div>
				</td>
			</tr>
			<tr>
				<th colspan="2"> 
					<div class="input-group">
					  <span class="input-group-text">상품정보</span>
					  <input type="text" class="form-control shadow-none"  <%if(qDTO.getP_name() != null){ %> value="<%=qDTO.getP_name() %>" <% }%>  readonly="readonly">
					</div>
				</th>
			</tr>
			<tr>
				<td colspan="2">
				  <textarea class="form-control shadow-none" rows="15" cols="50" readonly="readonly"> <%= qDTO.getQ_content() %> </textarea>
				</td>
			</tr>
			<tr>
			<%if(qDTO.getQ_img() == null || qDTO.getQ_img().equals("null")){ %>
				<td></td>
			<%} else { %>
				<td>
					<div>
					  	<button type="button" class="btn btn-secondary" id="uploadBtu" style="padding: 2rem;">첨부파일</button>
					  	<img id="upload" alt="" src="/eclipse/upload/<%=qDTO.getQ_img()%>" width="100px" height="100px" style="border: 1px solid gray;">
					</div>
				</td>
			<%} %>
			</tr>
			<tr>
				<td colspan="2">
					<div class="input-group">
					  <span class="input-group-text">답변</span>
					  <textarea class="form-control shadow-none" readonly="readonly" id="answerCheck"><%if(aDTO != null){ %><%= aDTO.getAnswer_content() %><%} else { %><%=qDTO.getQ_status() %><%} %></textarea>
					</div>
				</td>
			</tr>
			<tr>
				<% 
					MemberDTO mDTO = (MemberDTO)session.getAttribute("login");
					String userid = (String)session.getAttribute("userid");
					String before = (String)session.getAttribute("before");
					if(mDTO.getUserid().equals(userid)){
						System.out.print("///////////" + before + "///////////");
						if(before.equals("myQuestion")){
				%>
					<td>
						 <button class="btn btn-outline-success" id="before">이전</button> 
					</td>
					<%
						} else {
					%>
					<td>
					 	<button id="questionList" class="btn btn-outline-success" >목록</button> 
					</td>
					<%
						}
					%>
				<td style="text-align: right;">
					<button id="questionUpdate" class="btn btn-outline-success" >수정</button> 
				 	<button id="questionDelete" class="btn btn-outline-success" >삭제</button>
				</td>
				<%
					}
				%>
			</tr>
			<%
				if(mDTO.getUserid().equals("admin1")){
			%>
			<tr>
				<td colspan="2">
					<div class="input-group">
					  <textarea class="form-control" id="answer"><%if(aDTO != null){ %><%=aDTO.getAnswer_content() %><%} %></textarea>
					  <button class="btn btn-outline-secondary" type="button" id="answerBtn" data-qid="<%=qDTO.getQ_id()%>">답글 올리기</button>
					</div>
				</td>
			</tr>
			<tr>
				<td>
				 	<button id="questionList" class="btn btn-outline-success" >목록</button> 
				</td>
				<td style="text-align: right;">
					<button id="questionDelete" class="btn btn-outline-success" >게시글 삭제</button>
				</td>
			</tr>
			<%
				}
			%>
		</table>
	</div>
	</div>
	</form>