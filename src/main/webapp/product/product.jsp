<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.dto.ImagesDTO" %>
    <%@page import="com.dto.CategoryProductDTO" %>
    <%@page import="com.dto.CategoryDTO" %>
    <%@page import="java.util.List" %>
   
    <%
    
    //List<ImagesDTO> ilist = (List<ImagesDTO>)request.getAttribute("ImagesList");
    List<CategoryProductDTO> plist = (List<CategoryProductDTO>)request.getAttribute("productList");
   

   // System.out.println("product/product.jsp에서 getAttribute한 ImagesDTO list==="+ilist);
   // System.out.println("product/product.jsp에서 getAttribute한 ProductDTO list==="+plist);
    

   for ( int i = 0 ; i < plist.size() ; i++ ) {
	   
	    int p_id = plist.get(i).getP_id();
	    String p_name =plist.get(i).getP_name();
		String p_content =plist.get(i).getP_content();
		int c_id =plist.get(i).getC_id();
		int p_cost_price =plist.get(i).getP_cost_price();
		int p_selling_price =plist.get(i).getP_selling_price();
		int p_discount =plist.get(i).getP_discount();
		String p_created=plist.get(i).getP_created();
		int p_stock =plist.get(i).getP_stock();
		String userid =plist.get(i).getUserid();
		String p_image = plist.get(i).getP_image();
		
	   System.out.println("getP_name"+plist.get(i).getP_name());
	   System.out.println("getP_image"+plist.get(i).getP_image());
	   
 
   
   
    %>
    
    <br>
  
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

		<img src="images/p_image/<%=p_image%>.png"><br>
		<h3><%=p_name %></h3>
		<h3><%=p_selling_price %></h3>
	<%} %>		
</body>
</html>