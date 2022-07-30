package com.challenge.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.ChallengeDTO;
import com.dto.MemberDTO;
import com.service.ChallengeService;

/**
 * Servlet implementation class ChallengeUIServlet
 */
@WebServlet("/ChallengeUIServlet")
public class ChallengeUIServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChallengeUIServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userid = request.getParameter("userid");
		String chall_id = request.getParameter("chall_id");
		
		//회원전용처리
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO) session.getAttribute("login");
		
		if (member != null) {
			//회원이고 & 넘어오는 챌린지 글 번호 값이 없는 경우 => 글쓰기 페이지
			if (chall_id == null) {
				RequestDispatcher dis = request.getRequestDispatcher("challengeWrite.jsp");
				dis.forward(request, response);
			
			//회원이고 & 넘어오는 챌린지 글 번호 값이 있고 & 해당 글쓴이인 경우 => 글 수정 페이지
			} else if (chall_id!=null && member.getUserid().equals(userid)) {
				ChallengeService service = new ChallengeService();
				ChallengeDTO dto = service.selectOneChallenge(chall_id);
				
				request.setAttribute("dto", dto);
				
				RequestDispatcher dis = request.getRequestDispatcher("challengeWrite.jsp");
				dis.forward(request, response);
			
			//회원인데 잘못된 접근일 경우
			} else {
				session.setAttribute("mesg", "잘못된 접근입니다.");
				response.sendRedirect("ChallengeListServlet");
			}
			
		//회원이 아닌 경우
		} else {
			session.setAttribute("mesg", "로그인이 필요합니다.");
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
