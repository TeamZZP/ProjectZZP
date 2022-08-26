<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Set"%>
<%@page import="com.dto.AddressDTO"%>
<%@page import="com.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function () {
		
		$(".category").click(function() {
			let category = $(this).attr("data-category");
			location.href="AdminCategoryServlet?category="+category;
		});
	
	});//end ready
</script>
<div class="container">
	<form action="" method="post">
		<div class="row">
			<div class="btn-group" role="group" aria-label="Basic example">
				<button type="button" class="btn btn-outline-success category" data-category="member" id="memberManagement">회원관리</button>
				<button type="button" class="btn btn-outline-success category" data-category="member" id="memberManagement">회원신고관리</button>
				<button type="button" class="btn btn-outline-success category" data-category="product" id="productManagement">상품관리</button>
				<button type="button" class="btn btn-outline-success category" data-category="challenge" id="challengeManagement">챌린지관리</button>
			</div>
		</div>
	</form>
</div>

<div id="adminContent" class="col-md-auto">
<div class="container" style="margin-top: 5px; margin-bottom: 5px;">
	<div class="row row-cols-auto">
		  <div class="col"></div>
			  <div class="col">
				  <select class="form-select" data-style="btn-info" id="inputGroupSelect01" 
				  		  style="width: 145px; margin-right: -20px; margin-left: -24px;">
					    <option selected disabled hidden>카테고리</option>
					    <option value="userid">아이디</option>
					    <option value="username">이름</option>
					    <option value="email">이메일</option>
					    <option value="phone">전화번호</option>
					    <option value="address">주소</option>
				  </select>
			  </div>
		  <div class="col"><input type="text" class="form-control" style="width: 150px; margin-right: -20px;"></div>
	      <div class="col"><button type="button" class="btn btn-success">검색</button></div>
	</div>
</div>
<div class="container col-md-auto">
<div class="row justify-content-md-center">
<br>
<table class="table table-hover table-sm">
	<tr>
		<th>아이디</th>
		<th>이름</th>
		<th>이메일</th>
		<th>전화번호</th>
		<th>주소</th>
		<th>관리</th>
	</tr>
<%
	List<MemberDTO> memberList=(List<MemberDTO>) session.getAttribute("memberList");
	HashMap<String, List<AddressDTO>> addressMap=(HashMap<String, List<AddressDTO>>) session.getAttribute("addressMap");
	
	for (MemberDTO member : memberList) {
		//System.out.println(member);
		String userid=member.getUserid();
		String passwd=member.getPasswd();
		String username=member.getUsername();
		String email1=member.getEmail1();
		String email2=member.getEmail2();
		String phone=member.getPhone();
		String created_at=member.getCreated_at();
		
//		for (int i = 0; i < addressMap.size(); i++) {
			List<AddressDTO> addressList=addressMap.get(userid);
//			AddressDTO address=addressList.get(i);//addressMap의 size만큼 for문 반복 중//userid로 뽑아온 addressList의 size와 for문의 size가 다름//indexOutOfBounds 발생
			
			for (int j = 0; j < addressList.size(); j++) {
				AddressDTO address=addressList.get(j);
				String address_name=address.getAddress_name();
				String receiver_name=address.getReceiver_name();
				String receiver_phone=address.getReceiver_phone();
				String post_num=address.getPost_num();
				String addr1=address.getAddr1();
				String addr2=address.getAddr2();
				int default_chk=address.getDefault_chk();
				
				//System.out.println("출력 확인 : "+address);
/* 	if (addr2 == null) {
		addr2="상세 주소를 입력하세요.";
	} */

%>
<script type="text/javascript">
	$(document).ready(function() {
		$("#deleteMember").on("shown.bs.modal", function (e) {//#deleteMember modal 창을 열 때 선택한 버튼의 data-id를 가져옴(deleteID로 설정했더니 안돼서 다시 id로 바꿈)--modal창의 삭제 버튼에 저장
		    var id = $(e.relatedTarget).data("id");
		    $("#delete<%= userid %>").val(id);
		});//end fn
		$("#delete<%= userid %>").on("click", function() {//모달의 삭제 버튼 클릭시 회원 삭제
			var userid=$(this).val();
			console.log(userid);
			//*****ajax
			$.ajax({
				type : "post",
				url : "AccountDeleteServlet",//페이지 이동 없이 해당 url에서 작업 완료 후 데이터만 가져옴
				dataType : "text",
				data : {//서버에 전송할 데이터
					userid : userid
				},
				success : function(data, status, xhr) {
					alert(data);
					//location.href="memberList.jsp";//수정 후 페이지 이동--새로운 목록으로 출력하도록 수정
				},
				error: function(xhr, status, error) {
					console.log(error);
				}						
			});//end ajax
		});//end fn
<%--  		$("#checkDelete<%= userid %>").on("click", function() {//첫번째 선택자만 이벤트 실행됨//userid 추가해서 버튼 구분함--ok
			event.preventDefault();
			var id = $(this).attr("data-xxx");
		});//end fn --%>
		$("#change<%= userid %>").on("click", function() {//회원 정보 출력 페이지로 이동
			var userid=$(this).attr("data-edit");
			console.log(userid);
			
		});//end fn
	});//end ready
</script>
<form>
	<tr id="list">
		<td><%= userid %></td>
		<td><%= username %></td>
		<td><%= email1+"@"+email2 %></td>
		<td><%= phone %></td>
		<td><%= post_num + "&nbsp;&nbsp;&nbsp;" + addr1+ "&nbsp;" + addr2 %></td>
		<td>
			<!-- Modal -->
			<div class="modal fade" id="deleteMember" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="staticBackdropLabel">회원 삭제</h5>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			        <%-- 회원 <%= userid %>님을 삭제하시겠습니까?--첫번째 데이터가 출력됨 --%>
			        선택한 회원을 삭제하시겠습니까?
			      </div>
			      <div class="modal-footer">
			        <button type="button" id="delete<%= userid %>" class="btn btn-success">삭제</button>
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
			      </div>
			    </div>
			  </div>
			</div>
			<!-- Button trigger modal -->
			<button type="button" id="change<%= userid %>" data-edit="<%= userid %>" class="btn btn-outline-success btn-sm">수정</button>
			<button type="button" id="checkDelete<%= userid %>" data-id="<%= userid %>" class="btn btn-outline-dark btn-sm" data-bs-toggle="modal" data-bs-target="#deleteMember">
				삭제
			</button><!-- open modal -->
		</td>
<%
			}
//		}
	}
%>

	</tr>
</form>
</table>
</div>
</div>
</div>