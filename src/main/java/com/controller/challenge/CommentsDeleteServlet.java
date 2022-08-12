package com.controller.challenge;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.CommentsDTO;
import com.dto.MemberDTO;
import com.service.ChallengeService;

/**
 * Servlet implementation class CommentsDeleteServlet
 */
@WebServlet("/CommentsDeleteServlet")
public class CommentsDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentsDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String chall_id = request.getParameter("chall_id");
		String comment_id = request.getParameter("comment_id");
		String userid = request.getParameter("userid");
		
		//회원전용처리
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO) session.getAttribute("login");
		
		if (member!=null && member.getUserid().equals(userid)) {
			ChallengeService service = new ChallengeService();
			
			//댓글 테이블에 레코드 삭제
			int n = service.deleteComment(comment_id);
			System.out.println(n+"개의 레코드 삭제");
			
			if (n == 1) {
				//해당 댓글을 부모 댓글로 가지고 있는 댓글들 삭제
				int n2 = service.deleteReplies(comment_id);
				System.out.println(n2+"개의 레코드 추가 삭제");
				
				//챌린지 테이블에 댓글수 컬럼 감소
				HashMap<String, String> map = new HashMap<String, String>();
				map.put("chall_id", chall_id);
				map.put("num", String.valueOf(n+n2));
				
				int result = service.downChallComments(map);
				System.out.println(result+"개의 게시글 댓글수 변경");
			}
			
			//해당 게시글의 댓글 목록 가져오기 (답글 미포함)
			List<CommentsDTO> commentsList = service.selectAllComments(chall_id);
			
			//해당 게시글의 댓글 목록 중 답글 가져오기
			HashMap<Integer, List<CommentsDTO>> commentsMap = new HashMap<Integer, List<CommentsDTO>>();
			List<CommentsDTO> replyList = null;
			
			//해당 게시글의 댓글 작성자들의 프로필 이미지 가져오기
			HashMap<String, String> profileMap = new HashMap<String, String>();
			for (CommentsDTO c : commentsList) {
				
				replyList = service.selectAllReplies(c.getComment_id());
				commentsMap.put(c.getComment_id(), replyList);
				
				profileMap.put(c.getUserid(), service.selectProfileImg(c.getUserid()));
				for (CommentsDTO r : replyList) {
					profileMap.put(r.getUserid(), service.selectProfileImg(r.getUserid()));
				}
			}
			
			//현재 로그인한 회원의 프로필 이미지 가져오기
			String currProfile_img = service.selectProfileImg(userid);
			if (currProfile_img == null) {
				currProfile_img = "user.png";
			}
			
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			String result = "";
			
			for (int i = 0; i < commentsList.size(); i++) {
				CommentsDTO c = commentsList.get(i);
				result += "<div class='d-flex flex-row p-3'>"
						+ "<div class='profile'>"
						+ "<a href='ProfileMainServlet?userid="+c.getUserid()+"'>"
						+ "<img src='images/"+profileMap.get(c.getUserid())+"' width='30' height='30' class='rounded-circle mr-3'>"
						+ "</a></div>"
						+ "<div class='w-100'>"
						+ "<div class='d-flex justify-content-between align-items-center'>"
						+ "<div class='d-flex flex-row align-items-center'> "
						+ "<a href='ProfileMainServlet?userid="+c.getUserid()+"'>"
						+ "<span class='mr-2'>"+c.getUserid()+"</span>"
						+ "</a></div> "
						+ "<small id='commentTime"+c.getComment_id()+"'></small>"
						+ "<script>$('#commentTime"+c.getComment_id()+"').html(displayedAt('"+c.getComment_created()+"'));</script>"
						+ "</div>"
						+ "<p class='text-justify mb-0'>"+c.getComment_content()+"</p>"
						+ "<div class='d-flex flex-row user-feed'> "
						+ "<a class='reply ml-3' data-cid='"+c.getComment_id()+"'>답글 달기</a> &nbsp;&nbsp;&nbsp;";
				if (c.getUserid()!=null && c.getUserid().equals(userid)) {
					result += "<a class='ml-3 commentDelBtn' data-cid='"+c.getComment_id()+"'>삭제</a>";
				} else {
					result += "<a class='ml-3'>신고</a>";
				}
				result += "</div></div></div>";
				
				//해당 댓글의 답글 목록
				 List<CommentsDTO> list = commentsMap.get(c.getComment_id());
                 for (CommentsDTO r : list) {
                	 result += "<div class='d-flex flex-row p-3'>"
                			 + "<div style='width: 60px;'></div>"
                			 + "<div class='profile'>"
                			 + "<a href='ProfileMainServlet?userid="+r.getUserid()+"'>"
                			 + "<img src='images/"+profileMap.get(r.getUserid())+"' width='30' height='30' class='rounded-circle mr-3'></a>"
                			 + "</div>"
                			 + "<div class='w-100'>"
                			 + "<div class='d-flex justify-content-between align-items-center'>"
                			 + "<div class='d-flex flex-row align-items-center'>"
                			 + "<a href='ProfileMainServlet?userid="+r.getUserid()+"'>"
                			 + "<span class='mr-2'>"+r.getUserid()+"</span></a>"
                			 + "</div>"
                			 + "<small id='commentTime"+r.getComment_id()+"'></small>"
                			 + "<script>$('#commentTime"+r.getComment_id()+"').html(displayedAt('"+r.getComment_created()+"'));</script>"
                			 + "</div>"
                			 + "<p class='text-justify mb-0'>"+r.getComment_content()+"</p>"
                			 + "<div class='d-flex flex-row user-feed'>"
                			 + "<a class='reply ml-3' data-cid='"+c.getComment_id()+"'>답글 달기</a> &nbsp;&nbsp;&nbsp;"; 
                	 if (r.getUserid()!=null && r.getUserid().equals(userid)) {
                		 result += "<a class='ml-3 commentDelBtn' data-cid='"+r.getComment_id()+"'>삭제</a>";
                	 } else {
                		 result += "<a class='ml-3'>신고</a>";
					 }
                	 result += "</div></div></div>";
                 }
				
				
				//답글 입력창
				result += "<div id='reply"+c.getComment_id()+"' style='display: none;'>"
						+ "<div class='d-flex flex-row p-3'>"
						+ "<div style='width: 60px;'></div>"
						+ "<div class='profile'>"
						+ "<img src='images/"+currProfile_img+"' width='30' height='30' class='rounded-circle mr-3'>"
						+ "</div>"
						+ "<div class='d-flex flex-row align-items-center w-100 text-justify mb-0'>"
						+ "<input type='text' class='form-control' name='comment_content' id='reply_content"+c.getComment_id()+"'>"
						+ "<button class='commentBtn commentReplyBtn' data-cid='"+c.getComment_id()+"'>입력</button>"
						+ "</div></div></div>";
			}
			out.print(result);
			
		} else {
			session.setAttribute("mesg", "잘못된 접근입니다.");
			response.sendRedirect("LoginUIServlet");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
