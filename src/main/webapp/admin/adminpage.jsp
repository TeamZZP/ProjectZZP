<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$("#memberManagement").click(function() {
			$("form").attr("action", "MemberListServlet");
		});
	});//end ready
</script>
<form action="" method="post">
	<button type="submit" class="btn btn-outline-success" id="memberManagement">1. 회원관리</button><br>
</form>