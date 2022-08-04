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

import com.dto.ProductDTO;
import com.service.ProductService;


@WebServlet("/ProductListServlet")
public class ProductListServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String c_name = request.getParameter("");

		
		  if(c_name == null ){
		  
			  c_name = "best";  //스토어 메인 페이지 설정시 p_category만 수정하면됨
		  
		  }
		  
		  if(c_name.equals("best")) {
				
				ProductService service = new ProductService();
				List<ProductDTO> list = service.bestProduct();
				System.out.println(list);
				
				
				request.setAttribute("productList", list);
				RequestDispatcher dis = request.getRequestDispatcher("product.jsp");
				dis.forward(request, response);
				
			  
		  }else {

				
				ProductService service = new ProductService();
				List<ProductDTO> list = service.productList(c_name);
				System.out.println(list);
				
				
				request.setAttribute("productList", list);
				RequestDispatcher dis = request.getRequestDispatcher("product.jsp");
				dis.forward(request, response);
				
			
		  }
			  

		}
		
		
		
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
