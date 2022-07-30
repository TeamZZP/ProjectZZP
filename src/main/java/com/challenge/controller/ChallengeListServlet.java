package com.challenge.controller;

import java.io.IOException;
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
	//	String sortBy = request.getParameter("sortBy");
		
		System.out.println(curPage+" "+searchName+" "+searchValue);
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("searchName", searchName);
		map.put("searchValue", searchValue);
		System.out.println(">>>>>>>"+map);
	//	map.put("sortBy", sortBy);
		
		PageDTO pDTO = service.selectAllChallenge(map, Integer.parseInt(curPage));
		
		//각 게시글마다 댓글수 가져오기
		List<ChallengeDTO> list = pDTO.getList();
		HashMap<Integer, Integer> commentsMap = new HashMap<Integer, Integer>();
		for (ChallengeDTO c : list) {
			int commentsNum = service.countComments(c.getChall_id());
			commentsMap.put(c.getChall_id(), commentsNum);
		}
		
		request.setAttribute("pDTO", pDTO);
		request.setAttribute("searchName", searchName);
		request.setAttribute("searchValue", searchValue);
	//	request.setAttribute("sortBy", sortBy);
		request.setAttribute("commentsMap", commentsMap);
		
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
