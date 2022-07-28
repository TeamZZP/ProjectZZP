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
import com.dto.PageDTO;
import com.service.ChallengeService;

/**
 * Servlet implementation class ChallengeListServlet
 */
@WebServlet("/ChallengeListServlet")
public class ChallengeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChallengeListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ChallengeService service = new ChallengeService();
		
		//페이징 처리
		String curPage = request.getParameter("curPage"); //현재페이지
		if (curPage == null) curPage = "1"; //시작시 현재페이지 1
		
		PageDTO pDTO = service.selectAllChallenge(Integer.parseInt(curPage));
		request.setAttribute("pDTO", pDTO);
		
		RequestDispatcher dis = request.getRequestDispatcher("challengeMain.jsp");
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
