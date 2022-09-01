<%@page import="java.util.List"%>
<%@page import="com.dto.PageDTO"%>
<%@page import="com.dto.StampDTO"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.LinkedHashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//회원의 도장 목록 가져오기
	PageDTO pDTO = (PageDTO) request.getAttribute("pDTO");
	List<StampDTO> list = pDTO.getList();
	//페이징
	int perPage = pDTO.getPerPage(); 
	int totalCount = pDTO.getTotalCount();
	int totalPage = totalCount/perPage;
	if (totalCount%perPage!=0) totalPage++;
	int curPage = pDTO.getCurPage();
	
	String userid = null;
	if(list.size()>0) {
		userid = list.get(0).getUserid();
	}
%>

<style>
     .hover-zoomin a, .img {
      display: block;
      position: relative;
      overflow: hidden;
      border-radius: 15px;
    }
    .hover-zoomin img, .img {
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
    .img {
    	border-radius: 300px;
    	width: 80%;
    }
</style>

<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function () {
		
		//무한 스크롤
		$('.skeleton').hide();
		let curPage = 1;
		let isLoading = false;
		
		function infiniteScroll() {
			let stamp = document.querySelector('.oneStamp:nth-last-child(2)')
			console.log(stamp)
			
			//인터섹션 옵저버 생성
			const io = new IntersectionObserver((entry, observer)=>{
				
				const ioTarget = entry[0].target //현재 보이는 타겟
				if (entry[0].isIntersecting) { //viewport에 타켓이 보일 때
					console.log('현재 보이는 타겟', ioTarget)
					io.unobserve(stamp) //현재 보이는 타겟 감시 취소
					
					//현재 페이지가 전체 페이지와 같거나 로딩 중인 경우 아래 실행 X
					if (curPage == '<%=totalPage%>' || isLoading) { return; }
				
					isLoading = true //로딩중 true
					$('.skeleton').show() //로딩 이미지 띄우기
					curPage++ //요청할 페이지 증가
					getList(curPage) //추가 페이지 요청 함수
					
					stamp = document.querySelector('.oneStamp:nth-last-child(2)') 
					io.observe(stamp) //새로운 타겟 감시
				}
			}, {
				threshold: 0.8 //viewport에 타겟이 80%이상 보일 때
			})
			
			io.observe(stamp) //타겟 감시
		}
		infiniteScroll() //최초 호출
		
		function getList(curPage) { //추가 페이지 요청 함수
			console.log('inscroll '+curPage)
			$.ajax({
				type:'get',
				url:'ProfileCategoryServlet',
				data: {
					userid:'<%=userid%>',
					category:'scrollstamp',
					curPage:curPage
				},
				dataType:'html',
				success: function (data) {
					$('.stampAll').append(data) //응답받은 데이터 추가
					$('.skeleton').hide() //로딩 이미지 숨기기
					isLoading = false //로딩중 false
					infiniteScroll() //다시 호출
				},
				error: function () {
					alert('문제가 발생했습니다. 다시 시도해 주세요.');
				}
			})
		}
	});
</script>

<div class="row p-2 mx-4 mb-2">
	<div class="col">도장 <span class="text-success fw-bold"><%= totalCount %></span></div>
</div>


<div class="stampAll row ms-3">

<%
		for (StampDTO dto : list) {
			int stamp_id = dto.getStamp_id();
			String stamp_img = dto.getStamp_img();
			String stamp_name = dto.getStamp_name();
			String stamp_content = dto.getStamp_content();
	%>
     <div class="oneStamp col-xl-4 col-md-6">
       <div class="hover-zoomin">
			<img src="/eclipse/upload/<%=stamp_img%>" border="0" onerror="this.src='images/uploadarea.png'"
					 data-bs-toggle="modal" data-bs-target="#stampModal<%=stamp_id%>">
	   </div>
     </div>
     
     <!-- Modal -->
	<div class="modal fade" id="stampModal<%=stamp_id%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel"><%= stamp_name %></h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body text-center">
	      <img src="/eclipse/upload/<%=stamp_img%>" width="400">
	      </div>
	      <div class="modal-footer mb-3 text-center">
	       <%= stamp_content %>
	      </div>
	    </div>
	  </div>
	 </div>

	<%
	 	} //end for
	%>
	
</div>

<div class="row skeleton ms-5">
  <div class="col-xl-4 col-md-6"><img class="img" src="images/none.png"></div>
  <div class="col-xl-4 col-md-6"><img class="img" src="images/none.png"></div>
  <div class="col-xl-4 col-md-6"><img class="img" src="images/none.png"></div>
</div>