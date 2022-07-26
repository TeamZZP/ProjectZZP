<%@page import="com.dto.AddressDTO"%>
<%@page import="com.dto.MemberDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<table id="addTable" class="table table-hover" style="table-layout: fixed">
	<tr class="table-success">
		<th width="20%">배송지</th>
		<th width="50%">주소</th>
		<th width="10%">연락처</th>
		<th width="10%">수정·삭제</th>
	</tr>

<%
	MemberDTO member=(MemberDTO) session.getAttribute("login");
	HashMap<String, List<AddressDTO>> addressMap=(HashMap<String, List<AddressDTO>>) session.getAttribute("addressMap");
	System.out.println("addressListUpdate 안의 addressmap "+addressMap);
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
			int address_id=address.getAddress_id();
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
	<tr>
		<td style="padding:5 0 0 10px;">
			<span><%= address_name %></span><br>
			<span><%= receiver_name %></span><br>
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
			<div class="modal fade" id="deleteAddress" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
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
			        <button type="button" id="delete<%= address_id %>" class="btn btn-success">삭제</button>
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
			      </div>
			    </div>
			  </div>
			</div>
			<!-- end modal -->
			<div class="btns" style="display: inline-block">
			<!-- Button trigger modal -->
			<button type="button" id="change<%= address_id %>" data-edit="<%= address_id %>" class="btn btn-light btn-sm">수정</button>
			<button type="button" id="checkDelete<%= address_id %>" data-id="<%= address_id %>" class="btn btn-light btn-sm" data-bs-toggle="modal" data-bs-target="#deleteAddress">
				삭제
			</button><!-- open modal -->
			</div>
		</td>
<%
		}
	}
%>
	</tr>
</table>
