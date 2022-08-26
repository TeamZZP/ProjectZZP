package com.controller.product;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.AnswerDTO;
import com.dto.ImagesDTO;
import com.dto.ProductDTO;
import com.dto.QuestionDTO;
import com.dto.ReviewDTO;
import com.dto.ReviewProfileDTO;
import com.service.AnswerService;
import com.service.ProductService;
import com.service.QuestionService;
import com.service.ReviewService;

/**
 * Servlet implementation class productRetrieveServlet
 */
@WebServlet("/ProductRetrieveServlet")
public class ProductRetrieveServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
  
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      int p_id = Integer.parseInt(request.getParameter("p_id")) ; 
      System.out.println("ProductRetrieveServlet에서 파싱한 p_id=="+p_id);
      
      ProductService service = new ProductService();
      ProductDTO pdto = service.productRetrieve(p_id); //prodDetail
      List <ImagesDTO> ilist = service.ImagesRetrieve(p_id); //prodImg
      		
      String P_ID = String.valueOf(pdto.getP_id());
		
		QuestionService Qservice = new QuestionService();
		List<QuestionDTO> prodQuestionList = Qservice.prodQuestion(P_ID);
		System.out.println("prodQuestionList--- " + prodQuestionList); //Question
		
		AnswerService Aservice = new AnswerService();
		AnswerDTO aDTO = Aservice.selectAnswer(P_ID);
		System.out.println("대답  " + aDTO); //Answer
		
		ReviewService Rservice = new ReviewService();  
		List<ReviewProfileDTO> ReviewList = Rservice.review(P_ID);
		System.out.println("리뷰 " + ReviewList); //리뷰
		
		HttpSession session = request.getSession();
		request.setAttribute("ProductRetrieveDTO", pdto);
	    request.setAttribute("ImagesRetrieveList", ilist);
	    
		session.setAttribute("aDTO", aDTO);
		session.setAttribute("prodQuestionList", prodQuestionList);
		
		session.setAttribute("ReviewList", ReviewList);
		 
	 RequestDispatcher dis = request.getRequestDispatcher("productRetrieve.jsp");
	 dis.forward(request, response);
      
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

}