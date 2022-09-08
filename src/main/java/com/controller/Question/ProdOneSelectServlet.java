package com.controller.Question;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.AnswerDAO;
import com.dto.AnswerDTO;
import com.dto.MemberDTO;
import com.dto.QuestionDTO;
import com.dto.QuestionProductDTO;
import com.service.AnswerService;
import com.service.QuestionService;

@WebServlet("/ProdOneSelectServlet")
public class ProdOneSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ProdOneSelectServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String Q_ID = request.getParameter("qID");
		System.out.println("Q_ID " + Q_ID);
		
		HttpSession session = request.getSession();
		MemberDTO mDTO = (MemberDTO) session.getAttribute("login");
		if (mDTO != null) {
			String userid = mDTO.getUserid();
			
			QuestionService service = new QuestionService();
			QuestionProductDTO qDTO = service.questionOneSelect(Q_ID);
			String writer = qDTO.getUserid();
			
			if (userid.equals(writer)) {
				AnswerService Aservice = new AnswerService();
				AnswerDTO aDTO = Aservice.selectAnswer(Q_ID);
				System.out.println("aDTO " + aDTO);
				
				if (aDTO != null) {
					String Acontent = aDTO.getAnswer_content();
					
					response.setContentType("text/html;charset=utf-8");
					PrintWriter out = response.getWriter();
					out.print(Acontent);
				} else {
					String Acontent = "답변대기";
					
					response.setContentType("text/html;charset=utf-8");
					PrintWriter out = response.getWriter();
					out.print(Acontent);
				}
			} else {
				String Acontent = "다른 사용자의 글 입니다";
				
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.print(Acontent);
			}
		} else {
			String Acontent = "로그인이 필요합니다";
			
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(Acontent);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
