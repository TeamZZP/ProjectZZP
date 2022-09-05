<%@page import="com.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	MemberDTO member=(MemberDTO) request.getAttribute("login");
	
	String userid=member.getUserid();
	String passwd=member.getPasswd();
	String username=member.getUsername();
	String email1=member.getEmail1();
	String email2=member.getEmail2();
	String phone=member.getPhone();
	String created_at=member.getCreated_at();
%>
<style>
	.img a{
	  display: block; /* 영역적용위해 사용 */
	  width: 100%; height: 100%;
	
	  overflow: hidden;/* 이미지가 커질때 다른 이미지를 침범하기 때문에 반드시 부모요소보다 이미지가 커질때 넘어가는 것을 막아주세요. */
	
	  position: relative; /* absolute의 기본기준은 body로 처리 - 현재 요소로 기준변경 - 이 코드 추가하니까 바깥 영역으로 침범 안 하고 잘림 */
	}
	.img figure{
	  width: 100%; height: 100%;/* a태그의 영역을 상속받도록 처리 */
	}
	.img figcaption{
	  width: 100%; height: 100%;/* 역시 부모 전체 영역을 상속 받도록  width: 100%; height: 100%; 를 줬고, */
	  background-color: rgba(0,0,0,0.3);/* 검정색 배경색에 투명도를 주기 위해  background-color: rgba(0,0,0,0.7); 로  rgba( ) 함수를 사용 */
	
	  position: absolute; /* 이미지와 겹치게 처리 */
	  top: 0; left: 0;/* 이미지 위에 올라가야 하므로  position: absolute; top: 0; left: 0; 를 줘서 겹치도록 */
	
	  color: #fff; text-align: center;
	  line-height: 200px;
	
	  opacity: 0; /* 위에 올라가는 bg기 때문에 처음엔 안 보이게 처리 */
	
	  transition: 0.3s; /* 자연스럽게 나타나야하기 때문에 CSS변화에 시간차를 주기 위해 */
	}
	.img a:hover figcaption, .img a:focus figcaption{
	  opacity: 1;/* 마우스를 올렸을 때와 초점받았을 때 보이게 하도록 */
	}
</style>
<div class="container col-md-8">
<div class="justify-content-center">
<div class="row">
<div class="col-md-5">
	<div class="card" style="width: 16rem;">
	  <div class="img" style="padding: 30px 30px 30px 30px;">
	  	<a href="ProfileChangeServlet">
	  		<figure>
	  			<img src="images/user.png" class="card-img-top">
	  			<figcaption id="changeImg">사진 변경</figcaption>
	  		</figure>
	  	</a>
	  </div>
	  <div class="card-body">
	    <h5 class="card-title"><b><%= username %>님</b></h5>
	    <p class="card-text">프로필 메세지</p>
	  </div>
	</div>
</div>
<div class="col-md-7">
	<div style="padding-bottom: 70px;">
		<a href="#" class="btn btn-outline-success">입금, 결제</a>
		<a href="#" class="btn btn-outline-success">배송중</a>
		<a href="#" class="btn btn-outline-success">배송 완료</a>
		<a href="#" class="btn btn-outline-success">전체보기</a>
	</div>
	<div></div>
		<a href="MyOrderServlet" class="btn btn-outline-success">1. 주문 내역</a>
		<a href="#" class="btn btn-outline-success">2. 반품/취소/교환 목록</a>
		<a href="ProfileCategoryServlet?category=myreview&userid=<%=userid%>" class="btn btn-outline-success">3. 내 구매후기</a><br>
		<br>
		<a href="ProfileCategoryServlet?category=mychallenge&userid=<%=userid%>" class="btn btn-outline-success">4. 내 챌린지</a>
		<a href="ProfileCategoryServlet?category=mystamp&userid=<%=userid%>" class="btn btn-outline-success">5. 내 도장</a>
		<a href="MyQuestionServlet" class="btn btn-outline-success">6. 내 문의 내역</a><br>
		<br>
		<a href="AddressListServlet" class="btn btn-outline-success">7. 배송지 관리</a>
		<a href="checkPasswd.jsp" class="btn btn-outline-success">8. 계정 관리</a><br>
		<br>
	</div>
</div>
</div>
</div>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		
	});//end ready
</script>