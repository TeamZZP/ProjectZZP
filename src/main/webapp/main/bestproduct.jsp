<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <link rel="stylesheet"  href="../src/css/lightslider.css"/>              
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="js/lightslider.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    $("#lightSlider").lightSlider({
        item: 3,
        autoWidth: false,
        slideMove: 1, // slidemove will be 1 if loop is true
        slideMargin: 10,
 
        addClass: '',
        mode: "slide",
        useCSS: true,
        cssEasing: 'ease', //'cubic-bezier(0.25, 0, 0.25, 1)',//
        easing: 'linear', //'for jquery animation',////
 
        speed: 400, //ms'
        auto: false,
        loop: false,
        slideEndAnimation: true,
        pause: 2000,
 
        keyPress: false,
        controls: true,
        prevHtml: '',
        nextHtml: '',
 
        rtl:false,
        adaptiveHeight:false,
 
        vertical:false,
        verticalHeight:500,
        vThumbWidth:100,
 
        thumbItem:10,
        pager: true,
        gallery: false,
        galleryMargin: 5,
        thumbMargin: 5,
        currentPagerPosition: 'middle',
 
        enableTouch:true,
        enableDrag:true,
        freeMove:true,
        swipeThreshold: 40,
 
        responsive : [],
 
        onBeforeStart: function (el) {},
        onSliderLoad: function (el) {},
        onBeforeSlide: function (el) {},
        onAfterSlide: function (el) {},
        onBeforeNextSlide: function (el) {},
        onBeforePrevSlide: function (el) {}
        
        var slider = $("#lightSlider").lightSlider();
        slider.goToSlide(3);
        slider.goToPrevSlide();
        slider.goToNextSlide();
        slider.getCurrentSlideCount();
        slider.refresh();
        slider.play(); 
        slider.pause(); 
    });
});
</script>

<ul id="lightSlider">
  <li>
      <h3>First Slide</h3>
      <p>Lorem ipsum Cupidatat quis pariatur anim.</p>
  </li>
  <li>
      <h3>Second Slide</h3>
      <p>Lorem ipsum Excepteur amet adipisicing fugiat velit nisi.</p>
  </li>
</ul>