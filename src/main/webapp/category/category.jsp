
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.List" %>
    <%@page import="com.dto.CategoryDTO" %>
   <style>
  #category_a:hover{
  		color: green;
		font-weight: bold;
		cursor: pointer;
  	}
   </style>
   
	<div class="row " >
	 
	<div id="category">
			<ul  >
				<li class="nav-link px-2 link-dark"><a id="category_a" class="categorycss" onclick="getCategoryProduct()" >베스트</a></li>
			
    <%
    List<CategoryDTO> category_list = (List<CategoryDTO>)request.getAttribute("category_list");
    
   
    
    for( int i = 0; i< category_list.size(); i++){
    	
    	int c_id = category_list.get(i).getC_id();
    	String c_name = category_list.get(i).getC_name();
    	int c_rnk = category_list.get(i).getC_rnk();
    	String userid = category_list.get(i).getUserid();
    	String c_created_date = category_list.get(i).getC_created_date();
    	
    %>
		
				<li class="nav-link px-2 link-dark" ><a id="category_a"   class="categorycss" onclick="getCategoryProduct('<%=c_id%>')"><%=c_name %></a></li>
				<% } %>
			</ul>
		</div>
		
</div>
	</div>

	
	
	