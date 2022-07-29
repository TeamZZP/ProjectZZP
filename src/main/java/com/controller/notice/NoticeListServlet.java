package com.controller.notice;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.NoticeDTO;
import com.service.NoticeService;

/**
 * Servlet implementation class communityController
 */
@WebServlet("/NoticeListServlet")
public class NoticeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public NoticeListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NoticeService service = new NoticeService();
		List<NoticeDTO> mainNoticeList = service.pointNotice();
		System.out.println("mainNoticeList " + mainNoticeList); //고정공지
		
		List<NoticeDTO> noticeList = service.noticeList();
		System.out.println("noticeList " + noticeList); //나머지
		
		HttpSession session = request.getSession();
		session.setAttribute("mainNoticeList", mainNoticeList);
		session.setAttribute("noticeList", noticeList);
		
		response.sendRedirect("notice.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
