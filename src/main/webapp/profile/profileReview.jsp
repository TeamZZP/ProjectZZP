<%@page import="com.dto.ReviewDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.dto.MemberDTO"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.dto.PageDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//회원의 리뷰 목록 가져오기
	PageDTO pDTO = (PageDTO) request.getAttribute("reviewPageDTO");
	List<ReviewDTO> reviewList = pDTO.getList();
	//페이징
	int perPage = pDTO.getPerPage(); 
	int totalCount = pDTO.getTotalCount();
	int totalPage = totalCount/perPage;
	if (totalCount%perPage!=0) totalPage++;
	int curPage = pDTO.getCurPage();
	
	//리뷰에 해당하는 상품 정보 가져오기
	HashMap<Integer, HashMap<String, String>> prodMap = (HashMap<Integer, HashMap<String, String>>) request.getAttribute("prodMap");
	
	//session에 저장된 userid 읽어오기 
	MemberDTO member = (MemberDTO) session.getAttribute("login"); 
	String userid = null;
	if (member != null) {
		userid = member.getUserid();
	}

%>

<style>
.img {
	width: 100px;
	height: 100px;
}
</style>

<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function () {
		
		//첨부파일 보이기
		$(".uploadBtu").click(function () {
			var popupX = (document.body.offsetWidth / 2) - (200 / 2);
			var popupY= (window.screen.height / 2) - (300 / 2);
			
			var img = $(this).children(img).attr("src");
			console.log(img);
			
			window.open('showImgReview.jsp?img='+img , '', 'status=no, height=500, width=400, left='+ popupX + ', top='+ popupY);
		});
		
		//무한 스크롤
		$('.skeleton').hide();
		let curPage = 1;
		let isLoading = false;
		
		function infiniteScroll() {
			let reviewPost = document.querySelector('.reviewPost:last-child')
			
			//인터섹션 옵저버 생성
			const io = new IntersectionObserver((entry, observer)=>{
				
				const ioTarget = entry[0].target //현재 보이는 타겟
				if (entry[0].isIntersecting) { //viewport에 타켓이 보일 때
					console.log('현재 보이는 타겟', ioTarget)
					io.unobserve(reviewPost) //현재 보이는 타겟 감시 취소
					
					//현재 페이지가 전체 페이지와 같거나 로딩 중인 경우 아래 실행 X
					if (curPage == '<%=totalPage%>' || isLoading) { return; }
				
					isLoading = true //로딩중 true
					$('.skeleton').show() //로딩 이미지 띄우기
					curPage++ //요청할 페이지 증가
					getList(curPage) //추가 페이지 요청 함수
					
					reviewPost = document.querySelector('.reviewPost:last-child') 
					io.observe(reviewPost) //새로운 타겟 감시
				}
			}, {
				threshold: 0.8 //viewport에 타겟이 80%이상 보일 때
			})
			
			io.observe(reviewPost) //타겟 감시
		}
		infiniteScroll() //최초 호출
		
		function getList(curPage) { //추가 페이지 요청 함수
			console.log('inscroll '+curPage)
			$.ajax({
				type:'get',
				url:'ProfileCategoryServlet',
				data: {
					userid:'<%=userid%>',
					category:'scrollreview',
					curPage:curPage
				},
				dataType:'html',
				success: function (data) {
					$('#reviewTable').append(data) //응답받은 데이터 추가
					$('.skeleton').hide() //로딩 이미지 숨기기
					isLoading = false //로딩중 false
					infiniteScroll() //다시 호출
				},
				error: function () {
					alert('문제가 발생했습니다. 다시 시도해 주세요.');
				}
			})
		}//무한 스크롤 end
	});
</script>


<div class="row p-2 mx-4 mb-2">
	<div class="col">구매후기 <span class="text-success fw-bold"><%= totalCount %></span></div>
</div>

<div class="row">
<table id="reviewTable" class="table table-hover table-borderless" style="table-layout: fixed">
	
<% for (int i = 0; i < reviewList.size(); i++) {	
	ReviewDTO dto = reviewList.get(i);
	int review_id = dto.getREVIEW_ID();
	int p_id = dto.getP_ID();
	String review_title = dto.getREVIEW_TITLE();
	String review_content = dto.getREVIEW_CONTENT();
	String review_rate = dto.getREVIEW_RATE();
	String review_img = dto.getREVIEW_IMG();
	String review_created = dto.getREVIEW_CREATED().substring(0,10);;
	
	HashMap<String, String> map = prodMap.get(p_id);
	String p_name = map.get("P_NAME");
	String image_route = map.get("IMAGE_ROUTE");
%>
	<tr class="reviewPost">
		<td style="padding:5 0 0 10px;" width="25%" class="text-center">
			<a href="ProductRetrieveServlet?p_id=<%=p_id%>"> 
			<img src="images/p_image/<%=image_route%>" border="0" align="middle" class="img pb-1"
					onerror="this.src='images/uploadarea.png'"><br>
			<%= p_name %></a>
		</td>
		<td width="35%" class="align-middle">
			  <b><%= review_title %></b><br><br>
			  <%= review_content %><br>
			  <span class="badge rounded-pill bg-secondary mt-1"><%= review_rate %></span>
		</td>
		<td width="25%" style="text-align: center; vertical-align: middle;">
				<%if(dto.getREVIEW_IMG() == null || dto.getREVIEW_IMG().equals("null")){ %>
					
				<%} else { %>
					<div class="uploadBtu">
						<img class="upload" alt="" src="/eclipse/upload/<%=dto.getREVIEW_IMG()%>" width="100px" height="100px" style="border: 1px solid gray;">
					</div>
				<%} %>
		</td>
		<td width="15%" class="align-middle">
			<div><%= review_created %></div>
		</td>
	</tr>
<%
		}
%>
	
	
	
	
</table>

<div class="row skeleton ms-3">
  <div class="col-xl-4 col-md-6 ms-2"><img class="img" src="images/none.png" width="67%"></div>
</div>

</div>