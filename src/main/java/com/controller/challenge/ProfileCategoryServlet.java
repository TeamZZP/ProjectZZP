package com.controller.challenge;

import java.io.IOException;
import java.util.ArrayList;
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
			
			//회원의 도장 목록 가져오기
			List<String> stampList = service.selectMemberStampByUserid(userid);
			//이미지와 함께 hashmap에 담기 (중복 stamp_id 제거 위해 LinkedHashMap 사용)
			LinkedHashMap<String, String> stampImgMap = new LinkedHashMap<String, String>();
			for (String stampId : stampList) {
				stampImgMap.put(stampId, service.selectStampImg(stampId));
			}
			
			request.setAttribute("userid", userid);
			request.setAttribute("challengeList", challengeList);
			request.setAttribute("stampImgMap", stampImgMap);
			RequestDispatcher dis = request.getRequestDispatcher("profile/profileAll.jsp");
			dis.forward(request, response);
			
		} else if (category.equals("challenge")) {
			//회원의 챌린지 목록 가져오기
			List<ChallengeDTO> challengeList = service.selectChallengeByUserid(userid);
			//각 게시글마다 도장 가져오기
			HashMap<String, String> stampListMap = new HashMap<String, String>();
			for (ChallengeDTO c : challengeList) {
				HashMap<String, String> stampMap = service.selectMemberStamp(c.getChall_id());
				if (stampMap != null) {
					stampListMap.put(String.valueOf(stampMap.get("CHALL_ID")), stampMap.get("STAMP_IMG"));
				}
			}
			//회원의 프로필 이미지 가져오기
			String profile_img = service.selectProfileImg(userid);
			
			request.setAttribute("profile_img", profile_img);
			request.setAttribute("stampListMap", stampListMap);
			request.setAttribute("challengeList", challengeList);
			RequestDispatcher dis = request.getRequestDispatcher("profile/profileChallenge.jsp");
			dis.forward(request, response);
			
		} else if (category.equals("stamp")) {
			//회원의 도장 목록 가져오기
			List<String> stampList = service.selectMemberStampByUserid(userid);
			//이미지와 함께 hashmap에 담기 (중복 stamp_id 제거 위해 LinkedHashMap 사용)
			LinkedHashMap<String, String> stampImgMap = new LinkedHashMap<String, String>();
			for (String stampId : stampList) {
				stampImgMap.put(stampId, service.selectStampImg(stampId));
			}
			
			request.setAttribute("stampImgMap", stampImgMap);
			RequestDispatcher dis = request.getRequestDispatcher("profile/profileStamp.jsp");
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
