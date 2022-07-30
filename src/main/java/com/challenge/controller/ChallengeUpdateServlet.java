package com.challenge.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.MemberDTO;
import com.service.ChallengeService;

/**
 * Servlet implementation class ChallengeUpdateServlet
 */
@WebServlet("/ChallengeUpdateServlet")
public class ChallengeUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChallengeUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String userid = request.getParameter("userid");
		
		//회원전용처리
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO) session.getAttribute("login");
		
		if (member!=null && member.getUserid().equals(userid)) {
			String chall_id = request.getParameter("chall_id");
			String chall_category = request.getParameter("chall_category");
			String chall_title = request.getParameter("chall_title");
			String chall_img = request.getParameter("chall_img");
			String chall_content = request.getParameter("chall_content");
			
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("chall_id", chall_id);
			map.put("chall_category", chall_category);
			map.put("chall_title", chall_title);
			map.put("chall_img", chall_img);
			map.put("chall_content", chall_content);
			
			ChallengeService service = new ChallengeService();
			int n = service.updateChallenge(map);
			System.out.println(n+"개의 레코드 업데이트");
			
			response.sendRedirect("ChallengeDetailServlet?chall_id="+chall_id);
			
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
