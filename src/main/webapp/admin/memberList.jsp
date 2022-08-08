<<<<<<< HEAD
<%@page import="java.util.List"%>
<%@page import="com.dto.AddressDTO"%>
<%@page import="com.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	List<MemberDTO> memberList=(List<MemberDTO>) session.getAttribute("memberList");
	for (MemberDTO member : memberList) {
		//System.out.println(member);
		String userid=member.getUserid();
		String passwd=member.getPasswd();
		String username=member.getUsername();
		String email1=member.getEmail1();
		String email2=member.getEmail2();
		String phone=member.getPhone();
		String created_at=member.getCreated_at();
	
/* 	if (addr2 == null) {
		addr2="상세 주소를 입력하세요.";
	} */
%>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script>

</script>
<%= userid + passwd %>
<%
	}
%>







=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
memberList 뿌려줄 화면
>>>>>>> b36693a753a70930130cbfe844234815de43b9ca
