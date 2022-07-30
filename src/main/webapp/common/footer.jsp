<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	function termsOfUse() {
		window.open('common/termsOfUse.jsp','new','scrollbars=yes,resizable=no width=300 height=250, left=0,top=0');
	};
	function personalInfo() {
		window.open('common/personalInfo.jsp','new','scrollbars=yes,resizable=no width=300 height=250, left=0,top=0');
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