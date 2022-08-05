<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="container" style="margin-top: 50px; margin-bottom: -20px;">
  <footer class="d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-top">
    <div class="col-md-12 d-flex align-items-center">
      <span class="mb-3 mb-md-0" style="color: graytext;">대표전화</span>
    </div>
    <div class="col-md-12 d-flex align-items-center">
      <span class="mb-3 mb-md-0" style="font-size: x-large; color: graytext; font-weight: bold;">&#9742 02)1234-5678</span>
    </div>
    <div class="col-md-12 d-flex align-items-center">
      <span class="mb-3 mb-md-0" style="color: graytext; font-weight: bold; font-size: small;">운영시간&nbsp;</span>  
      <span class="mb-3 mb-md-0" style="color: graytext; font-size: small;"> 월-금 9시 - 18시 /&nbsp;</span>
      <span class="mb-3 mb-md-0" style="color: graytext; font-weight: bold; font-size: small;">점심시간&nbsp;</span>
      <span class="mb-3 mb-md-0" style="color: graytext; font-size: small;"> 12시 -13시</span>
    </div>
    <div class="col-md-12 d-flex align-items-center">
      <span class="mb-3 mb-md-0" style="color: graytext; font-size: small;">* 배송 및 고객센터 : 주말, 공휴일 휴무</span>
    </div>
  </footer>
</div>


<div class="container border-top">
  <footer class="py-5" style="margin-bottom: -30px;">
    <div class="row" style="margin-top: -30px;">
      <div class="col-4">
        <a href="MainServlet" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
        <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap">
        <use xlink:href="#bootstrap"></use>
        <img alt="로고" src="images/header/main.png" width="70" height="70">&nbsp;<span id="main" style="font-weight: bold; font-size: x-large;">ZZP</span> 
        </svg>
      </a>
      </div>
      <div class="col-5 text-start">
       	  <div class="col-md-6">
        <h5 style="font-weight: bold; color: green;">지구지키기 프로젝트 ZZP</h5>
        <ul class="nav flex-column">
          <li class="nav-item mb-2"><a href="IntroductionUIServlet" class="nav-link p-0 text-muted">소개</a></li>
          <li class="nav-item mb-2"><a href="StoreUIServlet" class="nav-link p-0 text-muted">스토어</a></li>
          <li class="nav-item mb-2"><a href="ChallengeListServlet" class="nav-link p-0 text-muted">챌린지</a></li>
          <li class="nav-item mb-2"><a href="NoticeListServlet" class="nav-link p-0 text-muted">공지사항</a></li>
          <li class="nav-item mb-2"><a href="QuestionListServlet" class="nav-link p-0 text-muted">문의</a></li>
        </ul>
      </div>
      </div>
      <div class="col-3">
      		<h5><a href="javascript:termsOfUse();" style="text-decoration: none; color: black; font-size: medium;">이용약관</a>
       	  &nbsp;&#124;&nbsp;&nbsp;<a href="javascript:personalInfo();" style="text-decoration: none; color: black; font-size: medium;">개인정보처리방침</a></h5>
       	  	<div class="text-start text-muted">
	       	  	회사명 : (주) 지구지키기 프로젝트<br>
				대표자 : 김에이콘<br>
				주소 : 서울특별시 강남구 역삼로<br>
				이메일 : abcd@efghr.com<br>
				팩스 : 3423-3423-3342<br>
				사업자등록번호 : 123-45-67890<br>
				개인정보보호책임자 : 김에이콘
			</div>
      </div>
    </div><!-- end row -->
      </footer>
</div>

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	function termsOfUse() {
		var popupX = (window.screen.width / 3) - (200 / 2);
		var popupY= (window.screen.height / 3) - (300 / 2);
		window.open("common/termsOfUse.jsp","new",'status=no, height=300, width=600, left='+ popupX + ', top='+ popupY);
	};
	var childWidpersonalInfo;
	function personalInfo() {
		var popupX = (window.screen.width / 3) - (200 / 2);
		var popupY= (window.screen.height / 3) - (300 / 2);
		window.open("common/personalInfo.jsp","new",'status=no, height=300, width=600, left='+ popupX + ', top='+ popupY);
	}
</script>
</html>