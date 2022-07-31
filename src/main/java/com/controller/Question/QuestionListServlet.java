package com.controller.Question;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.NoticeDTO;
import com.dto.QuestionDTO;
import com.service.NoticeService;
import com.service.QuestionService;

/**
 * Servlet implementation class InquiryListServlet
 */
@WebServlet("/QuestionListServlet")
public class QuestionListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public QuestionListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		QuestionService service = new QuestionService();
		List<QuestionDTO> list = service.questionList();
		System.out.println("questionList" + list);
		
		HttpSession session = request.getSession();
		session.setAttribute("questionList", list);
		
		response.sendRedirect("question.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
