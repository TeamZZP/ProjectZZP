package com.controller.product;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ProductAddServlet")
public class ProductAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int c_id = Integer.parseInt(request.getParameter("c_id"));
		String p_content = request.getParameter("p_content"); 
		int p_cost_price = Integer.parseInt(request.getParameter("p_cost_price"));
		int p_discount = Integer.parseInt(request.getParameter("p_discount"));
		String p_name = request.getParameter("p_name"); 
		int p_selling_price = Integer.parseInt(request.getParameter("p_selling_price"));
		int p_stock = Integer.parseInt(request.getParameter("p_stock"));
		String image_route = request.getParameter("image_route"); 
		String p_content_detail = request.getParameter("p_content_detail");
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}