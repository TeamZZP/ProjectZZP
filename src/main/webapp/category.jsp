<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<style type="text/css">
li{

display: block;
list-style: none;

}
#category{
float: left;
padding-right: 11%;
}
#clear{
	clear: left;
}
</style>
</head>
<body>
<div id="category">
<ul>
<li><a href ="ProductListServlet?p_category=best" >베스트</a></li> 
<li><a href="ProductListServlet?p_category=monthlyzzp_ocean">이달의 ZZP</a></li> 
<li><a href ="ProductListServlet?p_category=kitchen" >주방용품</a></li> 
<li><a href ="ProductListServlet?p_category=bath" >욕실용품</a></li> 
<li><a href ="ProductListServlet?p_category=life" >생활용품</a></li> 
<li><a href ="ProductListServlet?p_category=office" >사무용품</a></li> 
<li><a href ="ProductListServlet?p_category=woman" >여성용품</a></li> 
<li><a href ="ProductListServlet?p_category=food" >식품</a></li> 
<li><a href="ProductListServlet?p_category=timeEvent">세일</a></li> 
</ul>
</div>
<div id="">
</div>
</body>
</html>