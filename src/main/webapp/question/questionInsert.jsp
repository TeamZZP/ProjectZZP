<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#ok").click(function() {
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
				$("#questionForm").attr("action", "QuestionInsertServlet");
			})
			$("#pID").click(function () {
				window.open("questionproductSelect.jsp","상품검색","width=400px height=500px");
			});
		});//end ready
	</script>
<form action="" id="questionForm">
		<table>
			<tr>
				<td colspan="2"> 제목 <input type="text" name="qTittle" id="qTittle"> </td>
			</tr>
			<tr>
				<td colspan="2"> 
					<button id="pID" class="btn btn-outline-success">상품 정보</button>
					<input type="text" name="pId" id="pId">
				</td>
			</tr>
			<tr>
				<td colspan="2"> 문의 글 카테고리
					<select name="qboard_category">
						<option value="1">상품문의</option>
						<option value="2" selected="selected">문의 게시판</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2"> 질문 카테고리
					<select name="qcategory">
						<option>상품</option>
						<option>배송</option>
						<option>교환</option>
						<option>환불</option>
						<option selected="selected">기타</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2"> <textarea rows="10" cols="40" name="qContent" id="qContent" placeholder="내용을 입력하십시오"></textarea> </td>
			</tr>
			<tr>
				<td colspan="2">첨부파일 <input type="file" name="qFile"> </td>
			</tr>
			<tr>
				<td> <button id="QuestionList" class="btn btn-success">목록</button> </td>
				<td>
					<button id="QuestionInsert" class="btn btn-success">등록</button>
					<button type="reset" class="btn btn-success">취소</button>
				</td>
			</tr>
		</table>
	</form>