package com.controller.Question;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.MemberDTO;
import com.dto.QuestionDTO;
import com.service.QuestionService;

/**
 * Servlet implementation class QuestionOneSelect
 */
@WebServlet("/QuestionOneSelect")
public class QuestionOneSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public QuestionOneSelect() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		
		String qID = request.getParameter("Q_ID");
		String userid = request.getParameter("USERID");
		System.out.println("detailservlet " + qID + userid);

		MemberDTO mDTO = (MemberDTO) session.getAttribute("login");
		if (mDTO != null) {
			String mUserid = mDTO.getUserid();
			
			if (userid.equals(mUserid)) {
				QuestionService service = new QuestionService();
				QuestionDTO dto = service.questionOneSelect(qID);
				System.out.println(dto);
				
				session.setAttribute("questionOneSelect", dto);
				response.sendRedirect("questionDetail.jsp");
			} else {
				session.setAttribute("mesg", "다른 사용자의 글입니다");
				response.sendRedirect("QuestionListServlet");
			}
		} else {
			session.setAttribute("mesg", "권한이 없습니다");
			response.sendRedirect("QuestionListServlet");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
