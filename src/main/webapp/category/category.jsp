<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%System.out.println("category폴더 안 category.jsp"); %>
    
    <%
   HashMap<Integer,String> c_nameMap = (HashMap<Integer,String>)request.getAttribute("category_nameMap");
    
    for (int key : c_nameMap.keySet()) {
		String cName = c_nameMap.get(key);
		%>
		
		<%-- <a href="aa.jsp?"+<%=cName %>><%=cName %></a>  --%>
		
		<% 
	      }
          %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>