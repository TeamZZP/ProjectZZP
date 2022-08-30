package com.controller.product;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.ProductDTO;
import com.service.ProductService;

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
		
		ProductDTO dto = new ProductDTO(0, p_name, p_content, c_id, p_cost_price, p_selling_price, p_discount, null, p_stock, "admin1");
		ProductService service = new ProductService();
		int num = service.insertProduct(dto);
		System.out.println("ProductAdd=="+num);
		
		HttpSession session = request.getSession();
		if (num==1) {
			response.sendRedirect("AdminCategoryServlet?category=product");
			session.setAttribute("mesg", "상품이 등록되었습니다.");
		} else {
			response.sendRedirect("AdminCategoryServlet?category=product");
			session.setAttribute("mesg", "상품이 등록되지 않았습니다. 다시 확인해주세요");
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}