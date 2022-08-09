package com.controller.challenge;

import java.io.IOException;
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

import com.dto.ChallengeDTO;
import com.dto.CommentsDTO;
import com.dto.MemberDTO;
import com.service.ChallengeService;

/**
 * Servlet implementation class ChallengeDetailServlet
 */
@WebServlet("/ChallengeDetailServlet")
public class ChallengeDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChallengeDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String chall_id = request.getParameter("chall_id");
		
		//로그인 정보 가져오기
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO) session.getAttribute("login");
		String userid = "";
		if (member != null) {
			userid = member.getUserid();
		}
		
		ChallengeService service = new ChallengeService();
		
		//조회수 +1 한 후 dto 가져오기
		service.updateChall_hits(chall_id); 
		ChallengeDTO dto = service.selectOneChallenge(chall_id);
		
		//해당 게시글의 댓글 목록 가져오기
		List<CommentsDTO> commentsList = service.selectAllComments(chall_id);
		
		//해당 게시글의 댓글 작성자들의 프로필 이미지 가져오기
		HashMap<String, String> profileMap = new HashMap<String, String>();
		for (CommentsDTO c : commentsList) {
			profileMap.put(c.getUserid(), service.selectProfile_img(c.getUserid()));
		}
		
		//해당 게시글 작성자의 프로필 이미지 가져오기
		String profile_img = service.selectProfile_img(dto.getUserid());
		
		//현재 로그인한 회원의 프로필 이미지 가져오기
		String currProfile_img = service.selectProfile_img(userid);
		
		//현재 로그인한 회원이 해당 게시글에 좋아요를 눌렀는지 판단하기
		HashMap<String, String> likedMap = new HashMap<String, String>();
		likedMap.put("chall_id", chall_id);
		likedMap.put("userid", userid);
		int likedIt = service.countLikedByMap(likedMap);
		
		request.setAttribute("dto", dto);
		request.setAttribute("commentsList", commentsList);
		request.setAttribute("profileMap", profileMap);
		request.setAttribute("profile_img", profile_img);
		request.setAttribute("currProfile_img", currProfile_img);
		request.setAttribute("likedIt", likedIt);
		
		RequestDispatcher dis = request.getRequestDispatcher("challengeDetail.jsp");
		dis.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
