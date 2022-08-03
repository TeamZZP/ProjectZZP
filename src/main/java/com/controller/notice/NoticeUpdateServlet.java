package com.controller.notice;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.NoticeDTO;
import com.service.NoticeService;

/**
 * Servlet implementation class NoticeUpdateServlet
 */
@WebServlet("/NoticeUpdateServlet")
public class NoticeUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public NoticeUpdateServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int NOTICE_ID = Integer.parseInt(request.getParameter("nId"));
		String NOTICE_TITTLE = request.getParameter("nTittle");
		String NOTICE_CONTENT = request.getParameter("nContent");
		System.out.println("NoticeUpdate " + NOTICE_ID + "\t" + NOTICE_TITTLE + "\t" + NOTICE_CONTENT);
		
		NoticeDTO dto = new NoticeDTO();
		dto.setNOTICE_ID(NOTICE_ID);
		dto.setNOTICE_TITTLE(NOTICE_TITTLE);
		dto.setNOTICE_CONTENT(NOTICE_CONTENT);
		
		NoticeService service = new NoticeService();
		int num = service.noticeUpdate(dto);
		System.out.println(num);
		
		HttpSession session = request.getSession();
		if (num == 1) {
			response.sendRedirect("NoticeListServlet");
			session.setAttribute("mesg", "공지 수정 성공");
		} else {
			response.sendRedirect("NoticeListServlet");
			session.setAttribute("mesg", "공지 수정 실패");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
