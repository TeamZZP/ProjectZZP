package com.controller.product;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.ProductDTO;
import com.service.ProductService;

/**
 * Servlet implementation class productRetrieveServlet
 */
@WebServlet("/productRetrieveServlet")
public class productRetrieveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String p_id = request.getParameter("p_id"); 
		System.out.println(p_id);
		
		ProductService service = new ProductService();
		ProductDTO dto = service.productRetrieve(p_id);
		
		HttpSession session = request.getSession();
		session.setAttribute("Retrieve", dto);
		
		RequestDispatcher dis = request.getRequestDispatcher("productRetrieve.jsp");
		dis.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}