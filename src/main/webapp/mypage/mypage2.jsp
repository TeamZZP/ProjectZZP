<%@page import="com.dto.MemberDTO"%>
<%@page import="com.dto.ProfileDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	MemberDTO member=(MemberDTO) request.getAttribute("login");
	String userid=member.getUserid();
	String username=member.getUsername();
	
	ProfileDTO m_profile=(ProfileDTO) request.getAttribute("m_profile");
	String profile_img=m_profile.getProfile_img();
	String profile_txt=m_profile.getProfile_txt();
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
	body {/* 무슨 효과 */
		padding: 0;
		margin: 0;
	}
	div {/* 무슨 효과 */
		box-sizing: border-box;
	}
	.circle {/* alert badge */
		display: inline-block;
		width: 5px;
		height: 5px;
		border-radius: 2.5px;
		background-color: #ff0000;
		position: absolute;
		top: -5px;
		left: 110%;
	}
	.green {/* 녹색 텍스트 */
		color: #24855b;
	}
	.wrap {
		background-color: #F8F8F8;
	}
	.greenContainer {/* 녹색 배경 */
		height: 120px;
		background-color: #24855b;
		
		display: flex;
		align-items: flex-end;
		padding: 16px;
	}
	.greenContainer .name {
		font-size: 20px;
		font-weight: bold;
		color: #ffffff;
	}
	.greenContainer .modify {
		margin-left: auto;
	}
	.summaryContainer {/* 단골상점, 상품후기, 적립금 박스 */
		background-color: white;
		display: flex;
		padding: 21px 16px;
		height: 90px;
		margin-bottom: 10px;
	}
	.summaryContainer .item {/* 단골상점, 상품후기, 적립금 */
		flex-grow: 1
	}
	.summaryContainer .number {/* 녹색 숫자 */
		font-size: 19px;
		font-weight: bold;
		color: #24855b;
	}
	.summaryContainer .item > div:nth-child(2){
		font-size: 13px;
	}
	/* ==================== 주문/배송조회 박스 시작 ==================== */
	.shippingStatusContainer {
		padding: 21px 16px;
		background-color: white;
		margin-bottom: 10px;
	}
	/* ==================== 주문/배송조회 타이틀 ==================== */
	.shippingStatusContainer .title {
		font-size: 16px;
		font-weight: bold;
		margin-bottom: 15px;
	}
	/* ==================== 장바구니 결제완료 배송중 구매확정 [로우] ==================== */
	.shippingStatusContainer .status {
		display: flex;
		justify-content: space-between;
		margin-bottom: 21px;
	}
	/* ==================== 장바구니 결제완료 배송중 구매확정 [아이템] ==================== */
	.shippingStatusContainer .item {
		display: flex;
	}
	.shippingStatusContainer .number {
		font-size: 31px;
		font-weight: 500;
		text-align: center;
	}
	.shippingStatusContainer .text {
		font-size: 12px;
		font-weight: normal;
		color: #c2c2c2;
		text-align: center;
	}
	.shippingStatusContainer .icon {
		display: flex;
		align-items: center;
		padding: 20px;
		width: 16px;
		height: 16px;
	}
	/* ==================== 주문목록 ~ 찜한상품 리스트 ==================== */
	.listContainer {
		padding: 0;
		background-color: #ffffff;
		margin-bottom: 10px;
	}
	.listContainer .item {
		display: flex;
		align-items: center;
		padding: 16px;
		color: black;
		text-decoration: none;
		height: 56px;
		box-sizing: border-box;
	}
	.listContainer .icon {
		margin-right: 14px;
	}
	.listContainer .text {
		font-size: 16px;
		position: relative;
	}
	.listContainer .right {
		margin-left: auto;
	}
</style>
<div class="container col-md-10">
<input type="hidden" name="old_file" id="old_file" value="<%= profile_img %>">

