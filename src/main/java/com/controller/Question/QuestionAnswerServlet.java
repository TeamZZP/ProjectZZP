package com.controller.Question;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.AnswerDTO;
import com.dto.MemberDTO;
import com.service.AnswerService;
import com.service.QuestionService;

@WebServlet("/QuestionAnswerServlet")
public class QuestionAnswerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public QuestionAnswerServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String ANSWER_CONTENT = request.getParameter("answer");
		String Q_ID = request.getParameter("qID");
		System.out.println("답글 insert " + ANSWER_CONTENT + "\t" + Q_ID);
		
		HttpSession session = request.getSession();
		MemberDTO mDTO = (MemberDTO) session.getAttribute("login");
		
		AnswerService service = new AnswerService();
		AnswerDTO selectA = service.selectAnswer(Q_ID);
		System.out.println("게시들에 달린 댓글 여부 확인 " + selectA);
		
		if (selectA != null) { //달린 댓글이 있으면 업데이트
			if (mDTO.getUserid().equals("admin1")) {
				AnswerDTO aDTO = new AnswerDTO();
				aDTO.setAnswer_content(ANSWER_CONTENT);
				aDTO.setQ_id(0);
				
				int num = service.answerUpdate(aDTO);
				System.out.println("답변 수정 갯수 " + num);
				
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.print(ANSWER_CONTENT);
			} else { 
				session.setAttribute("mesg", "권한이 없습니다");
				response.sendRedirect("QuestionListServlet");
			}
			
		} else {//달린 댓글이 없으면 추가
			if (mDTO.getUserid().equals("admin1")) {
				AnswerDTO aDTO = new AnswerDTO();
				aDTO.setAnswer_content(ANSWER_CONTENT);
				aDTO.setQ_id(Integer.parseInt(Q_ID));
				
				int num = service.answerInsert(aDTO);
				System.out.println("답변갯수 " + num);
				
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.print(ANSWER_CONTENT);
				
			} else { 
				session.setAttribute("mesg", "권한이 없습니다");
				response.sendRedirect("QuestionListServlet");
			}
		}
		int num = service.questionStatus(Q_ID);
		System.out.println("답변 상태 변경 갯수 " + num);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
