package com.controller.challenge;

import java.io.IOException;
import java.io.PrintWriter;
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
			String parent_id = request.getParameter("parent_id");
			
			CommentsDTO dto = new CommentsDTO();
			dto.setChall_id(Integer.parseInt(chall_id));
			dto.setComment_content(comment_content);
			dto.setUserid(userid);
			
			ChallengeService service = new ChallengeService();
			
			//댓글인 경우 해당 게시글의 최대 group_order+1, step=0으로 insert
			if (parent_id == null) {
				
				//댓글 테이블에 레코드 추가
				int n = service.insertComment(dto);
				System.out.println(n+"개의 댓글 레코드 추가");
				
				if (n == 1) {
					//챌린지 테이블에 댓글수 컬럼 증가
					int n2 = service.upChallComments(chall_id);
					System.out.println(n2+"개의 게시글 댓글수 변경");
				}
				
				
			//답글인 경우 부모댓글의 group_order로 insert, 해당 group_order내 MAX(step)+1하여 insert
			} else {
				String group_order = request.getParameter("group_order");
				
				dto.setParent_id(Integer.parseInt(parent_id));
				dto.setGroup_order(Integer.parseInt(group_order));
				
				//댓글 테이블에 레코드 추가
				int n = service.insertReply(dto);
				System.out.println(n+"개의 댓글 레코드 추가");
				
				if (n == 1) {
					//챌린지 테이블에 댓글수 컬럼 증가
					int n2 = service.upChallComments(chall_id);
					System.out.println(n2+"개의 게시글 댓글수 변경");
				}
				
				
			}
			
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
