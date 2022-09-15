<%@page import="com.dto.CategoryProductDTO"%>
<%@page import="java.io.Console"%>
<%@page import="java.util.List"%>
<%@page import="com.dto.ChallengeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<style type="text/css">
 .retrieve{
  cursor: pointer;
 }
 
 #card{
 height: 25;
 width: 15;
 }
</style>
</head>
<body>
<!-- 배너 -->
<div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
   <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="true">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
     </div>
  <div class="carousel-inner">
  	<!-- ZZP소개 -->
    <div class="carousel-item active" data-bs-interval="3000" onclick="javascrip:location.href='IntroductionUIServlet';">
      <img src="images/main/banner_zzp.png" class="d-block w-100" alt="ZZP소개">
    </div>
    <!-- 타임세일 -->
    <div class="carousel-item" data-bs-interval="3000" onclick="javascrip:location.href='ProductSearchServlet?c_id=6';">
      <img src="images/main/banner_sale.png" class="d-block w-100" alt="타임세일">
    </div>
    <%
    	ChallengeDTO challThisMonth = (ChallengeDTO) request.getAttribute("challThisMonth");
    %>
    <!-- 이달의챌린지 -->
    <div class="carousel-item" data-bs-interval="3000" onclick="javascrip:location.href='ChallengeDetailServlet?chall_id=<%= challThisMonth.getChall_id() %>';">
      <img src="images/main/banner_monthchall.png" class="d-block w-100" alt="이달의챌린지">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
</div>
<br>


<!-- 베스트상품 -->
<div class="container px-4 py-5">
	<nav class="nav" >
	  <b style="font-size: xx-large; color: black;">BEST PRODUCT</b>
	</nav>
