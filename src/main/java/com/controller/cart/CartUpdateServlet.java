package com.controller.cart;

import java.io.IOException;
import java.io.PrintWriter;
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

@WebServlet("/CartUpdateServlet")
public class CartUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cart_id = Integer.parseInt(request.getParameter("cart_id"));
		int p_amount = Integer.parseInt(request.getParameter("p_amount"));
		int sum_money = Integer.parseInt(request.getParameter("sum_money"));
		
		System.out.println(cart_id + " " + p_amount+" "+sum_money);

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
			
			sum_money = service.sum_money(userid);
			System.out.println("sum_money 수정"+sum_money);
			
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print(sum_money);

		} else {
			nextPage = "LoginUIServlet";
			session.setAttribute("mesg", "로그인이 필요합니다.");
			response.sendRedirect(nextPage);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}