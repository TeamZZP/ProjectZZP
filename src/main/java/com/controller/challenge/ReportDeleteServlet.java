package com.controller.challenge;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.MemberDTO;
import com.service.ChallengeService;

/**
 * Servlet implementation class ReportDeleteServlet
 */
@WebServlet("/ReportDeleteServlet")
public class ReportDeleteServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//관리자전용처리
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO) session.getAttribute("login");
		
		if (member!=null && "admin1".equals(member.getUserid())) {
			String[] report_id = request.getParameterValues("report_id");
			List<String> ids = Arrays.asList(report_id);
			
			ChallengeService service = new ChallengeService();
			
			//신고 테이블에 신고 삭제
			int n = service.deleteReport(ids);
			System.out.println(n+"개의 신고 레코드 삭제");

			String curPage = request.getParameter("curPage");
			String searchName = request.getParameter("searchName");
			String searchValue = request.getParameter("searchValue");
			String sortBy = request.getParameter("sortBy");
			String status = request.getParameter("status");
			String category = request.getParameter("category");
			
			System.out.println(curPage+" "+searchName+" "+searchValue+" "+sortBy+" "+status);
			
			response.sendRedirect("AdminCategoryServlet?curPage="+curPage
					+"&searchName="+searchName+"&searchValue="+searchValue
					+"&sortBy="+sortBy+"&status="+status+"&category=report");
			
		} else {
			session.setAttribute("mesg", "잘못된 접근입니다.");
			response.sendRedirect("main");
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
