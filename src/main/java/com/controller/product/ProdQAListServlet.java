package com.controller.product;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.AnswerDTO;
import com.dto.ProductDTO;
import com.dto.QuestionDTO;
import com.service.AnswerService;
import com.service.QuestionService;

@WebServlet("/ProdQAListServlet")
public class ProdQAListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ProdQAListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		ProductDTO pdto = (ProductDTO) session.getAttribute("ProductRetrieveDTO");
		String pID = String.valueOf(pdto.getP_id());
		
		QuestionService service = new QuestionService();
		List<QuestionDTO> prodQuestionList = service.prodQuestion(Integer.parseInt(pID));
		System.out.println("prodQuestionList--- " + prodQuestionList);
		
		session.setAttribute("prodQuestionList", prodQuestionList);
		response.sendRedirect("prodQA.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
