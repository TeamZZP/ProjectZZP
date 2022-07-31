package com.controller.Question;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		String qID = request.getParameter("Q_ID");
		System.out.println("qID " + qID);
		
		QuestionService service = new QuestionService();
		QuestionDTO dto = service.questionOneSelect(qID);
		System.out.println(dto);
		
		HttpSession session = request.getSession();
		session.setAttribute("questionOneSelect", dto);
		
		response.sendRedirect("questionDetail.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
