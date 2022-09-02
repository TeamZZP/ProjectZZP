package com.controller.challenge;

import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.MemberDTO;
import com.service.ChallengeService;

/**
 * Servlet implementation class ReportUpdateServlet
 */
@WebServlet("/ReportUpdateServlet")
public class ReportUpdateServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//관리자전용처리
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO) session.getAttribute("login");
				
		if (member!=null && "admin1".equals(member.getUserid())) {
			String statusChange = request.getParameter("statusChange");
			String statusChangeId = request.getParameter("statusChangeId");
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("report_status", statusChange);
			map.put("report_id", statusChangeId);
			System.out.println(map);
					
			ChallengeService service = new ChallengeService();
					
			//신고 상태 변경
			int n = service.updateReport(map);
			System.out.println(n+"개의 신고 레코드 상태 변경");

			String curPage = request.getParameter("curPage");
			String searchName = request.getParameter("searchName");
			String searchValue = request.getParameter("searchValue");
			String sortBy = request.getParameter("sortBy");
			String status = request.getParameter("status");
					
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
