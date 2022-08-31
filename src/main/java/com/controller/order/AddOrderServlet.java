package com.controller.order;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.MemberDTO;
import com.dto.OrderDTO;
import com.service.OrderService;

/**
 * Servlet implementation class AddOrderServlet
 */
@WebServlet("/AddOrderServlet")
public class AddOrderServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		MemberDTO mdto = (MemberDTO)session.getAttribute("login");
		
		String AddressName = (String)request.getAttribute("AddressName");
		String[] pIdListString = request.getParameterValues("p_id");
		
		OrderDTO orderdto = new OrderDTO();
		orderdto.setOrder_id(0);
		orderdto.setUserid(mdto.getUserid());
		orderdto.setP_id(Integer.parseInt((String)request.getAttribute("p_id")));
		orderdto.setTotal_price(Integer.parseInt((String)request.getAttribute("total_price")));
		orderdto.setDelivery_address((String)request.getAttribute("delivery_address"));
		orderdto.setDelivery_loc((String)request.getAttribute("delivery_loc"));
		orderdto.setDelivery_req((String)request.getAttribute("delivery_req"));
		//orderdto.setOrder_amount(request.getAttribute("p_amount"));
		orderdto.setOrder_date("");
		
		OrderService service = new OrderService();
		int n = service.addOrder(orderdto);
		
		System.out.println(n + "주문 전송 성공");
		
		request.setAttribute("orderdto", orderdto);
		RequestDispatcher dis = request.getRequestDispatcher("orderSheet.jsp");
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
