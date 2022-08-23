package com.controller.challenge;

import java.io.IOException;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.ChallengeDTO;
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
		
		//회원의 챌린지 목록 가져오기
		List<ChallengeDTO> challengeList = service.selectChallengeByUserid(userid);
		
		//회원의 도장 목록 가져오기
		List<String> stampList = service.selectMemberStampByUserid(userid);
		//이미지와 함께 hashmap에 담기 (중복 stamp_id 제거 위해 LinkedHashMap 사용)
		LinkedHashMap<String, String> stampImgMap = new LinkedHashMap<String, String>();
		for (String stampId : stampList) {
			stampImgMap.put(stampId, service.selectStampImg(stampId));
		}
		
		request.setAttribute("profileMap", profileMap);
		request.setAttribute("challengeList", challengeList);
		request.setAttribute("stampImgMap", stampImgMap);
		
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
