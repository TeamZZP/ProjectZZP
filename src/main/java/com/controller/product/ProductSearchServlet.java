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

@WebServlet("/ProductSearchServlet")
public class ProductSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String searchValue = request.getParameter("searchValue");
		System.out.println(searchValue);
		
		HttpSession session = request.getSession();
		
		if (searchValue!=null) {
			ProductService service = new ProductService();
			List<ProductDTO> list = service.searchProduct(searchValue);
			System.out.println(list);
			
			request.setAttribute("productList", list);
			RequestDispatcher dis = request.getRequestDispatcher("productSearch.jsp");
			dis.forward(request, response);
		} else {
			session.setAttribute("mesg", "검색어를 입력하세요!"); 
			session.setMaxInactiveInterval(60*60);
			response.sendRedirect("MainServlet");
		};
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