</div>
<!-- 베스트상품_carousel -->
<div id="carouselExampleInterval2" class="carousel slide" style="margin-top: -130px;">
  <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="true">
  <div class="carousel-inner">
  	<!-- carousel_1 -->
    <div class="carousel-item active" data-bs-interval="false">
      <div class="container px-4 py-5" id="custom-cards">
	    <div class="row row-cols-1 row-cols-lg-3 align-items-stretch g-4 py-5">
	    <%
	    int idx = 3;
	    List<CategoryProductDTO> product_list = (List<CategoryProductDTO>)request.getAttribute("bestprod"); 
		 if(product_list.size()<3){
			idx = product_list.size();
		} 
	    for ( int i = 0 ; i < idx ; i++ ) {
		    int p_id = product_list.get(i).getP_id();
		    String p_name =product_list.get(i).getP_name();
			String p_content =product_list.get(i).getP_content();
			int c_id =product_list.get(i).getC_id();
			int p_cost_price =product_list.get(i).getP_cost_price();
			int p_selling_price =product_list.get(i).getP_selling_price();
			int p_discount =product_list.get(i).getP_discount();
			String p_created=product_list.get(i).getP_created();
			int p_stock =product_list.get(i).getP_stock();
			String userid =product_list.get(i).getUserid();
			String p_image = product_list.get(i).getP_image();
	    %>
	      <div class="col retrieve" onclick="javascrip:location.href='ProductRetrieveServlet?p_id=<%=p_id%>';">
	        <div class="card card-cover h-100 overflow-hidden text-bg-dark rounded-4 shadow-lg" 
	        	style="background-image: url('images/p_image/<%=p_image%>'); background-size:cover;">
	          <div class="d-flex flex-column h-100 p-5 pb-3 text-white fw-bold text-shadow-1">
	            <h2 class="pt-5 mt-5 mb-4 display-6 lh-1 fw-bold text-shadow-1"><%= p_content %></h2>
	            <ul class="d-flex list-unstyled mt-auto">
	              <li class="me-auto">
	              </li>
	              <li class="d-flex align-items-center me-3">
	                <svg class="bi me-2" width="1em" height="1em"><use xlink:href="#geo-fill"></use></svg>
	                <small><%= p_name %></small>
	              </li>
	              <li class="d-flex align-items-center">
	                <svg class="bi me-2" width="1em" height="1em"><use xlink:href="#calendar3"></use></svg>
	                <small><%= p_selling_price %></small>
	              </li>
	            </ul>
	          </div>
	        </div>
	      </div>
	      <%
	    	}
	      %>
	    </div>
  	  </div>
    </div>
    <!-- carousel_2 -->
    <div class="carousel-item" data-bs-interval="false">
      <div class="container px-4 py-5" id="custom-cards">
	    <div class="row row-cols-1 row-cols-lg-3 align-items-stretch g-4 py-5">
	    <%
	    int idx2 = 5;
	    List<CategoryProductDTO> product_list2 = (List<CategoryProductDTO>)request.getAttribute("bestprod"); 
		 if(product_list2.size()<5){
			idx2 = product_list2.size();
		} 
	    for ( int i = 3 ; i <= idx2 ; i++ ) {
		    int p_id2 = product_list2.get(i).getP_id();
		    String p_name2 =product_list2.get(i).getP_name();
			String p_content2 =product_list2.get(i).getP_content();
			int c_id2 =product_list2.get(i).getC_id();
			int p_cost_price2 =product_list2.get(i).getP_cost_price();
			int p_selling_price2 =product_list2.get(i).getP_selling_price();
			int p_discount2 =product_list2.get(i).getP_discount();
			String p_created2 =product_list2.get(i).getP_created();
			int p_stock2 =product_list2.get(i).getP_stock();
			String userid2 =product_list2.get(i).getUserid();
			String p_image2 = product_list2.get(i).getP_image();
	    %>
	   	<div class="col retrieve" onclick="javascrip:location.href='ProductRetrieveServlet?p_id=<%=p_id2%>';">
	        <div class="card card-cover h-100 overflow-hidden text-bg-dark rounded-4 shadow-lg "
	        	style="background-image: url('images/p_image/<%=p_image2%>'); background-size:cover;">
	          <div class="d-flex flex-column h-100 p-5 pb-3 text-white fw-bold text-shadow-1">
	            <h2 class="pt-5 mt-5 mb-4 display-6 lh-1 fw-bold text-shadow-1"><%= p_content2 %></h2>
	            <ul class="d-flex list-unstyled mt-auto">
	              <li class="me-auto">
	              </li>
	              <li class="d-flex align-items-center me-3">
	                <svg class="bi me-2" width="1em" height="1em"><use xlink:href="#geo-fill"></use></svg>
	                <small><%= p_name2 %></small>
	              </li>
	              <li class="d-flex align-items-center">
	                <svg class="bi me-2" width="1em" height="1em"><use xlink:href="#calendar3"></use></svg>
	                <small><%= p_selling_price2 %></small>
	              </li>
	            </ul>
	          </div>
	        </div>
	      </div>
       <%
    	 }
       %>
	    </div>
  	  </div>
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval2" data-bs-slide="prev">
    <span class="carousel-control-prev-icon"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval2" data-bs-slide="next">
    <span class="carousel-control-next-icon"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
</div>


<!-- middle banner -->
<img src="images/main/banner_middle.png" class="d-block w-100" alt="중간배너">


<!-- 뉴챌린지 -->
<div class="container" style="margin-top: 60px;">
	<ul class="nav justify-content-center" style="margin-bottom: 20px;">
	  <li class="nav-item">
	    <b style="font-size: xx-large; color: green;">NEW CHALLENGE</b>
	  </li>
	</ul>

	<div class="row" style="float: none; margin:100 auto;">
	<%
		int idx3 = 8;
		List<ChallengeDTO> callenge_list = (List<ChallengeDTO>)request.getAttribute("newchall");
		if(callenge_list.size()<8){
			idx3 = callenge_list.size();
		}
			for(int i=0; i<idx3; i++){
				ChallengeDTO dto = callenge_list.get(i);
				int chall_id = dto.getChall_id();
				String chall_img = dto.getChall_img();
				System.out.println(chall_id);
	%>
		<div class="col-lg-3 col-md-6" style="margin-bottom: 5px;">
			<a href="ChallengeDetailServlet?chall_id=<%=chall_id%>">
				<img src="/eclipse/upload/<%=chall_img%>" width="250" height="250" class=" mx-auto d-block" alt="챌린지" onerror="this.src='images/uploadarea.png'">
			</a>
		</div>
	<%
		}
	%>
	</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</body>
</html>