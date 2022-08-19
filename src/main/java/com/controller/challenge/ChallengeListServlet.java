package com.controller.challenge;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
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
		
		request.setCharacterEncoding("utf-8");
		
		ChallengeService service = new ChallengeService(); 
		
		//페이징 처리
		String curPage = request.getParameter("curPage"); //현재페이지
		if (curPage == null) curPage = "1"; //시작시 현재페이지 1
		
		//검색기준, 검색어
		String searchName = request.getParameter("searchName");
		String searchValue = request.getParameter("searchValue");
		String sortBy = request.getParameter("sortBy");
		if (sortBy == null) {
			sortBy = "chall_id";
		}
		
		System.out.println(curPage+" "+searchName+" "+searchValue+" "+sortBy);
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("searchName", searchName);
		map.put("searchValue", searchValue);
		map.put("sortBy", sortBy);
		System.out.println(">>>>>>>"+map);
		
		PageDTO pDTO = service.selectAllChallenge(map, Integer.parseInt(curPage));
		
		List<ChallengeDTO> list = pDTO.getList();
	
		//각 게시글마다 프로필 가져오기
		HashMap<String, String> profileMap = new HashMap<String, String>();
		for (ChallengeDTO c : list) {
			profileMap.put(c.getUserid(), service.selectProfileImg(c.getUserid()));
		}
		
		//이 달의 챌린지 가져오기
		ChallengeDTO challThisMonth = service.selectChallThisMonth();
		
		request.setAttribute("pDTO", pDTO);
		request.setAttribute("searchName", searchName);
		request.setAttribute("searchValue", searchValue);
		request.setAttribute("sortBy", sortBy);
		request.setAttribute("profileMap", profileMap);
		request.setAttribute("challThisMonth", challThisMonth);
		
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
