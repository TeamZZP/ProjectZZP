<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.dto.ImagesDTO" %>
    <%@page import="com.dto.CategoryProductDTO" %>
    <%@page import="com.dto.CategoryDTO" %>
    <%@page import="java.util.List" %>
    <% System.out.println("product.product.jsp");%>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  
  <style>
  .container {
  padding-right: 15px;
  padding-left: 15px;
  margin-right: auto;
  margin-left: auto;
}


</style>


  <div class="container ">
 		<h1 class="display=3" align="center">상품 목록</h1>
		</div>
	    <%
    
    //List<ImagesDTO> ilist = (List<ImagesDTO>)request.getAttribute("ImagesList");
    List<CategoryProductDTO> plist = (List<CategoryProductDTO>)request.getAttribute("productList");
   	

   // System.out.println("product/product.jsp에서 getAttribute한 ImagesDTO list==="+ilist);
   // System.out.println("product/product.jsp에서 getAttribute한 ProductDTO list==="+plist);
    
  %>
	<div class=container >
		<div class="row" align="center">
		
				<%
				
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
					%>
			<div class="col-md-3">
				<a href="ProductRetrieveServlet?p_id=<%=p_id%>"><img src="images/p_image/<%=p_image%>.png "  class="img-thumbnail" style=" width:300; height:300; "></a> 
				<a href="ProductRetrieveServlet?p_id=<%=p_id%>"><p class="fs-3 text-center"><%=p_name %></p></a> 
				<p class="fs-5 text-center text-success" style="color: green;"><%=p_selling_price %>원
				
		
			</div>
			<%
				}
			%>	
		</div>
  </div>
