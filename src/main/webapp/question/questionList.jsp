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
	<div style="text-align: center; display: flex; justify-content:center; height: 100px; margin-bottom: 10px;" >
		<img src="images/question.png" alt="..." style="width: auto;">
	</div>
    <table  style="text-align: center;" class="table table-hover">
    	<tr>
    		<td>번호</td>
    		<td>상품</td>
    		<td>카테고리</td>
    		<td>제목</td>
    		<td>작성일</td>
    		<td>작성자</td>
    	</tr>
    <%
	 		PageDTO pDTO = (PageDTO)session.getAttribute("pDTO");
	 		List<QuestionDTO> list = pDTO.getList();
	 		for(int i = 0; i < list.size(); i++){
	 			QuestionDTO qDTO = list.get(i);
	%>
    	<tr>
    		<td> <%= qDTO.getQ_ID() %> </td>
    		<td> <span id="pId<%=qDTO.getP_ID()%>"><%=qDTO.getP_ID()%></span> </td>
    		<td> <%= qDTO.getQ_CATEGORY() %> </td>
    		<td> <a href="QuestionOneSelect?Q_ID=<%= qDTO.getQ_ID() %>&USERID=<%=qDTO.getUSERID()%>"> <%= qDTO.getQ_TITLE() %> </a> </td>
    		<td> <%= qDTO.getQ_CREATED() %> </td>
    		<td> <%= qDTO.getUSERID() %> </td>
    	</tr>
    <%
    	}
    %>
    <tr>
		<td colspan="6">
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
    	<td colspan="5"></td>
    	<td>  
    		<button class="btn btn-outline-success" onclick="location.href='questionInsert.jsp'">글쓰기</button>
    	</td>
    </tr>
    </table>
   