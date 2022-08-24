<%@page import="com.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function () {
		$("#nTittle").focus();
		$("#noticeInsert").click(function () {
			var nTittle = $("#nTittle").val();
			var nContent = $("#nContent").val();
			if (nTittle.length == 0) {
				alert("제목을 입력하십시오");
				evnet.preventDefault();
			} else if (nContent.length == 0) {
				alert("내용을 입력하십시오");
				evnet.preventDefault();
			} else {
				$("form").attr("action","NoticeInsertServlet");
			}
		});
	});;//end ready
</script>
	<form method="post" action="">
	<div class="container justify-content-center">
	<div class="row">
	    <table border="1" style="border-collapse: collapse;">
	    	<tr>
	    		<td colspan="2"> 
		    		<div class="input-group">
						  <span class="input-group-text">제목</span>
						  <input type="text" class="form-control" name="nTittle" id="nTittle">
					</div>
	    			
	    			<div class="input-group">
					  <select class="form-select"   name="nCategory">
					    <option value="main">point</option>
	    				<option value="notice" selected="selected">notice</option>
					  </select>
					</div>
	    		</td>
	    	</tr>
	    	<tr>
	    		<td colspan="2">
	    			<textarea class="form-control" rows="15" cols="50" name="nContent" id="nContent" placeholder="공지사항 내용을 입력하십시오."></textarea>
	    		</td>
	    	</tr>
	    	<tr>
	    		<td style="text-align: right;">
	    			<button type="submit" id="noticeInsert" class="btn btn-outline-success">글입력</button> 
	    			<button type="reset" class="btn btn-outline-success">글삭제</button> 
	    		</td>
	    	</tr>
	    </table>
	  </div>
	  </div>
    </form>