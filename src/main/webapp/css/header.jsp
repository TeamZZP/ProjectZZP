<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
#main {
	color: green;
	font-family: 'Bebas Neue', cursive;
}
</style>
<header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
      <a href="main.jsp" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
        <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap">
        <use xlink:href="#bootstrap"></use>
        <img alt="로고" src="css/main.png" width="50" height="50"><span id="main">ZZP</span> 
        </svg>
      </a>

      <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
        <li><a href="MainIntroduction" class="nav-link px-2 link-secondary">소개</a></li>
        <li><a href="#" class="nav-link px-2 link-dark">스토어</a></li>
        <li><a href="#" class="nav-link px-2 link-dark">챌린지</a></li>
        <li><a href="#" class="nav-link px-2 link-dark">게시판</a></li>
      </ul>

      <div class="col-md-3 text-end">
      	<button type="button" onclick="location.href='LoginUIServlet';"  class="btn btn-success">로그인</button>
      	<button type="button" onclick="location.href='MemberUIServlet';"  class="btn btn-success">회원가입</button>
      	<button type="button" class="btn btn-success">장바구니</button>
      </div>
    </header>