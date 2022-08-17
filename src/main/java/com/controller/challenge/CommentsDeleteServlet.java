package com.controller.challenge;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
		
		String userid = request.getParameter("userid");
		
		//회원전용처리
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO) session.getAttribute("login");
		
		if (member!=null && member.getUserid().equals(userid)) {
			String chall_id = request.getParameter("chall_id");
			String comment_id = request.getParameter("comment_id");
			
			ChallengeService service = new ChallengeService();
			int n = service.deleteAllComments(comment_id);
			System.out.println(n+"개의 레코드 삭제");
			
			//챌린지 테이블에 댓글수 컬럼 감소
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("chall_id", chall_id);
			map.put("num", String.valueOf(n));
			
			int result = service.downChallComments(map);
			System.out.println(result+"개의 게시글 댓글수 변경");

				
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
