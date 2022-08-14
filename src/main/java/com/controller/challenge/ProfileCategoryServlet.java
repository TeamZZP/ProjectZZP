package com.controller.challenge;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
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
 * Servlet implementation class ProfileCategoryServlet
 */
@WebServlet("/ProfileCategoryServlet")
public class ProfileCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfileCategoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userid = request.getParameter("userid");
		String category = request.getParameter("category");
		System.out.println(userid+" "+category);
		
		ChallengeService service = new ChallengeService();
		
		if (category.equals("all")) {
			//회원의 챌린지 목록 가져오기
			List<ChallengeDTO> challengeList = service.selectChallengeByUserid(userid);
			
			request.setAttribute("userid", userid);
			request.setAttribute("challengeList", challengeList);
			RequestDispatcher dis = request.getRequestDispatcher("profile/profileAll.jsp");
			dis.forward(request, response);
			
		} else if (category.equals("challenge")) {
			//회원의 챌린지 목록 가져오기
			List<ChallengeDTO> challengeList = service.selectChallengeByUserid(userid);
			//회원의 프로필 이미지 가져오기
			String profile_img = service.selectProfileImg(userid);
			
			request.setAttribute("profile_img", profile_img);
			request.setAttribute("challengeList", challengeList);
			RequestDispatcher dis = request.getRequestDispatcher("profile/profileChallenge.jsp");
			dis.forward(request, response);
			
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
