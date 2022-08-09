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
 * Servlet implementation class insertQuestionServlet
 */
@WebServlet("/QuestionInsertServlet")
public class QuestionInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public QuestionInsertServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		MemberDTO mDTO = (MemberDTO) session.getAttribute("login");
		
		if (mDTO != null) {
			String USERID = mDTO.getUserid();
			String Q_TITLE = request.getParameter("qTittle");
			String P_ID = request.getParameter("pId");
			String Q_CONTENT = request.getParameter("qContent");
			int Q_BOARD_CATEGORY = Integer.parseInt(request.getParameter("qboard_category"));
			String Q_CATEGORY = request.getParameter("qcategory");
			String Q_IMG = request.getParameter("qFile");
			
			QuestionDTO qDTO = new QuestionDTO();
			qDTO.setUSERID(USERID);
			qDTO.setQ_TITLE(Q_TITLE);
			qDTO.setP_ID(P_ID);
			qDTO.setQ_CONTENT(Q_CONTENT);
			qDTO.setQ_BOARD_CATEGORY(Q_BOARD_CATEGORY);
			qDTO.setQ_CATEGORY(Q_CATEGORY);
			qDTO.setQ_IMG(Q_IMG);
			
			System.out.println("qDTO " + qDTO);
			
			/*
			 * QuestionService service = new QuestionService(); int num =
			 * service.questionInsert(qDTO);
			 * 
			 * if (num == 1) { session.setAttribute("mesg", "게시물이 등록되었습니다");
			 * response.sendRedirect("QuestionListServlet"); } else {
			 * session.setAttribute("mesg", "게시물이 등록 실패");
			 * response.sendRedirect("QuestionListServlet"); }
			 */
			
		} else {
			session.setAttribute("mesg", "로그인이 필요합니다");
			response.sendRedirect("LoginUIServlet");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
