<%@page import="com.dto.AddressDTO"%>
<%@page import="com.dto.MemberDTO"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<!-- Required meta tags -->
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<%
/* 	MemberDTO member=(MemberDTO) request.getAttribute("login");
	AddressDTO address=(AddressDTO) request.getAttribute("address");//기본 배송지 출력
	
	List<AddressDTO> addressList=(List<AddressDTO>) request.getAttribute("addressList");

	
	String userid=member.getUserid();
	String passwd=member.getPasswd();
	String username=member.getUsername();
	String email1=member.getEmail1();
	String email2=member.getEmail2();
	String phone=member.getPhone();
	String created_at=member.getCreated_at();
	
	int address_id=address.getAddress_id();
	String address_name=address.getAddress_name();
	String receiver_name=address.getReceiver_name();
	String receiver_phone=address.getReceiver_phone();
	String post_num=address.getPost_num();
	String addr1=address.getAddr1();
	String addr2=address.getAddr2();
	int default_chk=address.getDefault_chk();
	
 	for (int j = 0; j < addressList.size(); j++) {
		address=addressList.get(j);
		System.out.println(address);
		address_id=address.getAddress_id();
		address_name=address.getAddress_name();
		receiver_name=address.getReceiver_name();
		receiver_phone=address.getReceiver_phone();
		post_num=address.getPost_num();
		addr1=address.getAddr1();
		addr2=address.getAddr2();
		default_chk=address.getDefault_chk();
	} */
%>
<jsp:include page="../admin/accountForm_admin.jsp" flush="true"></jsp:include><br>
<jsp:include page="../mypage/addressList.jsp" flush="true"></jsp:include><br>