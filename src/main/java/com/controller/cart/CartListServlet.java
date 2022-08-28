package com.controller.cart;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.service.ProductService;

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
			
			//장바구니count
			int cartCount = service.cartCount(userid);
			System.out.println(cartCount);
			
			//찜Count
			ProductService Pservice  = new ProductService();
			int likeCount = Pservice.likeCount(userid);
			
			
			List<CartDTO> list = service.cartList(userid); 
			System.out.println("CartListServlet"+list);
			
			int sum_money = service.sum_money(userid); //총금액
			int fee = sum_money >= 50000? 0: 3000; //배송비 계산
			int total = sum_money+fee; //총금액 + 배송비
			
			Map<String,Object> map = new HashMap<>();
			map.put("list", list);
			map.put("cartCount", cartCount);
			map.put("sum_money",sum_money); 
			map.put("fee",fee); 
			map.put("total",total); 
			
			request.setAttribute("map", map);
			request.setAttribute("cartCount", cartCount);
			request.setAttribute("likeCount", likeCount);	
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