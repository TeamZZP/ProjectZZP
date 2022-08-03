<%@page import="com.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function () {
		$("#noticeInsert").click(function () {
			var nTittle = $("#nTittle").val();
			var nContent = $("#nContent").val();
			if (nTittle.length == 0) {
				alert("제목을 입력하십시오");
				event.prevetDefault();
			} else if (nContent.length == 0) {
				alert("내용을 입력하십시오");
				event.prevetDefault();
			}  
		});
	});;//end ready
</script>
	<form method="post" action="NoticeInsertServlet">
	    <table border="1" style="border-collapse: collapse;">
	    	<tr>
	    		<td colspan="2"> 제목 <input type="text" name="nTittle" id="nTittle"> 
	    		<select name="nCategory">
	    			<option value="main">point</option>
	    			<option value="notice" selected="selected">notice</option>
	    		</select>
	    	</td>
	    	</tr>
	    	<tr>
	    		<td colspan="2"> <textarea rows="10" cols="50" placeholder="공지사항 내용을 입력하십시오." name="nContent" id="nContent"></textarea> </td>
	    	</tr>
	    	<tr>
	    		<td style="text-align: right;">
	    			<button type="submit" id="noticeInsert">글입력</button> 
	    			<button type="reset">글삭제</button> 
	    		</td>
	    	</tr>
	    </table>
    </form>