<div class="justify-content-center">
<div class="row">
<div class="col-md-3">
	<div class="card" style="width: 16rem;">
	  <div class="img" style="padding: 30px 30px 30px 30px;">
	  	<a>
	  		<figure>
	  			<img src="images/<%= profile_img %>" class="card-img-top">
	  			<figcaption id="changeImg">사진 변경</figcaption>
	  		</figure>
	  	</a>
	  </div>
	  <div class="card-body">
	    <h5 class="card-title"><b><%= username %>님</b></h5>
	    <p class="card-text" id="changeTxt"><%= profile_txt %></p>
	  </div>
	</div>
	<div class="col-md-6">
		<!-- Modal -->
			<div class="modal fade" id="selectImg" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="staticBackdropLabel">프로필 이미지 변경</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<div>
							  <input class="form-control" accept="image/*" type="file" name="imgFile" id="imgFile" multiple>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" id="submitImg" class="btn btn-success">수정</button>
					        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
						</div>
					</div>
				</div>
			</div>
		<!-- end modal -->
		<button type="button" id="openImgModal" class="btn btn-outline-success" data-bs-toggle="modal" data-bs-target="#selectImg" style="display: none;">
			사진 수정
		</button><br><br>
		<!-- open modal -->
		<!-- Modal -->
			<div class="modal fade" id="writeTxt" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="staticBackdropLabel">프로필 메세지 변경</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<input type="text" id="profile_txt" name="profile_txt" value="<%= profile_txt %>" style="width: 100%; height: 100px;"/>
						</div>
						<div class="modal-footer">
							<button id="submitTxt" class="btn btn-success">수정</button>
					        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
						</div>
					</div>
				</div>
			</div>
		<!-- end modal -->
		<button type="button" id="openTxtModal" class="btn btn-outline-success" data-bs-toggle="modal" data-bs-target="#writeTxt" style="display: none;">
			프로필 메세지 수정
		</button>
		<!-- open modal -->
	</div>
</div>

<div class="wrap col-md-9">
	<div class="greenContainer">
		<div>
			<div class="grade">id : <%= userid %></div>
			<div class="name"><%= username %>님</div>
		</div>
		<div class="modify">i</div>
	</div>
	<div class="summaryContainer">
		<div class="item">
			<div class="number">000</div>
			<div>구매 후기</div>
		</div>
		<div class="item">
			<div class="number">111</div>
			<div>참여한 챌린지</div>
		</div>
		<div class="item">
			<div class="number">999</div>
			<div>쿠폰</div>
		</div>				
	</div>
	<div class="shippingStatusContainer">
		<div class="title">
			주문/배송조회
		</div>
		<div class="status">
			<div class="item">
				<div>
					<div class="green number">6</div>
					<div class="text">장바구니</div>
				</div>
				<div class="icon">></div>
			</div>
			<div class="item">
				<div>
					<div class="number">0</div>
					<div class="text">결제완료</div>
				</div>
				<div class="icon">></div>
			</div>
			<div class="item">
				<div>
					<div class="green number">1</div>
					<div class="text">배송중</div>
				</div>
				<div class="icon">></div>
			</div>
			<div class="item">
				<div>
					<div class="green number">3</div>
					<div class="text">구매확정</div>
				</div>
			</div>
		</div>
	</div>
	<div class="listContainer">
		<a href="MyOrderServlet" class="item">
			<div class="icon">§</div>
			<div class="text">주문 내역<span class="circle"></span></div>
			<div class="right">></div>
		</a>
		<a href="#" class="item">
			<div class="icon">§</div>
			<div class="text">반품/취소/교환 목록</div>
			<div class="right">></div>
		</a>
		<a href="ProfileCategoryServlet?category=myreview&userid=<%=userid%>" class="item">
			<div class="icon">§</div>
			<div class="text">구매 후기</div>
			<div class="right">></div>
		</a>
		<a href="ProfileCategoryServlet?category=mychallenge&userid=<%=userid%>" class="item">
			<div class="icon">§</div>
			<div class="text">내 챌린지</div>
			<div class="right">></div>
		</a>
		<a href="ProfileCategoryServlet?category=mystamp&userid=<%=userid%>" class="item">
			<div class="icon">§</div>
			<div class="text">내 도장</div>
			<div class="right">></div>
		</a>
		<a href="MyQuestionServlet" class="item">
			<div class="icon">§</div>
			<div class="text">내 문의 내역</div>
			<div class="right">></div>
		</a>
		<a href="AddressListServlet" class="item">
			<div class="icon">§</div>
			<div class="text">배송지 관리</div>
			<div class="right">></div>
		</a>
		<a href="PasswdCheckServlet" class="item">
			<div class="icon">§</div>
			<div class="text">계정 관리</div>
			<div class="right">></div>
		</a>
	</div>
