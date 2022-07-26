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
</style>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> 
<script type="text/javascript">
	$(document).ready(function(){
			
			//라디오 선택 시 전화번호, 이메일 전환
			$(".type").click(function() {
				var chkvalue = $(".type:checked").val();
				if (chkvalue=='email') {
					$("#username").val("");
					$("#email1").val("");
					$("#email2").val("");
					$("#username").focus();
					$("#phonediv").css("display","none");
					$("#email").css("display","");
				} else {
					$("#username").val("");
					$("#phone").val("");
					$("#username").focus();
					$("#email").css("display","none");
					$("#phonediv").css("display","");
				}
			});
			
			//미입력 값 확인
			$("#btn").click(function() {
				var username = $("#username").val();
				var phone = $("#phone").val();
				var email1 = $("#email1").val();
				var email2 = $("#email2").val();
				var chkvalue = $(".type:checked").val();
				if (chkvalue=='phone') {
					if (username.length==0) {
						$("#check").text("이름을 입력해주세요 :)");
						$("#username").focus();
					} else if (phone.length==0) {
						$("#check").text("전화번호를 입력해주세요 :)");
						$("#phone").focus();
					}
					if (username.length!=0&&phone.length!=0) {
						$("form").submit();
					} 
				} else if (chkvalue=='email') {
					if (username.length==0) {
						$("#check").text("이름을 입력해주세요 :)");
						$("#username").focus();
					} else if (email1.length==0) {
						$("#check").text("이메일을 입력해주세요 :)");
						$("#email1").focus();
					} else if (email2.length==0) {
						$("#check").text("이메일을 입력해주세요 :)");
						$("#email2").focus();
					} 
					if (username.length!=0&&email1.length!=0&&email2.length!=0) {
						$("form").submit();
					} 
				}
			});

	});
</script> 

<div id="container" cellpadding="0" cellspacing="0" marginleft="0" margintop="0" width="100%" height="100%" align="center">
	<div class="card align-middle" style="width:25rem; margin-top: -80px; margin-bottom: 50px;">
		<div class="card-title" style="margin-top:30px; margin-right: 70px;">
			<h2 class="card-title" style="color:#f58b34; text-align: center; "><img alt="로고" src="images/header/main.png" width="50" height="50">
			<span id="main" style="font-weight: bold;">ZZP</span> </h2>
		</div>
	      <form action="IdFindServlet" class="find" method="POST">
	        <div class="checkbox">
	            <label>
		            <input type="radio" class="type" name="type" value="phone" checked="checked"> 전화번호
					&nbsp;&nbsp;
					<input type="radio" class="type" name="type" value="email"> 이메일
	            </label>
	         </div>
			  <div class="card-body">
		       	 <input type="text" name="username" id="username" class="form-control" placeholder="이름" autofocus ><BR>
		       	 <div id="phonediv" >
		       	 <input type="text" name="phone" id="phone" class="form-control" placeholder="전화번호를 -없이 입력하세요"><br>
		       	 </div>
		       	 <div class="row g-3" id="email" style="display: none; margin-bottom: 40px;">
		       	 <input type="text" name="email1" id="email1" class="col form-control" style="margin-left: 8px;" placeholder="이메일 주소" required>
			       	   <div class="col input-group">
					      <div class="input-group-text">@</div>
					      <input type="text" name="email2" placeholder="직접입력" id="email2" class="form-control" >
				       </div>
		       	 </div>
		       	 <p id="check" class="check"></p><br/>
		       <button type="button" id="btn" class="btn btn-lg  btn btn-success" style="margin-bottom: 30px;">아이디 찾기</button>
		         <!-- <input class="btn btn-lg  btn btn-success" type="submit" value="아이디 찾기" style="margin-bottom: 30px;"> -->
		      </div>
	      </form>
	   </div>
        <div class="links">
            <a href="LoginUIServlet">로그인</a> | <a href="MemberUIServlet">회원가입</a> | <a href="PwFindUIServlet">비밀번호 찾기</a>
        </div>
</div>  