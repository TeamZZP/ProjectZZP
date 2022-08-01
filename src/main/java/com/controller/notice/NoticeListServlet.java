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
import com.dto.PageDTO;
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
		PageDTO pDTO = new PageDTO();
		PageDTO MainPageDTO = new PageDTO();
		String curPage = request.getParameter("curPage"); //현재 페이지
		if (curPage == null) { //선택된 페이지가 없으면 null -> 1페이지 출력
			curPage = "1";
		}
		String MainCurPage = request.getParameter("MainCurPage"); //현재 페이지
		if (MainCurPage == null) { //선택된 페이지가 없으면 null -> 1페이지 출력
			MainCurPage = "1";
		}
		
		NoticeService service = new NoticeService();
		
		MainPageDTO = service.MainPage(Integer.parseInt(MainCurPage));
		System.out.println("noticePageDTO " + MainPageDTO);//고정공지
		System.out.println(MainPageDTO);
		
		pDTO = service.page(Integer.parseInt(curPage));
		System.out.println("pDTO " + pDTO);//나머지
		
		
		HttpSession session = request.getSession();
		session.setAttribute("noticePageDTO", MainPageDTO);
		session.setAttribute("pDTO", pDTO);
		
		response.sendRedirect("notice.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
