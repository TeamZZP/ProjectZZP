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
    }d
    #pwchk{
    	font-weight: bold;
    	font-size: x-large;
    	color: green;
    }
</style>

<%
MemberDTO dto = (MemberDTO)session.getAttribute("findId");
String userid = dto.getUserid();
String username = dto.getUsername();
String passwd = dto.getPasswd();
String pw = passwd.substring(0,2);
System.out.println(passwd.length()-2);
%>
<div id="container" cellpadding="0" cellspacing="0" marginleft="0" margintop="0" width="100%" height="100%" align="center">
	<div class="card align-middle" style="width:25rem; margin-top: -80px; margin-bottom: 50px;">
		<div class="card-title" style="margin-top:30px; margin-right: 70px;">
			<h2 class="card-title" style="color:#f58b34; text-align: center; "><img alt="로고" src="images/header/main.png" width="50" height="50">
			<span id="main" style="font-weight: bold;">ZZP</span> </h2>
		</div>
			  <div class="card-body">
		       	 <p id="result">
		       	 	<%= username %>님의 비밀번호는 
		       	 	<span id="pwchk">
		       	 	<%= pw %>
		       	 	</span> 입니다.
		       	 </p><br/>
		       <a href="LoginUIServlet" id="btn" class="btn btn-lg  btn btn-success" style="margin-bottom: 30px;">로그인 화면으로 돌아가기</a>
		      </div>
	   </div>
        <div class="links">
            <a href="MemberUIServlet">회원가입</a> | <a href="IdFindUIServlet">아이디 찾기</a>
        </div>
</div>  