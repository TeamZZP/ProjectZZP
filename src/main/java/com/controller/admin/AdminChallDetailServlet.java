package com.controller.admin;

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
 * Servlet implementation class AdminChallDetailServlet
 */
@WebServlet("/AdminChallDetailServlet")
public class AdminChallDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminChallDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String chall_id = request.getParameter("chall_id");
		
		ChallengeService service = new ChallengeService();
		
		ChallengeDTO challDTO = service.selectOneChallenge(chall_id);
		
		request.setAttribute("challDTO", challDTO);
		
		RequestDispatcher dis = request.getRequestDispatcher("admin/adminChallengeDetail.jsp");
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
