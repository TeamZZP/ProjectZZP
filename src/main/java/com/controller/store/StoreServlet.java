package com.controller.store;

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
import com.dto.MemberDTO;
import com.service.CartService;
import com.service.CategoryService;
import com.service.ProductService;

@WebServlet("/StoreServlet")
public class StoreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		CategoryService category_service = new CategoryService(); // 카테고리 목록 조회
		ProductService  product_service  = new ProductService(); //베스트 상품 조회
		
		List<CategoryDTO> category_list = category_service.allCategory();
		List<CategoryProductDTO> product_list = product_service.bestProductList();
		System.out.println(product_list);
		
		request.setAttribute("category_list", category_list);		    
		request.setAttribute("product_list", product_list);
			
		
		
		RequestDispatcher dis = request.getRequestDispatcher("store.jsp");
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
