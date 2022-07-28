package com.controller.notice;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.service.NoticeService;

/**
 * Servlet implementation class NoticeDeleteServlet
 */
@WebServlet("/NoticeDeleteServlet")
public class NoticeDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public NoticeDeleteServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String NOTICE_ID = request.getParameter("nId");
		System.out.println("NoticeDeleteServlet " + NOTICE_ID);
		
		NoticeService service = new NoticeService();
		int num = service.NoticeDelete(NOTICE_ID);
		System.out.println("삭제된 갯수" + num);
		
		HttpSession session = request.getSession();
		if (num == 1) {
			session.setAttribute("mesg", "게시물 삭제 성공");
			response.sendRedirect("NoticeListServlet");
		} else {
			session.setAttribute("mesg", "게시물 삭제 실패");
			response.sendRedirect("NoticeListServlet");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
