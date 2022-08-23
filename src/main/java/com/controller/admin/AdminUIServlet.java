package com.controller.admin;

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
 * Servlet implementation class AdminUIServlet
 */
@WebServlet("/AdminUIServlet")
public class AdminUIServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminUIServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String operate = request.getParameter("operate");
		
		String chall_id = request.getParameter("chall_id");
		
		//관리자만 접근 가능
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO) session.getAttribute("login");
		
		if (member != null && member.getUserid().equals("admin1")) {
			
			
			//챌린지 작성 페이지
			if (chall_id==null && operate.equals("challengeWrite")) {
				RequestDispatcher dis = request.getRequestDispatcher("adminChallengeWrite.jsp");
				dis.forward(request, response);
			
			//챌린지 수정 페이지
			} else if (chall_id!=null && operate.equals("challengeUpdate")) {
				ChallengeService service = new ChallengeService();
				ChallengeDTO challDTO = service.selectOneChallenge(chall_id);
				
				request.setAttribute("challDTO", challDTO);
				
				RequestDispatcher dis = request.getRequestDispatcher("adminChallengeWrite.jsp");
				dis.forward(request, response);
			} 
			
			
		//관리자가 아닌 경우
		} else {
			session.setAttribute("mesg", "잘못된 접근입니다.");
			response.sendRedirect("main");
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
