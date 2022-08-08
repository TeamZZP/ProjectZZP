package com.controller.challenge;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.PageDTO;
import com.service.ChallengeService;

/**
 * Servlet implementation class ProfileMainServlet
 */
@WebServlet("/ProfileMainServlet")
public class ProfileMainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfileMainServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String userid = request.getParameter("userid");
		
		ChallengeService service = new ChallengeService();
		HashMap<String, String> profileMap = service.selectProfile(userid);
		
		HashMap<String, String> challengMap = new HashMap<String, String>();
		challengMap.put("searchName", "userid");
		challengMap.put("searchValue", userid);
		PageDTO pDTO = service.selectAllChallenge(challengMap, 1);
		
		request.setAttribute("profileMap", profileMap);
		request.setAttribute("pDTO", pDTO);
		
		RequestDispatcher dis = request.getRequestDispatcher("profileMain.jsp");
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
