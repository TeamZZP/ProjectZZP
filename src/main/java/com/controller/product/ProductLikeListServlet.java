package com.controller.product;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.CategoryProductDTO;
import com.dto.MemberDTO;
import com.dto.ProductDTO;
import com.dto.product_likedDTO;
import com.service.CartService;
import com.service.ProductService;

/**
 * Servlet implementation class ProductLikeListServlet
 */
@WebServlet("/ProductLikeListServlet")
public class ProductLikeListServlet extends HttpServlet {
	
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ProductLikeListServlet====");
		HttpSession session = request.getSession();
		MemberDTO mdto = new MemberDTO();
		mdto = (MemberDTO) session.getAttribute("login");
		
		if(mdto != null) {

			String userid = mdto.getUserid();
			ProductService service  = new ProductService();
			
			//찜 count
			int count = service.likeCount(userid);
			System.out.println("likeCount==="+count);
			//장바구니 count
			CartService Cservice = new CartService();
			int cartCount = Cservice.cartCount(userid);
			System.out.println(cartCount);
			
			
			List<product_likedDTO> list = service.likeList(userid);
			System.out.println("ProductLikeListServlet"+list);
			 
			
			request.setAttribute("likeCount", count);
			request.setAttribute("cartCount", cartCount);
			request.setAttribute("list", list);
				
		}else {
			request.setAttribute("mesg", "로그인이 필요합니다.");
			response.sendRedirect("LoginUIServlet");
		}
		RequestDispatcher dis = request.getRequestDispatcher("likeList.jsp");
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
