package com.controller.product;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.CategoryDTO;
import com.dto.CategoryProductDTO;
import com.dto.ProductDTO;
import com.service.ProductService;

@WebServlet("/ProductListServlet")
public class ProductListServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		  
		int c_id = Integer.parseInt( request.getParameter("c_id"));
		
		    ProductService service = new ProductService();
			List<CategoryProductDTO> list = service.productList(c_id);  //카테고리상품 가져오기(이미지,productDTO)
			System.out.println("ProductListServlet에서 productList==="+list);
		
					    
			request.setAttribute("productList", list);
			
			
			RequestDispatcher dis = request.getRequestDispatcher("product.jsp");
			dis.forward(request, response);
			  

		}
		
		
		
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
