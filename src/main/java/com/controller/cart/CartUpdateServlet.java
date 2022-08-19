package com.controller.cart;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.MemberDTO;
import com.service.CartService;

/**
 * Servlet implementation class CartUpdateServlet
 */
@WebServlet("/CartUpdateServlet")
public class CartUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int cart_id = Integer.parseInt(request.getParameter("cart_id"));
		int p_amount = Integer.parseInt(request.getParameter("p_amount"));
		System.out.println(cart_id + " " + p_amount);

		String nextPage = null;
		HttpSession session = request.getSession();

		MemberDTO dto = (MemberDTO) session.getAttribute("login");

		if (dto != null) {
			String userid = dto.getUserid();
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("cart_id", cart_id);
			map.put("p_amount", p_amount);

			CartService service = new CartService();
			int num = service.cartUpdate(map);
			System.out.println(num);

			/*
			 * int sum_money = service.sum_money(userid); //총금액 int fee = sum_money >=
			 * 50000? 0: 3000; //배송비 계산 int total = sum_money+fee; //총금액 + 배송비
			 * 
			 * 
			 * Map<String,Integer> map2 = new HashMap<>(); map2.put("sum_money",sum_money);
			 * map2.put("fee",fee); map2.put("total",total);
			 * 
			 * 
			 * request.setAttribute("fee",fee ); request.setAttribute("total",total );
			 */

		} else {
			nextPage = "LoginUIServlet";
			session.setAttribute("mesg", "로그인이 필요합니다.");
			response.sendRedirect(nextPage);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
