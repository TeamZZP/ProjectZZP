package com.controller.notice;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.startup.PasswdUserDatabase;

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
		int noticeID = Integer.parseInt(request.getParameter("NOTICE_ID"));
		System.out.println(noticeID);
		
		NoticeService service = new NoticeService();
		NoticeDTO nDTO = service.noticeOneSelect(noticeID);
		System.out.println("NoticeOneSelectServlet" + nDTO);
		
		HttpSession session = request.getSession();
		
		if (nDTO != null) {
			session.setAttribute("noticeOne", nDTO);//상세정보 내용
			
			int nextID = noticeID + 1;
			NoticeDTO nextDTO = service.noticeOneSelect(nextID);
			System.out.println("nextDTO" + nextDTO); //다음 게시물
			
			session.setAttribute("nextDTO", nextDTO);
			
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("noticeID", nDTO.getNOTICE_ID());
			map.put("noticeHite", nDTO.getNOTICE_HITS()+1);
			
			int hiteUpdateNum = service.noticeHite(map);
			System.out.println("hiteUpdateNum " + hiteUpdateNum); //조회수
			
			response.sendRedirect("noticeDetail.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
