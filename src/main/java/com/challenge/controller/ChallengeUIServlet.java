package com.challenge.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.ChallengeDTO;
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
		String chall_id = request.getParameter("chall_id");
		
		if (chall_id != null) {
			ChallengeService service = new ChallengeService();
			ChallengeDTO dto = service.selectOneChallenge(chall_id);
			
			request.setAttribute("dto", dto);
		}
		
		RequestDispatcher dis = request.getRequestDispatcher("challengeWrite.jsp");
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
