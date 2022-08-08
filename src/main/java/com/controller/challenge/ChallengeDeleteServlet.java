package com.controller.challenge;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.MemberDTO;
import com.service.ChallengeService;

/**
 * Servlet implementation class ChallengeDeleteServlet
 */
@WebServlet("/ChallengeDeleteServlet")
public class ChallengeDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChallengeDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userid = request.getParameter("userid");
		
		//회원전용처리
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO) session.getAttribute("login");
		
		if (member!=null && member.getUserid().equals(userid)) {
			String chall_id = request.getParameter("chall_id");
			ChallengeService service = new ChallengeService();
			int n = service.deleteChallenge(chall_id);
			System.out.println(n+"개의 레코드 삭제");
			
			response.sendRedirect("ChallengeListServlet");
			
		} else {
			session.setAttribute("mesg", "잘못된 접근입니다.");
			response.sendRedirect("ChallengeListServlet");
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
