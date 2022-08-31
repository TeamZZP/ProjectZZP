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
	a {
		color : black;
		text-decoration: none;
	}
	.modal {
		overflow: auto;
	}
</style>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<div id="addContainer">
<div class="container" id="divCon">
<div class="row">
<div class="col-12">
<div id="addTableDiv">
<table id="addTable" class="table table-hover" style="table-layout: fixed">
	<tr class="table-success">
		<th width="20%">배송지</th>
		<th width="60%">주소</th>
		<th width="20%">연락처</th>
	</tr>
<%
	MemberDTO member=(MemberDTO) session.getAttribute("login");
//	HashMap<String, List<AddressDTO>> addressMap=(HashMap<String, List<AddressDTO>>) request.getAttribute("addressMap");
	List<AddressDTO> addressList=(List<AddressDTO>) request.getAttribute("addressList");
	
	String userid=member.getUserid();
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
</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
