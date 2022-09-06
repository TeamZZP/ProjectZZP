package com.controller.product;

import java.io.IOException;
import java.util.HashMap;
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
import com.dto.MemberDTO;
import com.dto.ProductDTO;
import com.dto.QuestionDTO;
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
    
      HttpSession session = request.getSession();  
      MemberDTO member = (MemberDTO)session.getAttribute("login");
		/* System.out.println(member); */
      
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
		
		if(member != null) {
			String userid = member.getUserid();
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("userid", userid);
			map.put("p_id", P_ID);
			int likecheck = service.likeCheck(map);
			System.out.println(map);
			System.out.println(likecheck);
			request.setAttribute("likecheck", likecheck);
		}
			
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