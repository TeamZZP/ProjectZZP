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
    <div class="carousel-item active" data-bs-interval="3000" onclick="javascrip:location.href='IntroductionUIServlet';">
      <img src="images/main/banner_zzp.png" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item" data-bs-interval="3000" onclick="javascrip:location.href='ProductListServlet?p_category=timeEvent';">
      <img src="images/main/banner_time.png" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item" data-bs-interval="3000" onclick="javascrip:location.href='ChallengeDetailServlet?chall_id=1';">
      <img src="images/main/banner_monthchall.png" class="d-block w-100" alt="...">
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
<div id="carouselExampleInterval2" class="carousel slide" style="margin-top: -130px;">
  <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="true">
  <div class="carousel-inner">
    <div class="carousel-item active" data-bs-interval="false">
      <div class="container px-4 py-5" id="custom-cards">
      <!-- <span>BEST PRODUCT</span> -->
    <div class="row row-cols-1 row-cols-lg-3 align-items-stretch g-4 py-5">
    <!-- 1 -->
      <div class="col" onclick="javascrip:location.href='test.jsp';">
        <div class="card card-cover h-100 overflow-hidden text-bg-dark rounded-4 shadow-lg" style="background-image: url('https://image.shutterstock.com/image-photo/upcycled-glass-jar-silicon-straws-260nw-2145836275.jpg');">
          <div class="d-flex flex-column h-100 p-5 pb-3 text-white text-shadow-1">
            <h2 class="pt-5 mt-5 mb-4 display-6 lh-1 fw-bold">Short title, long jacket</h2>
            <ul class="d-flex list-unstyled mt-auto">
              <li class="me-auto">
                <img src="images/header/main.png" alt="Bootstrap" width="32" height="32" class="rounded-circle border border-white">
              </li>
              <li class="d-flex align-items-center me-3">
                <svg class="bi me-2" width="1em" height="1em"><use xlink:href="#geo-fill"></use></svg>
                <small>친환경 빨대</small>
              </li>
              <li class="d-flex align-items-center">
                <svg class="bi me-2" width="1em" height="1em"><use xlink:href="#calendar3"></use></svg>
                <small>$10</small>
              </li>
            </ul>
          </div>
        </div>
      </div>
      <!-- 2 -->
      <div class="col" onclick="javascrip:location.href='test2.jsp';">
        <div class="card card-cover h-100 overflow-hidden text-bg-dark rounded-4 shadow-lg" style="background-image: url('https://image.shutterstock.com/image-photo/zero-waste-sustainable-bathroom-lifestyle-260nw-1671755956.jpg');">
          <div class="d-flex flex-column h-100 p-5 pb-3 text-white text-shadow-1">
            <h2 class="pt-5 mt-5 mb-4 display-6 lh-1 fw-bold">Much longer title that wraps to multiple lines</h2>
            <ul class="d-flex list-unstyled mt-auto">
              <li class="me-auto">
                <img src="images/header/main.png" alt="Bootstrap" width="32" height="32" class="rounded-circle border border-white">
              </li>
              <li class="d-flex align-items-center me-3">
                <svg class="bi me-2" width="1em" height="1em"><use xlink:href="#geo-fill"></use></svg>
                <small>Pakistan</small>
              </li>
              <li class="d-flex align-items-center">
                <svg class="bi me-2" width="1em" height="1em"><use xlink:href="#calendar3"></use></svg>
                <small>4d</small>
              </li>
            </ul>
          </div>
        </div>
      </div>
      <!-- 3 -->
      <div class="col" onclick="javascrip:location.href='test3.jsp';">
        <div class="card card-cover h-100 overflow-hidden text-bg-dark rounded-4 shadow-lg" style="background-image: url('https://image.shutterstock.com/image-photo/set-ecofriendly-plasticfree-body-care-260nw-1513862207.jpg');">
          <div class="d-flex flex-column h-100 p-5 pb-3 text-shadow-1">
            <h2 class="pt-5 mt-5 mb-4 display-6 lh-1 fw-bold">Another longer title belongs here</h2>
            <ul class="d-flex list-unstyled mt-auto">
              <li class="me-auto">
                <img src="images/header/main.png" alt="Bootstrap" width="32" height="32" class="rounded-circle border border-white">
              </li>
              <li class="d-flex align-items-center me-3">
                <svg class="bi me-2" width="1em" height="1em"><use xlink:href="#geo-fill"></use></svg>
                <small>California</small>
              </li>
              <li class="d-flex align-items-center">
                <svg class="bi me-2" width="1em" height="1em"><use xlink:href="#calendar3"></use></svg>
                <small>5d</small>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
    </div>
    <div class="carousel-item" data-bs-interval="false">
      <div class="container px-4 py-5" id="custom-cards">
    <div class="row row-cols-1 row-cols-lg-3 align-items-stretch g-4 py-5">
    <!-- 1 -->
      <div class="col" onclick="javascrip:location.href='test3.jsp';">
        <div class="card card-cover h-100 overflow-hidden text-bg-dark rounded-4 shadow-lg" style="background-image: url('https://image.shutterstock.com/image-photo/father-son-planting-young-tree-260nw-595513394.jpg');">
          <div class="d-flex flex-column h-100 p-5 pb-3 text-white text-shadow-1">
            <h2 class="pt-5 mt-5 mb-4 display-6 lh-1 fw-bold">Short title, long jacket</h2>
            <ul class="d-flex list-unstyled mt-auto">
              <li class="me-auto">
                <img src="https://github.com/twbs.png" alt="Bootstrap" width="32" height="32" class="rounded-circle border border-white">
              </li>
              <li class="d-flex align-items-center me-3">
                <svg class="bi me-2" width="1em" height="1em"><use xlink:href="#geo-fill"></use></svg>
                <small>Earth</small>
              </li>
              <li class="d-flex align-items-center">
                <svg class="bi me-2" width="1em" height="1em"><use xlink:href="#calendar3"></use></svg>
                <small>3d</small>
              </li>
            </ul>
          </div>
        </div>
      </div>
      <!-- 2 -->
      <div class="col" onclick="javascrip:location.href='test3.jsp';">
        <div class="card card-cover h-100 overflow-hidden text-bg-dark rounded-4 shadow-lg" style="background-image: url('https://image.shutterstock.com/image-photo/top-view-trash-bins-assorted-260nw-795715315.jpg');">
          <div class="d-flex flex-column h-100 p-5 pb-3 text-white text-shadow-1">
            <h2 class="pt-5 mt-5 mb-4 display-6 lh-1 fw-bold">Much longer title that wraps to multiple lines</h2>
            <ul class="d-flex list-unstyled mt-auto">
              <li class="me-auto">
                <img src="https://github.com/twbs.png" alt="Bootstrap" width="32" height="32" class="rounded-circle border border-white">
              </li>
              <li class="d-flex align-items-center me-3">
                <svg class="bi me-2" width="1em" height="1em"><use xlink:href="#geo-fill"></use></svg>
                <small>Pakistan</small>
              </li>
              <li class="d-flex align-items-center">
                <svg class="bi me-2" width="1em" height="1em"><use xlink:href="#calendar3"></use></svg>
                <small>4d</small>
              </li>
            </ul>
          </div>
        </div>
      </div>
      <!-- 3 -->
      <div class="col" onclick="javascrip:location.href='test3.jsp';">
        <div class="card card-cover h-100 overflow-hidden text-bg-dark rounded-4 shadow-lg" style="background-image: url('https://image.shutterstock.com/image-photo/asian-young-volunteers-carrying-new-260nw-1491509543.jpg');">
          <div class="d-flex flex-column h-100 p-5 pb-3 text-shadow-1">
            <h2 class="pt-5 mt-5 mb-4 display-6 lh-1 fw-bold">Another longer title belongs here</h2>
            <ul class="d-flex list-unstyled mt-auto">
              <li class="me-auto">
                <img src="https://github.com/twbs.png" alt="Bootstrap" width="32" height="32" class="rounded-circle border border-white">
              </li>
              <li class="d-flex align-items-center me-3">
                <svg class="bi me-2" width="1em" height="1em"><use xlink:href="#geo-fill"></use></svg>
                <small>California</small>
              </li>
              <li class="d-flex align-items-center">
                <svg class="bi me-2" width="1em" height="1em"><use xlink:href="#calendar3"></use></svg>
                <small>5d</small>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval2" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval2" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
</div>


<!-- middle banner -->
<img src="images/main/banner_middle.png" class="d-block w-100" alt="...">


<!-- 뉴챌린지 -->
<div class="container" style="margin-top: 60px;">
	<ul class="nav justify-content-center" style="margin-bottom: 20px;">
	  <li class="nav-item">
	    <b style="font-size: xx-large; color: green;">NEW CHALLENGE</b>
	  </li>
	</ul>

	<div class="row" style="float: none; margin:100 auto;">
	<%
		int idx = 8;
		List<ChallengeDTO> list = (List<ChallengeDTO>)request.getAttribute("newchall");
		if(list.size()<8){
			idx = list.size();
		}
			for(int i=0; i<idx; i++){
				ChallengeDTO dto = list.get(i);
				int chall_id = dto.getChall_id();
				String chall_img = dto.getChall_img();
				System.out.println(chall_id);
	%>
		<div class="col-lg-3 col-md-6" style="margin-bottom: 5px;">
			<a href="ChallengeDetailServlet?chall_id=<%=chall_id%>">
				<img src="/eclipse/upload/<%=chall_img%>" width="250" height="250" class=" mx-auto d-block" alt="...">
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