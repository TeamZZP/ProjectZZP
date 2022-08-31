<%@page import="com.dto.PageDTO"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.dto.ChallengeDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
	//회원의 챌린지 목록 가져오기
	PageDTO pDTO = (PageDTO) request.getAttribute("pDTO");
	//페이징
	int perPage = pDTO.getPerPage(); 
	int totalCount = pDTO.getTotalCount();
	int totalPage = totalCount/perPage;
	if (totalCount%perPage!=0) totalPage++;
	int curPage = pDTO.getCurPage();
	
	List<ChallengeDTO> challengeList = pDTO.getList();
	String userid = null;
	if(challengeList.size()>0) {
		userid = challengeList.get(0).getUserid();
	}
	//회원의 챌린지 개수 가져오기
	int challNum = (Integer) request.getAttribute("challNum");
	//각 게시글마다 도장 가져오기
	HashMap<String, String> stampListMap = (HashMap<String, String>) request.getAttribute("stampListMap");
	//회원의 프로필 이미지 가져오기
	String profile_img = (String) request.getAttribute("profile_img");
	
	
%>

<style>
	/*ZoomIn Hover Effect*/
     .hover-zoomin a, .img {
      display: block;
      position: relative;
      overflow: hidden;
      border-radius: 15px;
    }
    .hover-zoomin img:not(.stamp), .img {
      width: 100%;
      height: auto;
      -webkit-transition: all 0.2s ease-in-out;
      -moz-transition: all 0.2s ease-in-out;
      -o-transition: all 0.2s ease-in-out;
      -ms-transition: all 0.2s ease-in-out;
      transition: all 0.2s ease-in-out;
    }
    .hover-zoomin:hover img:not(.stamp) {
      -webkit-transform: scale(1.1);
      -moz-transform: scale(1.1);
      -o-transform: scale(1.1);
      -ms-transform: scale(1.1);
      transform: scale(1.1);
    } 
    .stamp {
    	position: absolute; 
		left: 62%;
		top: -6%; 
		width: 40%;
    }
    .img {
    	border-radius: 15px;
    }
</style>

<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function () {
		
		//무한 스크롤
		$('.back-drop').hide()
		let curPage = 1
		let isLoading = false
		$(window).on('scroll', function () {
			let scrollTop = $(window).scrollTop() //위로 스크롤된 길이
			let windowHeight = $(window).height() //웹브라우저 창의 높이
			let documentHeight = $(document).height() //문서 전체 높이
			let isBottom = scrollTop + windowHeight + 200 >= documentHeight //바닥까지 스크롤 여부
			
			if (isBottom) {
				if (curPage == '<%=totalPage%>' || isLoading) {
					console.log('끝!')
					return;
				}
				isLoading = true //로딩중 true
				$('.back-drop').show() //로딩 이미지 띄우기
				curPage++ //요청할 페이지 증가
				getList(curPage) //추가 페이지 요청 함수
			}
		})
		function getList(curPage) {
			console.log('inscroll '+curPage)
			$.ajax({
				type:'get',
				url:'ProfileCategoryServlet',
				data: {
					userid:'<%=userid%>',
					category:'scrollchallenge',
					curPage:curPage
				},
				dataType:'html',
				success: function (data) {
					console.log(data)
					$('.challengeAll:last').append(data) //응답받은 데이터 추가
					$('.back-drop').hide() //로딩 이미지 숨기기
					isLoading = false //로딩중 false
				},
				error: function () {
					alert('문제가 발생했습니다. 다시 시도해 주세요.');
				}
			})
			
		}
	});
</script>

<div class="row p-2 mx-4 mb-2">
	<div class="col">챌린지 <span class="text-success fw-bold"><%= challNum %></span></div>
</div>

<div class="challengeAll row ms-3">

<%
		for (int i=1; i<= challengeList.size(); i++) {
			ChallengeDTO dto = challengeList.get(i-1);
			int chall_id = dto.getChall_id();
			String chall_title = dto.getChall_title();
			String chall_content = dto.getChall_content();
			String chall_category = dto.getChall_category();
			int chall_hits = dto.getChall_hits();
			int chall_liked = dto.getChall_liked();
			String chall_created = dto.getChall_created();
			String chall_img = dto.getChall_img();
			int chall_comments = dto.getChall_comments();
	%>
					
     <div class="challengePost col-xl-4 col-md-6">
       <div class="p-3">
	       <a href="ProfileMainServlet?userid=<%=userid%>"><img src="images/<%=profile_img%>" width="30" height="30"></a>&nbsp;&nbsp;
	       <a href="ProfileMainServlet?userid=<%=userid%>"><%=userid%></a><br>
       </div>
       <div class="hover-zoomin">
	       <a href="ChallengeDetailServlet?chall_id=<%=chall_id%>"> 
			<img src="/eclipse/upload/<%=chall_img%>" border="0" onerror="this.src='images/uploadarea.png'">
			<% if (stampListMap.containsKey(String.valueOf(chall_id))) { %>
			<img src="/eclipse/upload/<%=stampListMap.get(String.valueOf(chall_id))%>" class="stamp">
			<%} %>
		   </a>
	   </div>
	   <div class="p-2 text-center">
	       <img src="images/like.png" width="30" height="30"> <%=chall_liked%> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		   <img src="images/bubble.png" width="30" height="25"> <%=chall_comments%>
	   </div>
	   <div class="pb-5 text-center">
	   		<a href="ChallengeDetailServlet?chall_id=<%=chall_id%>"><%=chall_title%></a>
	   </div>
     </div>
	<%
	 	} //end for
	%>
	

</div>

<div class="row back-drop ms-3">
  <div class="col-xl-4 col-md-6"><img class="img" src="images/none.png"></div>
  <div class="col-xl-4 col-md-6"><img class="img" src="images/none.png"></div>
  <div class="col-xl-4 col-md-6"><img class="img" src="images/none.png"></div>
</div>
