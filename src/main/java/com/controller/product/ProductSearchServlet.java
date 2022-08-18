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

import com.dto.CategoryDTO;
import com.dto.CategoryProductDTO;
import com.dto.ProductDTO;
import com.service.CategoryService;
import com.service.ProductService;

@WebServlet("/ProductSearchServlet")
public class ProductSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String searchValue = request.getParameter("searchValue");
		String c_id = request.getParameter("c_id");
		
		HttpSession session = request.getSession();
		
		if (searchValue!=null&&searchValue!="") {
			//상품 검색
			ProductService service = new ProductService();
			List<CategoryProductDTO> product_list = service.searchProduct(searchValue);
			
			//카테고리 목록
			CategoryService category_service = new CategoryService();
			List<CategoryDTO> category_list = category_service.allCategory();
			
			request.setAttribute("category_list", category_list);		
			request.setAttribute("product_list", product_list);
			
			RequestDispatcher dis = request.getRequestDispatcher("store.jsp");
			dis.forward(request, response);
		} 
		else if (c_id != null) {
			//세일 상품
			ProductService service = new ProductService();
			List<CategoryProductDTO> product_list = service.productList(Integer.parseInt(request.getParameter("c_id"))); 
			
			//카테고리 목록
			CategoryService category_service = new CategoryService();
			List<CategoryDTO> category_list = category_service.allCategory();
			
			request.setAttribute("product_list", product_list);
			request.setAttribute("category_list", category_list);	
				
			RequestDispatcher dis = request.getRequestDispatcher("store.jsp");
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
