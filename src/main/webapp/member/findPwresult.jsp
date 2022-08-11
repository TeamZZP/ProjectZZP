<%@page import="com.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
#container {
	    width:100%;
	   	height:100%; 
	    margin: 0;
  		padding-top: 200px;
  		padding-bottom: 40px;
  		font-family: "Nanum Gothic", arial, helvetica, sans-serif;
  		background-repeat: no-repeat;
	}
    .card {
        margin: 0 auto; /* Added */
        float: none; /* Added */
        margin-bottom: 10px; /* Added */
	}
	.find .form-control {
  		position: relative;
  		height: auto;
  		-webkit-box-sizing: border-box;
     	-moz-box-sizing: border-box;
        	 box-sizing: border-box;
  		padding: 10px;
  		font-size: 16px;
	}
    .checkbox{
        margin-right: 20px;
        text-align: right;
    }
    .card-title{
        margin-left: 30px;
    }
    .links{
        text-align: center;
        margin-bottom: 10px;
    }
    a{ 
    	color: green; text-decoration: none; 
    }
    .check{
    	color : red;
    }
    #result{
    	border: none;
    	width: 100%;
    	text-align: center;
    }
    #pwchk{
    	font-weight: bold;
    	font-size: x-large;
    	color: green;
    }
</style>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> 
<script type="text/javascript">
	$(document).ready(function(){
			//reset 시 id focus
			$("#btn2").click(function() {
				$("#userid").focus();
			});
			
			//비밀번호 재확인-키 이벤트 발생시 패스워드 일치여부 검사 
			$("#changedPasswd").keyup(function() {
				var mesg = "비밀번호가 일치하지 않습니다:(";
				if ($("#passwd").val()==this.value) {
					mesg = "비밀번호가 확인되었습니다:)";
				}
				$("#check").text(mesg);
			});
		
			//유효성 검사 및 미입력 값 확인
			$("#btn").click(function() {
				var userid = $("#userid").val();
				var passwd = $("#passwd").val();
				var passwd2 = $("#changedPasswd").val();
				//비밀번호 유효성 검사
				var pwChk = /^(?=.*[a-zA-Z])(?=.*[!@#$%^&*+=-_])(?=.*[0-9]).{8,25}$/;
				if (!pwChk.test(passwd)) {
					alert("비밀번호를 형식에 맞게 입력해주세요 :)");
					$("#passwd").val("");
					$("#passwd").focus();
					event.preventDefault();
				}
				//미입력 값 확인
					else if (userid.length==0) {
						$("#check").text("아이디를 입력해주세요 :)");
						$("#userid").focus();
					} else if (passwd.length==0) {
						$("#check").text("비밀번호를 입력해주세요 :)");
						$("#passwd").focus();
					} else if (changedPasswd.length==0) {
						$("#check").text("비밀번호를 확인해주세요 :)");
						$("#changedPasswd").focus();
					}
					if (userid.length!=0&&passwd.length!=0&&passwd2.length!=0) {
						$("form").submit();
					} 
			});
			
	});
</script> 
<%
MemberDTO dto = (MemberDTO)session.getAttribute("findPw");
String userid = dto.getUserid();
String username = dto.getUsername();
String passwd = dto.getPasswd();
%>
<div id="container" cellpadding="0" cellspacing="0" marginleft="0" margintop="0" width="100%" height="100%" align="center">
	<div class="card align-middle" style="width:25rem; margin-top: -80px; margin-bottom: 50px;">
		<div class="card-title" style="margin-top:30px; margin-right: 70px;">
			<h2 class="card-title" style="color:#f58b34; text-align: center; "><img alt="로고" src="images/header/main.png" width="50" height="50">
			<span id="main" style="font-weight: bold;">ZZP</span> </h2>
		</div>
	      <form action="ChangePwServlet" class="find" method="POST">
	        <div class="card-body" style="font-weight: bold;">
	            비밀번호 재설정
	         </div>
			  <div class="card-body">
		       	 <input type="text" name="userid" id="userid" class="form-control" placeholder="아이디" autofocus ><BR>
		       	 <input type="password" name="passwd" id="passwd" class="form-control" placeholder="새로운 비밀번호" autofocus ><BR>
		       	 <div id="phonediv" >
		       	 <input type=""password"" name="changedPasswd" id="changedPasswd" class="form-control" placeholder="비밀번호 확인"><br>
		       	 </div>
		       	 <p id="check" class="check"></p><br/>
		       <button type="button" id="btn" class="btn btn-lg  btn btn-success" style="margin-bottom: 30px;">비밀번호 변경</button>
		       <button type="reset" id="btn2" class="btn btn-lg  btn btn-success" style="margin-bottom: 30px;">취소</button>
		      </div>
	      </form>
	   </div>
        <div class="links">
            <a href="LoginUIServlet">로그인</a> | <a href="MemberUIServlet">회원가입</a> | <a href="IdFindUIServlet">아이디 찾기</a>
        </div>
</div> 