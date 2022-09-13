<%@page import="com.dto.QuestionProductDTO"%>
<%@page import="com.dto.ProductDTO"%>
<%@page import="com.dto.MemberDTO"%>
<%@page import="com.dto.PageDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.dto.QuestionDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<%
	String mesg = (String)session.getAttribute("mesg");
	if(mesg != null){
%>
	<script>
		alert("<%=mesg%>");
	</script>
<%
	}
	session.removeAttribute("mesg");
%>
	
    <table  style="text-align: center;" class="table table-hover">
    	<tr>
    		<td>번호</td>
    		<td>상품명</td>
    		<td>카테고리</td>
    		<td>제목</td>
    		<td>작성일</td>
    		<td>작성자</td>
    		<td>답변상태</td>
    	</tr>
    <%
	 		PageDTO pDTO = (PageDTO)session.getAttribute("pDTO");
	 		List<QuestionProductDTO> list = pDTO.getList();
	 		for(int i = 0; i < list.size(); i++){
	 			QuestionProductDTO qDTO = list.get(i);
	 			String created = qDTO.getQ_created();
	 			String crete = created.substring(0, 10);

	 			String user = qDTO.getUserid();
	 %>
    		<td> <%= qDTO.getQ_id() %> </td>
    		<%if(qDTO.getP_name() == null){ %>
	    		<td> - </td>
	    	<% } else { %> 
	    		<td> <%= qDTO.getP_name() %> </td>
    		<%} %>
    		<td> <%= qDTO.getQ_category() %> </td>
    		<td> <a style="text-decoration: none; color: black;" 
    			href="QuestionOneSelect?Q_ID=<%= qDTO.getQ_id() %>&USERID=<%=qDTO.getUserid()%>"> <%= qDTO.getQ_title() %> </a> </td>
    		<td> <%= crete %> </td>
    		<td> 
    			<% 
    			   String use = "";	
    			   for(int j=0; j < user.substring(5).length(); j++){
    				use += "*";
    			%>
    			<% } %>
    			<%= user.substring(0, 5).concat(use) %>
    		</td>
    		<td> <%= qDTO.getQ_status() %> </td>
    	</tr>
    <%
    	}
    %>
    <tr>
		<td colspan="7">
			 <%
		        int curPage = pDTO.getCurPage();
		        int perPage = pDTO.getPerPage();
				int totalCount = pDTO.getTotalCount();
				int totalPage = totalCount/perPage; //페이지수 구하기
				if(totalCount%perPage!=0) totalPage++; //페이지수 구하기 나머지가 있으면 +1
		        for(int i=1; i <= totalPage; i++){//1페이지부터 시작함으로 i=1
		          	if(i== curPage){
		          		out.print(i+"&nbsp;"); //현재페이지
		          	}else{
		          		out.print("<a style='color: green;' href = 'QuestionListServlet?curPage="+i+"'>" + i + " </a>");  
		          	} //다른 페이지 선택시 링크로 이동
		        }//end for
		  	 %>
		</td>
	</tr>
    <tr>
    	<td colspan="6"></td>
    	<td>  
    		<button class="btn btn-outline-success" onclick="location.href='questionInsert.jsp'">글쓰기</button>
    	</td>
    </tr>
    </table>
   