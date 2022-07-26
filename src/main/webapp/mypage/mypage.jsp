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
</style>
<div class="container col-md-8">
<input type="hidden" name="old_file" id="old_file" value="<%= profile_img %>">

<div class="justify-content-center">
<div class="row">
<div class="col-md-5">
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
<div class="col-md-7">
	<div style="padding-bottom: 70px;">
		<a href="#" class="btn btn-outline-success">입금, 결제</a>
		<a href="#" class="btn btn-outline-success">배송중</a>
		<a href="#" class="btn btn-outline-success">배송 완료</a>
		<a href="#" class="btn btn-outline-success">전체보기</a>
	</div>
	<div>
		<a href="MyOrderServlet" class="btn btn-outline-success">1. 주문 내역</a>
		<a href="#" class="btn btn-outline-success">2. 반품/취소/교환 목록</a>
		<a href="ProfileCategoryServlet?category=myreview&userid=<%=userid%>" class="btn btn-outline-success">3. 내 구매후기</a>
		<a href="" class="btn btn-outline-success">4. 내 쿠폰함</a><br>
		<br>
		<a href="ProfileCategoryServlet?category=mychallenge&userid=<%=userid%>" class="btn btn-outline-success">5. 내 챌린지</a>
		<a href="ProfileCategoryServlet?category=mystamp&userid=<%=userid%>" class="btn btn-outline-success">6. 내 도장</a>
		<a href="MyQuestionServlet" class="btn btn-outline-success">7. 내 문의 내역</a><br>
		<br>
		<a href="AddressListServlet" class="btn btn-outline-success">8. 배송지 관리</a>
		<a href="checkPasswd.jsp" class="btn btn-outline-success">9. 계정 관리</a><br>
		<br>
	</div>
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