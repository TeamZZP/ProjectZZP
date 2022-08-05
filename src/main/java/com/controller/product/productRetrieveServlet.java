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

import com.dto.ImagesDTO;
import com.dto.ProductDTO;
import com.service.ProductService;

/**
 * Servlet implementation class productRetrieveServlet
 */
@WebServlet("/productRetrieveServlet")
public class productRetrieveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int p_id = Integer.parseInt(request.getParameter("p_id")) ; 
		System.out.println(p_id);
		
		ProductService service = new ProductService();
		ProductDTO pdto = service.productRetrieve(p_id);
		List <ImagesDTO> ilist = service.ImagesRetrieve(p_id);
		
		HttpSession session = request.getSession();
		session.setAttribute("ProductRetrieveDTO", pdto);
		session.setAttribute("ImagesRetrieveList", ilist);
		
		RequestDispatcher dis = request.getRequestDispatcher("productRetrieve.jsp");
		dis.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
