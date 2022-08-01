<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script type="text/javascript">

$(function() {
	$('.multiple-items').slick({
		  infinite: true,
		  slidesToShow: 3,
		  slidesToScroll: 3
		});
})

</script>
</head>
<body>
<div class="multiple-items">
  <div>your content1</div>
  <div>your content2</div>
  <div>your content3</div>
  <div>your content4</div>
  <div>your content5</div>
  <div>your content6</div>
</div>
</body>
</html>