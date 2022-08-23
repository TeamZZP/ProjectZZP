package com.controller.product;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.ProductDTO;
import com.service.ProductService;

@WebServlet("/ProductDeleteServlet")
public class ProductDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  request.setCharacterEncoding("UTF-8");
		  int p_id = Integer.parseInt(request.getParameter("p_id")) ; 
	      
		  ProductService service = new ProductService();
		  int num = service.deleteProduct(p_id);
		  System.out.println(num);
		  
		  HttpSession session = request.getSession();
		  if (num==1) {
			response.sendRedirect("AdminCategoryServlet?category=product");
			session.setAttribute("mesg", "상품이 삭제되었습니다.");
		} else {
			response.sendRedirect("AdminCategoryServlet?category=product");
			session.setAttribute("mesg", "상품이 삭제되지 않았습니다. 다시 확인해주세요");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}