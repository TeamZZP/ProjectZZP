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
 * Servlet implementation class CartCheckServlet
 */
@WebServlet("/CartCheckServlet")
public class CartCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	/*
	 * HttpSession session = request.getSession(); MemberDTO dto =
	 * (MemberDTO)session.getAttribute("login"); String nextPage = null;
	 * 
	 * if(dto != null) { String userid = dto.getUserid(); CartService service = new
	 * CartService();
	 * 
	 * 
	 * 
	 */
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
