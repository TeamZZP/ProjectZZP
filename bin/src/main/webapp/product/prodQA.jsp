<%@page import="com.dto.ProductDTO"%>
<%@page import="com.dto.AnswerDTO"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.dto.QuestionDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(function () {
		$(".questionDetail").click(function () {
			var qID = $(this).attr("data-qID");
			console.log("클릭된 게시글 번호 " + qID);
			$.ajax({
				type:"post",
				url: "ProdOneSelectServlet",
				data:{
					qID : $(this).attr("data-qID")
				},
				datatype:"text",
				success: function (data, status, xhr) {
					console.log(data);
					if (data != null) {
						$("#answer"+qID).attr("display","none");
						$("#answer"+qID).slideToggle("200").html(data + 
						" &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <img alt='A' src='images/question/A.png' width='50px' height='55px'>");
					} else {
						alert("권한이 없습니다.");
					}
				},
				error: function (xhr, status, error) {
					alert("오류");
				}
			});//end ajax
		}); //
		
		$("#QuestionInsert").click(function () {
			var qID = $("#qID").val();
			var pName = $("#pName").val();
			location.href = "questionInsert.jsp?P_ID="+qID+"&P_Name="+pName;
		});//
	}); //end ready
</script>
<style>
	table.questionDetail {
	  border-collapse: separate;
	  border-spacing: 0px;
	  text-align: left;
	  line-height: 1.5;
	  margin : 20px 10px;
	}
	table.questionDetail td {
	  width: 350px; 
	  padding: 10px;
	  vertical-align: top;
	  border-bottom: 1px solid #8FBC8F;
	}
</style>
<table style="border-spacing : 0">
	<caption style="caption-side: top; text-align: center;">Q&A</caption>
	<tr>
		<td>
		<%
			ProductDTO pdto = (ProductDTO) request.getAttribute("ProductRetrieveDTO");
			List<QuestionDTO> prodQuestionList = (List<QuestionDTO>) session.getAttribute("prodQuestionList");
			for (QuestionDTO qDTO : prodQuestionList) {
				String user = qDTO.getUserid();
				String created = qDTO.getQ_created().substring(0, 10);
		%>
		<input type="hidden" id="pID" value="<%=qDTO.getP_id()%>">
		<input type="hidden" id="pName" value="<%=pdto.getP_name()%>">
			<table class="questionDetail" data-qID="<%=qDTO.getQ_id()%>" title="더블클릭">
				<tr class="answer">
					<td colspan="5" style="background-color: #8FBC8F;"></td>
				</tr>
				<tr class="answer">
					<td rowspan="2" style="text-align: center;"><img alt="Q" src="images/question/Q.png" width="50px" height="55px">
					</td>
					<td><%=qDTO.getQ_status()%></td>
					<td>
						<%
						String use = "";
						for (int j = 0; j < user.substring(5).length(); j++) {
							use += "*";
						%> 
						<%
						 }
						%> 
						<%=user.substring(0, 5).concat(use)%>
					</td>
					<td><%=created%></td>
					<td style="text-align: center;"> <img alt="문의 답변 보기" src="images/question/down.png" width="20px" height="20px"> </td>
				</tr>
				<tr class="answer">
					<td colspan="5"><%=qDTO.getQ_title()%></td>
				</tr>
				<tr id="question">
					<td colspan="6" style="border: none;">
						<div style="text-align: right; margin-right: 70px;" id="answer<%=qDTO.getQ_id()%>"> <span class="answer<%=qDTO.getQ_id()%>"> </span> </div> 
					</td>
				</tr>
			</table>
		<%
		 		}
		%>
		</td>
	</tr>
	<tr>
		<td style="text-align: right; padding-right: 50px;">
			<button type="submit" class="btn btn-outline-success" id="QuestionInsert">문의하기</button>
		</td>
	</tr>
</table>