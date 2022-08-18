package com.controller.cart;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.CartDTO;
import com.dto.MemberDTO;
import com.service.CartService;

@WebServlet("/CartListServlet")
public class CartListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		MemberDTO dto = (MemberDTO)session.getAttribute("login");
		String nextPage = null;
		if(dto != null) {
			String userid = dto.getUserid();
			CartService service = new CartService();
			List<CartDTO> list = service.cartList(userid); 
			System.out.println("CartListServlet"+list);
			//장바구니count
			int count = service.cartCount(userid);
			System.out.println(count);
			
			request.setAttribute("cartCount", count);
			request.setAttribute("cartList", list);
			nextPage="cartList.jsp";
			
		}else {
			nextPage="LoginUIServlet";
			session.setAttribute("mesg", "로그인이 필요합니다");
		}
		RequestDispatcher dis = request.getRequestDispatcher(nextPage);
		dis.forward(request, response);		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}