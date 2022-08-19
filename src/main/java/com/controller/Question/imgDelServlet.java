package com.controller.Question;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.QuestionDTO;
import com.service.QuestionService;

@WebServlet("/imgDelServlet")
public class imgDelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public imgDelServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String img = request.getParameter("img");
		System.out.println(img);
		
		QuestionService service = new QuestionService();
		int num = service.ImgUpdate(img);
		System.out.println("삭제된 이미지 갯수" + num);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
