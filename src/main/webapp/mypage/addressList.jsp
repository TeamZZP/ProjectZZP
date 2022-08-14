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
<style>
	th {
		text-align: center;
	}
</style>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#addAddress").on("click", function() {
			console.log("추가 버튼 클릭");
			location.href="AddressAddServlet";
		});//end fn
	});//end ready
</script>
<div class="container">
<div class="row">
<div class="col-lg-2">
	<div class="col">회원 관리</div>
	<div class="col">주문 관리</div>
	<div class="col">상품 관리</div>
	<div class="col">상품 문의</div>
	<div class="col">문의 게시판</div>
</div>
<div class="col-lg-10">
<table class="table table-hover" style="table-layout: fixed">
	<tr class="table-success">
		<th width="20%">배송지</th>
		<th width="50%">주소</th>
		<th width="10%">연락처</th>
		<th width="10%">수정·삭제</th>
	</tr>
<%
	MemberDTO member=(MemberDTO) session.getAttribute("login");
	HashMap<String, List<AddressDTO>> addressMap=(HashMap<String, List<AddressDTO>>) session.getAttribute("addressMap");
	
	String userid=member.getUserid();
//	String passwd=member.getPasswd();
	String username=member.getUsername();
	String email1=member.getEmail1();
	String email2=member.getEmail2();
	String phone=member.getPhone();
//	String created_at=member.getCreated_at();
	
	String addr2=null;
	for (int i = 0; i < addressMap.size(); i++) {
		List<AddressDTO> addressList=addressMap.get(userid);
		
		for (int j = 0; j < addressList.size(); j++) {
			AddressDTO address=addressList.get(j);
			String address_name=address.getAddress_name();
			String receiver_name=address.getReceiver_name();
			String receiver_phone=address.getReceiver_phone();
			String post_num=address.getPost_num();
			String addr1=address.getAddr1();
			addr2=address.getAddr2();
			int default_chk=address.getDefault_chk();
			
			if (addr2 == null){
				addr2="상세 주소를 입력하세요.";
			}
			System.out.println("출력 확인 : "+address);
%>
<form>
	<tr id="list">
		<td style="padding:5 0 0 10px;">
			<span><%= address_name %></span><br>
			<span><%= username %></span><br>
			<span><%= default_chk %></span>
		</td>
		<td>
			<span style="font-size: 14px"><%= post_num %></span><br>
			<%=  addr1+ "<br>" + addr2 %>
		</td>
		<td style="text-align: center;">
			<span><%= phone %></span>
		</td>
		<td style="text-align: center;">
			<!-- Modal -->
			<div class="modal fade" id="deleteMember" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="staticBackdropLabel">회원 삭제</h5>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			        선택한 배송지를 삭제하시겠습니까?
			      </div>
			      <div class="modal-footer">
			        <button type="button" id="delete<%= userid %>" class="btn btn-success">삭제</button>
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
			      </div>
			    </div>
			  </div>
			</div>
			<div class="btns" style="display: inline-block">
			<!-- Button trigger modal -->
			<button type="button" id="change<%= userid %>" data-edit="<%= userid %>" class="btn btn-light btn-sm">수정</button>
			<button type="button" id="checkDelete<%= userid %>" data-id="<%= userid %>" class="btn btn-light btn-sm" data-bs-toggle="modal" data-bs-target="#deleteMember">
				삭제
			</button><!-- open modal -->
			</div>
		</td>
<%
		}
	}
%>
	</tr>
</form>
</table>
</div>
</div>
	<div style="width : 95px; float : right;">
		<input type="button" id="addAddress" class="btn btn-success btn-sm" value="배송지 추가">
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
