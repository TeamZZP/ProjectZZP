<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<div class="container">
  <footer class="py-3 my-4" >
    <ul class="nav justify-content-center border-bottom pb-3 mb-3">
      <li class="nav-item"><a href="main.jsp" class="nav-link px-2 text-muted">홈</a></li>
      <li class="nav-item"><a href="javascript:termsOfUse();" class="nav-link px-2 text-muted">이용약관</a></li>
      <li class="nav-item"><a href="javascript:personalInfo();" class="nav-link px-2 text-muted">개인정보처리방침</a></li>
    </ul>
    <p class="text-center text-muted">© 2022 ZZP Company, Inc</p>
  </footer>
</div>
</html>