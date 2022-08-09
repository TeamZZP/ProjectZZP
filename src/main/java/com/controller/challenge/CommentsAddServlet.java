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
 * Servlet implementation class CommentsAddServlet
 */
@WebServlet("/CommentsAddServlet")
public class CommentsAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentsAddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		//회원전용처리
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO) session.getAttribute("login");
		
		if (member != null) {
			String chall_id = request.getParameter("chall_id");
			String comment_content = request.getParameter("comment_content");
			String userid = request.getParameter("userid");
			
			CommentsDTO dto = new CommentsDTO();
			dto.setChall_id(Integer.parseInt(chall_id));
			dto.setComment_content(comment_content);
			dto.setUserid(userid);
			
			ChallengeService service = new ChallengeService();
			
			//댓글 테이블에 레코드 추가
			int n = service.insertComment(dto);
			System.out.println(n+"개의 댓글 레코드 추가");
			
			if (n == 1) {
				//챌린지 테이블에 댓글수 컬럼 증가
				int n2 = service.upChall_comments(chall_id);
				System.out.println(n2+"개의 게시글 댓글수 변경");
			}
			
			//해당 게시글의 댓글 목록 가져오기
			List<CommentsDTO> commentsList = service.selectAllComments(chall_id);
			
			//해당 게시글의 댓글 작성자들의 프로필 이미지 가져오기
			HashMap<String, String> profileMap = new HashMap<String, String>();
			for (CommentsDTO c : commentsList) {
				profileMap.put(c.getUserid(), service.selectProfile_img(c.getUserid()));
			}
			
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			String result = "";
			
			for (int i = 0; i < commentsList.size(); i++) {
				CommentsDTO c = commentsList.get(i);
				result += "<div class='d-flex flex-row p-3'>"
						+ "<div style='padding: 10px; padding-right: 20px;'>"
						+ "<a href='ProfileMainServlet?userid="+c.getUserid()+"'>"
						+ "<img src='images/"+profileMap.get(c.getUserid())+"' width='30' height='30' class='rounded-circle mr-3'>"
						+ "</a></div>"
						+ "<div class='w-100'>"
						+ "<div class='d-flex justify-content-between align-items-center'>"
						+ "<div class='d-flex flex-row align-items-center'> "
						+ "<a href='ProfileMainServlet?userid="+c.getUserid()+"'>"
						+ "<span class='mr-2'>"+c.getUserid()+"</span>"
						+ "</a></div> "
						+ "<small>12h ago</small>"
						+ "</div>"
						+ "<p class='text-justify mb-0'>"+c.getComment_content()+"</p>"
						+ "<div class='d-flex flex-row user-feed'> "
						+ "<a class='ml-3'>답글 달기</a> &nbsp;&nbsp;&nbsp;";
				if (c.getUserid()!=null && c.getUserid().equals(userid)) {
					result += "<a class='ml-3 commentDelBtn' data-cid='"+c.getComment_id()+"'>삭제</a>";
				} else {
					result += "<a class='ml-3'>신고</a>";
				}
				result += "</div></div></div>";
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
