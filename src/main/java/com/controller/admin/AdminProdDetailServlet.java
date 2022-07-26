package com.controller.admin;

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
import com.dto.CategoryProductDTO;
import com.dto.ImagesDTO;
import com.dto.ProductDTO;
import com.dto.QuestionDTO;
import com.service.AnswerService;
import com.service.ProductService;
import com.service.QuestionService;

@WebServlet("/AdminProdDetailServlet")
public class AdminProdDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  
		  int p_id = Integer.parseInt(request.getParameter("p_id")) ; 
	      System.out.println("AdminProdDetailServlet에서 파싱한 p_id=="+p_id);
	      
	      ProductService service = new ProductService();
	      ProductDTO pdto = service.productRetrieve(p_id);
	      List <ImagesDTO> ilist = service.ImagesRetrieve(p_id);
	      		
	      String P_ID = String.valueOf(pdto.getP_id());
		
		  HttpSession session = request.getSession();
		  request.setAttribute("ProductRetrieveDTO", pdto);
	      request.setAttribute("ImagesRetrieveList", ilist);
	    
		  RequestDispatcher dis = request.getRequestDispatcher("adminProductDetail.jsp");
		  dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}