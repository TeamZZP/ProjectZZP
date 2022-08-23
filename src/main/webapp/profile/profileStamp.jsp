<%@page import="java.util.Set"%>
<%@page import="java.util.LinkedHashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//회원의 도장 목록 가져오기
	LinkedHashMap<String, String> stampImgMap = (LinkedHashMap<String, String>) request.getAttribute("stampImgMap");
%>

<style>
     .hover-zoomin a {
      display: block;
      position: relative;
      overflow: hidden;
      border-radius: 15px;
    }
    .hover-zoomin img {
      width: 100%;
      height: auto;
      -webkit-transition: all 0.2s ease-in-out;
      -moz-transition: all 0.2s ease-in-out;
      -o-transition: all 0.2s ease-in-out;
      -ms-transition: all 0.2s ease-in-out;
      transition: all 0.2s ease-in-out;
    }
    .hover-zoomin:hover img {
      -webkit-transform: scale(1.05);
      -moz-transform: scale(1.05);
      -o-transform: scale(1.05);
      -ms-transform: scale(1.05);
      transform: scale(1.05);
    } 
</style>


<div class="row">

<%

		Set<String> keySet = stampImgMap.keySet();
		System.out.println(keySet);
		for (String key : keySet) {
			String stamp_img = stampImgMap.get(key);
	%>
					
     <div class="col-lg-4 col-sm-6">
       <div class="hover-zoomin">
			<img src="/eclipse/upload/<%=stamp_img%>" border="0" onerror="this.src='images/uploadarea.png'">
	   </div>
     </div>
	<%
	 	} //end for
	%>
	
</div>
