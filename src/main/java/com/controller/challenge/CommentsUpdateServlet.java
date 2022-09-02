package com.controller.challenge;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
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
 * Servlet implementation class CommentsUpdateServlet
 */
@WebServlet("/CommentsUpdateServlet")
public class CommentsUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentsUpdateServlet() {
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
		String userid = request.getParameter("userid");
		
		if (member != null && member.getUserid().equals(userid)) {
			String chall_id = request.getParameter("chall_id");
			String comment_id = request.getParameter("comment_id");
			String comment_content = request.getParameter("comment_content");
			
			CommentsDTO dto = new CommentsDTO();
			dto.setComment_id(Integer.parseInt(comment_id));
			dto.setComment_content(comment_content);
			
			ChallengeService service = new ChallengeService();
			int n = service.updateComment(dto);
			System.out.println(n+"개의 댓글 레코드 업데이트");
			
			//해당 게시글의 전체 댓글 목록 가져오기
			List<CommentsDTO> commentsList = service.selectAllComments(chall_id);
			
			//해당 게시글의 댓글 작성자들의 프로필 이미지 가져오기
			HashMap<String, String> profileMap = new HashMap<String, String>();
			for (CommentsDTO c : commentsList) {
				profileMap.put(c.getUserid(), service.selectProfileImg(c.getUserid()));
			}
			
			//현재 로그인한 회원의 프로필 이미지 가져오기
			String currProfile_img = service.selectProfileImg(userid);
			if (currProfile_img == null) {
				currProfile_img = "user.png";
			}
			
			request.setAttribute("commentsList", commentsList);
			request.setAttribute("profileMap", profileMap);
			request.setAttribute("currProfile_img", currProfile_img);
			
			RequestDispatcher dis = request.getRequestDispatcher("challenge/comments.jsp");
			dis.forward(request, response);
			
			
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
