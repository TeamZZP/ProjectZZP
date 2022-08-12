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
				url: "../ProdOneSelectServlet",
				data:{
					qID : $(this).attr("data-qID")
				},
				datatype:"text",
				success: function (data, status, xhr) {
					$("#answer"+qID).slideToggle().text(data);
				},
				error: function (xhr, status, error) {
					alert("오류");
				}
			});//end ajax
		}); 
		
	}); //end ready
</script>
<style>
	table.questionDetail {
	  border-collapse: separate;
	  border-spacing: 1px;
	  text-align: left;
	  line-height: 1.5;
	  border-top: 1px solid #ccc;
	  margin : 20px 10px;
	}
	table.questionDetail td {
	  width: 350px;
	  padding: 10px;
	  vertical-align: top;
	  border-bottom: 1px solid #ccc;
	}
	#tog {
		text-align: center;
	}
</style>
<%
	List<QuestionDTO> prodQuestionList = (List<QuestionDTO>) session.getAttribute("prodQuestionList");
	for (QuestionDTO qDTO : prodQuestionList) {
		String user = qDTO.getUSERID();
		String created = qDTO.getQ_CREATED().substring(0, 10);
%>
<table class="questionDetail" data-qID="<%=qDTO.getQ_ID()%>">
	<tr>
		<td rowspan="2" style="text-align: center;"><img alt="Q" src="images/question/question.png" width="50px" height="50px">
		</td>
		<td><%=qDTO.getQ_STATUS()%></td>
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
		<td>▼</td>
	</tr>
	<tr>
		<td colspan="5"><%=qDTO.getQ_TITLE()%></td>
	</tr>
</table>
 <div style="text-align: center;" id="answer<%=qDTO.getQ_ID()%>"> </div>
<%
	}
%>