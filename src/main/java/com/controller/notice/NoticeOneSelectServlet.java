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
import org.apache.tomcat.util.buf.StringCache;

import com.dto.NoticeDTO;
import com.dto.PageDTO;
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
		NoticeDTO nDTO = service.noticeOneSelect(Integer.parseInt(noticeID));
		System.out.println("nDTO " + nDTO);//상세정보 내용
		
		HttpSession session = request.getSession();
		
		if (nDTO != null) {
			String category = nDTO.getNOTICE_CATEGORY();
			System.out.println("카테고리 " + category);
			
			Map<String, String> map = new HashMap<String, String>();
			map.put("noticeID", noticeID);
			map.put("category", category);
			
			
			int nextID = 0;
			try {
				nextID = service.nextNoticeID(map);
			} catch (Exception e) {
				e.printStackTrace();
			}
			if (nextID != 0) {
				System.out.println("nextID" + nextID); //다음 게시물 번호
				NoticeDTO nextDTO = service.noticeOneSelect(nextID);
				System.out.println("nextDTO " + nextDTO); //다음 게시물
				
				session.setAttribute("nextDTO", nextDTO);  //다음 게시물
			} else {
				NoticeDTO nextDTO = null;
				session.setAttribute("nextDTO", nextDTO);
			}
		
			session.setAttribute("noticeOne", nDTO);//상세정보 내용
			
			Map<String, Integer> map2 = new HashMap<String, Integer>();
			map2.put("noticeID", nDTO.getNOTICE_ID());
			map2.put("noticeHite", nDTO.getNOTICE_HITS()+1);
			
			int hiteUpdateNum = service.noticeHite(map2);
			System.out.println("hiteUpdateNum " + hiteUpdateNum); //조회수
			
			response.sendRedirect("noticeDetail.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
