<%@page import="com.dto.AddressDTO"%>
<%@page import="com.dto.MemberDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<!-- Required meta tags -->
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<% 
	MemberDTO member=(MemberDTO) session.getAttribute("login");
	String userid=member.getUserid();
%>
<style>
	th {
		text-align: center;
	}
	a {
		color : black;
		text-decoration: none;
	}
	.currCategory {
		color: green; 
		font-weight: bold;
	}
	.modal {
		overflow: auto;
	}
	.tableTop {
    	border-bottom-color: #24855B;
    	border-bottom-width: 2.5px;
    }
</style>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<div id="addContainer">
<div class="container" id="divCon">
<div class="row">
<div class="col-lg-2">
		<div class="col">
			<a href="MypageServlet">마이페이지 홈</a>
		</div>
	   <div class="col">주문 내역</div>
	   <div class="col">반품/취소/교환 목록</div>
	   <div class="col">
	   		<a href="ProfileCategoryServlet?category=myreview&userid=<%=userid%>">내 구매후기</a>
	   </div>
	   <div class="col">
	   		<a href="ProfileCategoryServlet?category=mychallenge&userid=<%=userid%>">내 챌린지</a>
	   </div>
	   <div class="col">
	   		<a href="ProfileCategoryServlet?category=mystamp&userid=<%=userid%>">내 도장</a>
	   </div>
	   <div class="col">
	      <a href="MyQuestionServlet">내 문의 내역</a>
	   </div>
	   <div class="col">
	      <a href="AddressListServlet" class="currCategory">배송지 관리</a>
	   </div>
	   <div class="col">
	      <a href="checkPasswd.jsp">계정 관리</a>
	   </div>
</div>
<div class="col-lg-10">
<div id="addTableDiv">
<table id="addTable" class="table table-hover" style="table-layout: fixed">
	<tr class="tableTop">
		<th width="20%">배송지</th>
		<th width="55%">주소</th>
		<th width="20%">연락처</th>
		<th width="15%">수정·삭제</th>
	</tr>
<%
	//MemberDTO member=(MemberDTO) session.getAttribute("login");
//	HashMap<String, List<AddressDTO>> addressMap=(HashMap<String, List<AddressDTO>>) request.getAttribute("addressMap");
	List<AddressDTO> addressList=(List<AddressDTO>) request.getAttribute("addressList");
	
	//String userid=member.getUserid();
//	String passwd=member.getPasswd();
	String username=member.getUsername();
	String email1=member.getEmail1();
	String email2=member.getEmail2();
	String phone=member.getPhone();
//	String created_at=member.getCreated_at();
	
	String addr2=null;
	int size=0;
	int address_id=0;
	int default_chk=0;
