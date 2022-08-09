<<<<<<< HEAD
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Set"%>
<%@page import="com.dto.AddressDTO"%>
<%@page import="com.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- Bootstrap CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<div class="dropdown">
  <button class="btn btn-success btn-sm dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
    카테고리
  </button>
  <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
    <li><a class="dropdown-item" href="#">아이디</a></li>
    <li><a class="dropdown-item" href="#">이름</a></li>
    <li><a class="dropdown-item" href="#">이메일</a></li>
    <li><a class="dropdown-item" href="#">전화번호</a></li>
    <li><a class="dropdown-item" href="#">주소</a></li>
  </ul>
  <input type="text"/>
</div>
<br>
<table class="table table-sm">
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

	<tr>
		<td><%= userid %></td>
		<td><%= username %></td>
		<td><%= email1+"@"+email2 %></td>
		<td><%= phone %></td>
		<td><%= post_num + "&nbsp;&nbsp;&nbsp;" + addr1+ "&nbsp;" + addr2 %></td>
		<td>
			<button class="btn btn-outline-success btn-sm">수정</button>
			<button class="btn btn-outline-success btn-sm">삭제</button>
		</td>
<%
			}
//		}
	}
%>
	</tr>
</table>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>


