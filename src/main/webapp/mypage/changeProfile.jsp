<%@page import="com.dto.ProfileDTO"%>
<%@page import="java.util.HashMap"%>
<%@ page import="com.dto.MemberDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<%
	MemberDTO member=(MemberDTO) session.getAttribute("login");
	String userid=member.getUserid();
	
	ProfileDTO profile=(ProfileDTO) session.getAttribute("profile");
	String getProfile_img=profile.getProfile_img();
	String getProfile_txt=profile.getProfile_txt();
	if (getProfile_txt.equals(" ")) {
		getProfile_txt = "프로필 메세지를 입력하세요 :>";
	}
	//if (getProfile_txt == " ") {//서블릿에서 데이터 가져오면서부터 null 발생
	//	getProfile_txt="프로필 메세지를 입력하세요.";
	//HashMap<String, String> profileMap=(HashMap<String, String>) session.getAttribute("profileMap");
	//String profile_txt=profileMap.get("profile_txt");
%>
<html>
<head>
<meta charset="UTF-8">
<title>내 프로필</title>
<link type="text/css" rel="stylesheet" href="<c:url value='/bootstrap/css/bootstrap.css'/>"/>    
<link type="text/css" rel="stylesheet" href="<c:url value='/bootstrap/css/bootstrap.min.css'/>"/>    
<script src="<c:url value='/bootstrap/js/bootstrap.js'/>" type="text/javascript"></script>
<script src="<c:url value='/bootstrap/js/bootstrap.min.js'/>" type="text/javascript"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		
		$("img").on("click", function() {
			console.log("click");
			//프로필 이미지 변경
		});//end fn
		
		$("#profile_txt").on("click", function() {
			$(this).val("");
		});//end fn
		
		$("#submit").on("click", function() {
			$("form").attr("action", "../AccountChangeServlet");
		});//end fn
		
		$("#close").on("click", function() {
			opener.location.reload();//여기선 새로고침 됨
			close();
		});//end fn
	});//end ready
</script>
</head>
<body>
<div style = "padding: 15px 5px 5px 20px;">
<form action=" " method="post" enctype="multipart/form-data">
<input type="hidden" name="userid" id="userid" value="<%= userid %>">
<img alt="none" src="peng.jpg" width="250px" height="250px"><br><!-- 이쁘게 동그랗게 보이면 좋겠다 -->
<%-- <img alt="none" src="upload/${path}" width="250px" height="250px"><br> --%>
<input type="file" name="profile_img" ><br>
<br>
<b>프로필 소개</b><br>
<input type="text" name="profile_txt" id="profile_txt" style="width: 300px; height: 150px" value="<%= getProfile_txt %>"><br><!-- DB에 없음 -->
<br>
<button id="submit" class="btn btn-success">확인</button>&nbsp;&nbsp;<button id="close" class="btn btn-success">창 닫기</button>
</form>
</div>
</body>
</html>