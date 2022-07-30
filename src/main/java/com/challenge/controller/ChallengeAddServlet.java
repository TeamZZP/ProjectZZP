package com.challenge.controller;

import java.io.IOException;
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
 * Servlet implementation class ChallengeAddServlet
 */
@WebServlet("/ChallengeAddServlet")
public class ChallengeAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChallengeAddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		//회원전용처리
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO) session.getAttribute("login"); 
		String userid = request.getParameter("userid");
		
		if (member!=null && member.getUserid().equals(userid)) {
			String chall_category = request.getParameter("chall_category");
			String chall_title = request.getParameter("chall_title");
			String chall_img = request.getParameter("chall_img");
			String chall_content = request.getParameter("chall_content");
			
			ChallengeDTO dto = new ChallengeDTO();
			dto.setUserid(userid);
			dto.setChall_category(chall_category);
			dto.setChall_title(chall_title);
			dto.setChall_img(chall_img);
			dto.setChall_content(chall_content);
			
			ChallengeService service = new ChallengeService();
			int n = service.insertChallenge(dto);
			System.out.println(n+"개의 레코드 추가");
			System.out.println(dto.getChall_id());
			
			//자기가 올린 게시글로 이동??? 
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
