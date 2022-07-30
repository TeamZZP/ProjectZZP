package com.challenge.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.ChallengeDTO;
import com.dto.CommentsDTO;
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
		
		ChallengeService service = new ChallengeService();
		
		//조회수 +1 한 후 dto 가져오기
		service.updateChall_hits(chall_id); 
		ChallengeDTO dto = service.selectOneChallenge(chall_id);
		
		List<CommentsDTO> commentsList = service.selectAllComments(chall_id);
		
		request.setAttribute("dto", dto);
		request.setAttribute("commentsList", commentsList);
		
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