</div>

<%-- <div class="col-md-7">
	<div style="padding-bottom: 70px;">
		<a href="#" class="btn btn-outline-success">입금, 결제</a>
		<a href="#" class="btn btn-outline-success">배송중</a>
		<a href="#" class="btn btn-outline-success">배송 완료</a>
		<a href="#" class="btn btn-outline-success">전체보기</a>
	</div>
		<a href="MyOrderServlet" class="btn btn-outline-success">1. 주문 내역</a>
		<a href="#" class="btn btn-outline-success">2. 반품/취소/교환 목록</a>
		<a href="ProfileCategoryServlet?category=myreview&userid=<%=userid%>" class="btn btn-outline-success">3. 내 구매후기</a><br>
		<br>
		<a href="ProfileCategoryServlet?category=mychallenge&userid=<%=userid%>" class="btn btn-outline-success">4. 내 챌린지</a>
		<a href="ProfileCategoryServlet?category=mystamp&userid=<%=userid%>" class="btn btn-outline-success">5. 내 도장</a>
		<a href="MyQuestionServlet" class="btn btn-outline-success">6. 내 문의 내역</a><br>
		<br>
		<a href="AddressListServlet" class="btn btn-outline-success">7. 배송지 관리</a>
		<a href="PasswdCheckServlet" class="btn btn-outline-success">8. 계정 관리</a><br>
		<br>
</div> --%>
</div>
</div>
</div>
<div class="modal" id="alertModal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">ZZP</h5>
      </div>
      <div class="modal-body">
        <p id="mesg"></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-success" data-bs-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
<button type="button" id="modalBtn" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#alertModal" style="display: none;">modal</button>

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#changeImg").on("click", function() {
			console.log("clickkkkkkkkk");
			$("#openImgModal").trigger("click");
		});//end fn
		$("#changeTxt").on("click", function() {
			console.log("click=============");
			$("#openTxtModal").trigger("click");
		});//end fn
		$("#profile_txt").on("click", function() {
			$(this).val("");
		});//end fn
		$("#submitTxt").on("click", function() {
			var profile_txt=$("#profile_txt").val();
			if (profile_txt.length == 0) {
				$("#modalBtn").trigger("click");
				$("#mesg").text("변경할 프로필 메세지를 입력하세요.");
			} else {
				//ajax
				$.ajax({
					type : "post",
					url : "ProfileChangeServlet",
					dataType : "text",
					data : {
						profile_txt : profile_txt
					},
					success : function(data, status, xhr) {
						console.log("success");
						console.log(data);
						$("#writeTxt").modal("hide");
						$(".modal-backdrop").hide();//모달창 닫고 백드롭 hide
						$("#changeTxt").text(data);
					},
					error: function(xhr, status, error) {
						alert(error);
					}
				});//end ajax
			}
		});//end submitTxt
		$("#submitImg").on("click", function() {
			var imgFile=$("#imgFile").val();
			if (false) {
				//$("#modalBtn").trigger("click");
				//$("#mesg").text("변경할 프로필 메세지를 입력하세요.");
			} else {
				console.log("이미지 수정 클릭");
				console.log(imgFile);
				//ajax
 				$.ajax({
					type : "post",
					url : "ProfileChangeServlet",
					dataType : "text",
					data : {
						profile_img : profile_img
					},
					success : function(data, status, xhr) {
						console.log("success");
						console.log(data);
						$("#writeTxt").modal("hide");
						$(".modal-backdrop").hide();//모달창 닫고 백드롭 hide
						//$("#changeTxt").text(data);
					},
					error: function(xhr, status, error) {
						alert(error);
					}
				});//end ajax
			}
		});//end submitImg
		function checkFileExtension(){ 
			let fileValue = $("#imgFile").val(); 
			let reg = /(.*?)\.(jpg|jpeg|png|gif)$/;
			if (fileValue.match(reg)) {
				return true;
			} else {
				alert("jpg, jpeg, png, gif 파일만 업로드 가능합니다.");
				return false;
			}
		};
	});//end ready
</script>