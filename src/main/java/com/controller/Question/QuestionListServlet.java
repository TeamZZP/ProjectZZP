package com.controller.Question;

import java.io.IOException;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.NoticeDTO;
import com.dto.PageDTO;
import com.dto.ProductDTO;
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
		PageDTO pDTO = new PageDTO();
		String curPage = request.getParameter("curPage"); //현재 페이지
		if (curPage == null) { //선택된 페이지가 없으면 null -> 1페이지 출력
			curPage = "1";
		}
		QuestionService service = new QuestionService(); 
		pDTO = service.page(Integer.parseInt(curPage));
		System.out.println("pDTO " + pDTO);//나머지
		
		HttpSession session = request.getSession(); 
		session.setAttribute("pDTO", pDTO);
		
		response.sendRedirect("question.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
