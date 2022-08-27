package com.controller.challenge;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.ReportDTO;
import com.service.ChallengeService;

/**
 * Servlet implementation class ReportAddServlet
 */
@WebServlet("/ReportAddServlet")
public class ReportAddServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String category = request.getParameter("category");
		String chall_id = request.getParameter("chall_id");
		String comment_id = request.getParameter("comment_id");
		String report_reason = request.getParameter("report_reason");
		String userid = request.getParameter("userid");
		
		System.out.println(category+" "+chall_id+" "+comment_id+" "+report_reason+" "+userid);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("category", category);
		if (category.equals("1")) {
			map.put("chall_id", chall_id);
		} else {
			map.put("comment_id", comment_id);
		}
		map.put("report_reason", report_reason);
		map.put("userid", userid);
		
		ChallengeService service = new ChallengeService();
		PrintWriter out = response.getWriter();
		
		//중복 신고 확인
		int count = service.checkReportExist(map);
		
		if (count == 0) {
			int n = service.insertReport(map);
			System.out.println(n+"개의 신고 레코드 추가");
			out.print(true);
		} else {
			out.print(false);
		}
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
