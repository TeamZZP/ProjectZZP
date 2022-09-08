package com.controller.notice;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.MemberDTO;
import com.dto.NoticeDTO;
import com.service.NoticeService;

@WebServlet("/NoticeInsertServlet")
public class NoticeInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public NoticeInsertServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		MemberDTO mDTO = (MemberDTO) session.getAttribute("login");
		int admin = mDTO.getRole();
		if (admin == 1) {
			String USERID = mDTO.getUserid();
			String NOTICE_TITTLE = request.getParameter("nTittle");
			String NOTICE_CONTENT = request.getParameter("nContent");
			String NOTICE_CATEGORY = request.getParameter("nCategory");
			
			NoticeDTO nDTO = new NoticeDTO();
			nDTO.setUserid(USERID);
			nDTO.setNotice_tittle(NOTICE_TITTLE);
			nDTO.setNotice_content(NOTICE_CONTENT);
			nDTO.setNotice_category(NOTICE_CATEGORY);
			System.out.println("insert할 내용 " + nDTO);
			
			
			NoticeService service = new NoticeService();
			int num = service.NoticeInsert(nDTO);
			System.out.println(num);
			
			if (num == 1) {
				session.setAttribute("mesg", "공지사항이 등록되었습니다.");
				response.sendRedirect("NoticeListServlet");
			} else {
				session.setAttribute("mesg", "공지사항이 등록 실패.");
				response.sendRedirect("NoticeListServlet");
			}
			
		} else {
			session.setAttribute("mesg", "권한이 없습니다");
			response.sendRedirect("NoticeListServlet");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
