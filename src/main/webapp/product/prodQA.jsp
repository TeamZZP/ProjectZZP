<%@page import="com.dto.ProductDTO"%>
<%@page import="com.dto.AnswerDTO"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.dto.QuestionDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="https://kit.fontawesome.com/a4e70846ef.js" crossorigin="anonymous"></script>
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
						$("#answer"+qID).slideToggle("slow").html(data + 
						" &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <i class='fa-solid fa-a' style='font-size: 50px';></i>").css({'font-weight':'bold','border-bottom': '1px solid #8FBC8F'});
					} else {
						alert("권한이 없습니다.");
					}
				},
				error: function (xhr, status, error) {
					alert("문제가 발생했습니다. 다시 시도해 주세요.");
				}
			});//end ajax
		}); //
		
		$("#QuestionInsert").click(function () {
			var qID = $("#pID").val();
			var pName = $("#P_name").val();
			console.log(qID + "\t" + pName);
			location.href = "questionInsert.jsp?P_ID="+qID+"&P_Name="+pName;
		});//
	}); //end ready
</script>
<style>
	table#prodQATable {
	  border-collapse: separate;
	  border-spacing: 0px;
	  text-align: left;
	  line-height: 1.5;
	  margin : 20px 10px;
	}
	table#prodQATable td {
	  width: 350px; 
	  padding: 10px;
	  vertical-align: top;
	  border-bottom: 1px solid #8FBC8F;
	  vertical-align: middle;
	}
</style>

<div style="text-align: center; color: gray;"> Q&A </div>
<table id="prodQATable" style="text-align: center;">
	<tr>
		<td colspan="6" style="background-color: #8FBC8F; padding: 10px;"></td>
	</tr>
		<%
			ProductDTO pdto = (ProductDTO) request.getAttribute("ProductRetrieveDTO");
		%>
	<tr>
		<td colspan="6" style="display: none;">
			<input type="hidden" id="P_name" value="<%=pdto.getP_name()%>">
			<input type="hidden" id="pID" value="<%=pdto.getP_id()%>">
		</td>
	</tr>
	<tr>
		<td></td>
		<td>답변상태</td>
		<td>작성자</td>
		<td>제목</td>
		<td>작성일</td>
		<td></td>
	</tr>
		<%
			List<QuestionDTO> prodQuestionList = (List<QuestionDTO>) session.getAttribute("prodQuestionList");
			for (QuestionDTO qDTO : prodQuestionList) {
				String user = qDTO.getUserid();
				String created = qDTO.getQ_created().substring(0, 10);
		%>
	<tr class="questionDetail" data-qID="<%=qDTO.getQ_id()%>" title="더블클릭">
		<td style="text-align: center;"><i class="fa-solid fa-q" style="font-size: 50px;"></i></td>
		<td><%=qDTO.getQ_status()%></td>
		<td>
			<%
				String use = "";
				for (int j = 0; j < user.substring(5).length(); j++) {
					use += "*";
				 }
			%> 
			<%=user.substring(0, 5).concat(use)%>
		</td>
		<td><%=qDTO.getQ_title()%></td>
		<td><%=created%></td>
		<td style="text-align: center;"> <img alt="문의 답변 보기" src="images/question/down.png" width="20px" height="20px"> </td>
	</tr>
	<tr>
		<td colspan="6" style="border-bottom: none;">
			<div style="text-align: right; margin: 0px 82px;" id="answer<%=qDTO.getQ_id()%>"> 
				<span class="answer<%=qDTO.getQ_id()%>"> </span> 
			</div> 
		</td>
	</tr>
		<%
		 		}
		%>
</table>
	<div style="text-align: right; padding-right: 50px;" >
		<button type="submit" class="btn btn-outline-success" id="QuestionInsert">문의하기</button>
	</div>
