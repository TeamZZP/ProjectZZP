package com.controller.challenge;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.ReportDTO;
import com.service.ChallengeService;

/**
 * Servlet implementation class ReportUIServlet
 */
@WebServlet("/ReportUIServlet")
public class ReportUIServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportUIServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String report_id = request.getParameter("report_id");
		ChallengeService service = new ChallengeService();
		
		ReportDTO dto = service.selectOneReport(report_id);
		System.out.println(dto);
		
		String url = null;
		
		//신고된 글이 게시글인 경우 - 해당 게시글로 이동
		if (dto.getChall_id() != 0) {
			url = "ChallengeDetailServlet?chall_id="+dto.getChall_id();
			
		//신고된 글이 댓글인 경우 - 해당 게시글의 해당 댓글 위치로 이동
		} else {
			int chall_id = service.selectChallIdFromComment(dto.getComment_id());
			url = "ChallengeDetailServlet?chall_id="+chall_id+"#commentTime"+dto.getComment_id();
			
		}
		
		response.sendRedirect(url);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
