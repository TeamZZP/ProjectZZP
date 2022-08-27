package com.controller.admin;

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
 * Servlet implementation class AdminReportListServlet
 */
@WebServlet("/AdminReportListServlet")
public class AdminReportListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminReportListServlet() {
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
		String status = request.getParameter("status");
		
		System.out.println(curPage+" "+searchName+" "+searchValue+" "+sortBy+" "+status);
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("searchName", searchName);
		map.put("searchValue", searchValue);
		map.put("sortBy", sortBy);
		map.put("status", status);
		System.out.println(">>>>>>>"+map);
		
		PageDTO pDTO = service.selectAllReport(map, Integer.parseInt(curPage));
		System.out.println(pDTO);
		
		request.setAttribute("pDTO", pDTO);
		request.setAttribute("searchName", searchName);
		request.setAttribute("searchValue", searchValue);
		request.setAttribute("sortBy", sortBy);
		request.setAttribute("status", status);
		
		RequestDispatcher dis = request.getRequestDispatcher("adminReport.jsp");
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