//	for (int i = 0; i < addressMap.size(); i++) {
//		List<AddressDTO> addressList=addressMap.get(userid);
		for (int j = 0; j < addressList.size(); j++) {
			AddressDTO address=addressList.get(j);
			address_id=address.getAddress_id();
			String address_name=address.getAddress_name();
			String receiver_name=address.getReceiver_name();
			String receiver_phone=address.getReceiver_phone();
			String post_num=address.getPost_num();
			String addr1=address.getAddr1();
			addr2=address.getAddr2();
			default_chk=address.getDefault_chk();
			
			size += 1;//회원의 배송지 갯수
			
//			System.out.println("출력 확인 : "+address);
//			System.out.println("회원의 배송지 갯수 : "+size);
%>
<script type="text/javascript">
	$(document).ready(function() {
		if (<%= default_chk %> == "1") {
			$("#check<%= address_id %>").text("기본 배송지");
		}
		
		$("#addAddress").on("click", function() {
			console.log("추가 버튼 클릭");
			location.href="addAddress.jsp";
		});//end fn
		
<%--
		$("#checkDelete<%= address_id %>").on("click", function() {
			console.log("삭제 버튼 클릭");//클릭은 한 번 잘 됨
		});//end fn
 		$("#deleteAddress<%= address_id %>").on("shown.bs.modal", function (e) {
//		    if (!($("#deleteAddress").data('bs.modal') || {})._isShown){ 
//		        $("#deleteAddress").modal('show');
//		    }
			console.log("open");
			var id = $(e.relatedTarget).data("id");
			var chk = $(e.relatedTarget).data("chk");//모달을 open한 버튼에 data-chk 설정
			$("#delete<%= address_id %>").val(id);
			$("#delete<%= address_id %>").attr("data-chk",chk);//모달창 data-chk 속성에 값 저장
			console.log($("#delete<%= address_id %>").attr("data-chk"));
		});//end fn
--%>
		
		//버튼 구분 userid->address_id로
		$("#delete<%= address_id %>").on("click", function() {//모달 창에서 삭제 버튼 클릭
			event.preventDefault();
			var id = $("#checkDelete<%= address_id %>").data("id");
			var chk = $("#checkDelete<%= address_id %>").data("chk");//모달을 open한 버튼에 data-chk 설정
			console.log(id);
			console.log(chk);
			var xxx=$("#checkDelete<%= address_id %>");
			$("#delete<%= address_id %>").val(id);
			$("#delete<%= address_id %>").attr("data-chk",chk);//모달창 data-chk 속성에 값 저장
			var size=$("#listSize").val();
  			if (size <= 1) {
				console.log(size);
				alert("배송지는 한 개 이상 있어야 합니다.");
				$("#deleteAddress<%= address_id %>").modal("hide");
				$(".modal-backdrop").hide();//모달창 닫고 백드롭 hide
				window.location.reload();//새로고침 자동-스크롤 멈춤 현상 때문에
			} else if(chk == 1){//기본 배송지
				alert("기본 배송지는 삭제할 수 없습니다.");
				$("#deleteAddress<%= address_id %>").modal("hide");
				$(".modal-backdrop").hide();//모달창 닫고 백드롭 hide
				window.location.reload();//새로고침 자동-스크롤 멈춤 현상 때문에
			} else {
				console.log(size);
 	 			$.ajax({
					type : "post",
					url : "AddressDeleteServlet",//페이지 이동 없이 해당 url에서 작업 완료 후 데이터만 가져옴
					dataType : "text",
					data : {//서버에 전송할 데이터
						address_id : id
					},
					success : function(data, status, xhr) {
						alert("해당 배송지가 삭제되었습니다."); 
						$("#deleteAddress<%= address_id %>").modal("hide");
						$(".modal-backdrop").hide();//모달창 닫고 백드롭 hide
						//$("#divCon").empty();
						//$("#addContainer").append(data);
						console.log("success");
						xxx.parents().filter("tr").remove();
						window.location.reload();//새로고침 자동-스크롤 멈춤 현상 때문에
					},
					error: function(xhr, status, error) {
						console.log(error);
					}
				});//end ajax
			}
		});//end fn
		
		$("#change<%= address_id %>").on("click", function() {//배송지 정보 출력 페이지로 이동
			var address_id=$(this).attr("data-edit");
			console.log(address_id);
			location.href="AddressSelectServlet?address_id=<%= address_id %>";
		});//end fn
	});//end ready
</script>
	<tr>
		<td style="padding:5 0 0 10px;">
			<span><%= address_name %></span><br>
			<span><%= receiver_name %></span><br>
			<span id="check<%= address_id %>" style="font-size: 12px; background-color: Gainsboro; font-weight: bold"></span>
		</td>
		<td>
			<span style="font-size: 14px"><%= post_num %></span><br>
			<%=  addr1+ "<br>" + addr2 %>
		</td>
		<td style="text-align: center;">
			<span><%= receiver_phone.substring(0, 3)+"-"
					+ receiver_phone.substring(3, 7)+"-"
					+ receiver_phone.substring(7, 11) %></span>
		</td>
		<td style="text-align: center;">
			<!-- Modal -->
			<div class="modal fade" id="deleteAddress<%= address_id %>" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="staticBackdropLabel">배송지 삭제</h5>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			        선택한 배송지를 삭제하시겠습니까?
			      </div>
			      <div class="modal-footer">
			        <button type="button" id="delete<%= address_id %>" data-chk="" class="btn btn-success">삭제</button>
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
			      </div>
			    </div>
			  </div>
			</div>
			<!-- end modal -->
			<div class="btns" style="display: inline-block">
			<!-- Button trigger modal -->
			<button type="button" id="change<%= address_id %>" data-edit="<%= address_id %>" class="btn btn-light btn-sm">수정</button>
			<button type="button" id="checkDelete<%= address_id %>" data-id="<%= address_id %>" data-chk="<%= default_chk %>"
								 class="btn btn-light btn-sm" data-bs-toggle="modal" data-bs-target="#deleteAddress<%= address_id %>">
				삭제
			</button><!-- open modal -->
			</div>
		</td>
<%
		}
//	}
%>
	</tr>
	
</table>
<input type="hidden" id="listSize" value="<%= size %>"><!-- for문 바깥에서 배송지 갯수 저장 -->
</div>
</div>
</div>
	<div style="width : 95px; float : right;">
		<input type="button" id="addAddress" class="btn btn-success btn-sm" value="배송지 추가">
	</div>
</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
