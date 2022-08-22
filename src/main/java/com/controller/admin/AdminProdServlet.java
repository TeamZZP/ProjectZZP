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

import com.dto.CategoryProductDTO;
import com.dto.ChallengeDTO;
import com.dto.MemberDTO;
import com.service.ChallengeService;
import com.service.ProductService;

@WebServlet("/AdminProdServlet")
public class AdminProdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//관리자만 접근 가능
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO) session.getAttribute("login");
		//관리자만 접근 가능
		if (member != null) {
			
			//전체 상품 목록
			ProductService  product_service  = new ProductService();
			List<CategoryProductDTO> product_list = product_service.ProductList();

			request.setAttribute("product_list", product_list);
			RequestDispatcher dis = request.getRequestDispatcher("adminProduct.jsp");
			dis.forward(request, response);
			
		//관리자가 아닌 경우
		} else {
			session.setAttribute("mesg", "잘못된 접근입니다.");
			response.sendRedirect("main");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}