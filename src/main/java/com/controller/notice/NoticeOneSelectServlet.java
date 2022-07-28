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
 * Servlet implementation class NoticeUpdateServlet
 */
@WebServlet("/NoticeOneSelectServlet")
public class NoticeOneSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public NoticeOneSelectServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String noticeID = request.getParameter("NOTICE_ID");
		System.out.println(noticeID);
		
		NoticeService service = new NoticeService();
		NoticeDTO nDTO = service.noticeOneSelect(noticeID);
		System.out.println("NoticeOneSelectServlet" + nDTO);
		
		HttpSession session = request.getSession();
		session.setAttribute("noticeOne", nDTO);
		
		response.sendRedirect("noticeDetail.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
