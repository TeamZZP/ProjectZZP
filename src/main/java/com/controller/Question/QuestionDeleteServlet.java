package com.controller.Question;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.service.QuestionService;

/**
 * Servlet implementation class questionDeleteServlet
 */
@WebServlet("/QuestionDeleteServlet")
public class QuestionDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public QuestionDeleteServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String qID = request.getParameter("Q_ID");
		
		QuestionService service = new QuestionService();
		int num = service.questionDelete(qID);
		System.out.println(num);
		
		HttpSession session = request.getSession();
		if (num == 1) {
			session.setAttribute("mesg", "게시물이 삭제되었습니다");
			response.sendRedirect("QuestionListServlet");
		} else {
			session.setAttribute("mesg", "게시물이 삭제되었습니다");
			response.sendRedirect("QuestionListServlet");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
