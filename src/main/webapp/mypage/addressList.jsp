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
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<div class="container">
<div class="row">
<div class="col-lg-2">
	<table>
		<tr>
			<td>좌측 카테고리</td>
		</tr>
	</table>
</div>
<div class="col-lg-10">
<div style="width : 90px; float : right;">
	<input type="button" class="btn btn-success btn-sm" value="배송지 추가">
</div>
<table class="table table-sm">
	<tr>
		<th>배송지명</th>
		<th>수령인</th>
		<th>연락처</th>
		<th>우편번호</th>
		<th>주소</th>
		<th>상세주소</th>
		<th>기본 배송지</th>
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
<script type="text/javascript">
	$(document).ready(function() {
		
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
			        선택한 배송지를 삭제하시겠습니까?
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
		<td>
			default_check
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
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
