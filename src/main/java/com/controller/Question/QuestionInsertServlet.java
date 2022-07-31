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
			String userid = mDTO.getUserid();
			String qTittle = request.getParameter("qTittle");
			String pId = request.getParameter("pId");
			String qContent = request.getParameter("qContent");
			int qboard_category = Integer.parseInt(request.getParameter("qboard_category"));
			String qcategory = request.getParameter("qcategory");
			String qFile = request.getParameter("qFile");
			
			QuestionDTO qDTO = new QuestionDTO();
			qDTO.setUSERID(userid);
			qDTO.setQ_TITLE(qTittle);
			qDTO.setP_ID(pId);
			qDTO.setQ_CONTENT(qContent);
			qDTO.setQ_BOARD_CATEGORY(qboard_category);
			qDTO.setQ_CATEGORY(qcategory);
			qDTO.setQ_IMG(qFile);
			
			System.out.println("qDTO " + qDTO);
			
			QuestionService service = new QuestionService();
			int num = service.questionInsert(qDTO);
			
		} else {
			session.setAttribute("mesg", "로그인이 필요합니다");
			response.sendRedirect("LoginUIServlet");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
