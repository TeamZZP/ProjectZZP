package com.controller.order;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.OrderDTO;

/**
 * Servlet implementation class AddOrderServlet
 */
@WebServlet("/AddOrderServlet")
public class AddOrderServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		session.getAttribute("login");
		
		String AddressName = (String)request.getAttribute("AddressName");
		String[] pIdListString = request.getParameterValues("p_id");
		
		OrderDTO orderdto = new OrderDTO();
		orderdto.setOrder_id(0);
		orderdto.setUserid("");
		orderdto.setP_id("");
		orderdto.setTotal_price(0);
		orderdto.setDelivery_address("");
		orderdto.setDelivery_loc("");
		orderdto.setDelivery_req("");
		orderdto.setOrder_quantity(0);
		orderdto.setOrder_date("");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
