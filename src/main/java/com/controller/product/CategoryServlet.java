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

import com.dto.CategoryDTO;
import com.dto.CategoryProductDTO;
import com.service.CategoryService;
import com.service.ProductService;

/**
 * Servlet implementation class CategoryServlet
 */
@WebServlet("/CategoryServlet")
public class CategoryServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		CategoryService service = new CategoryService();
		
		
		
		List<CategoryProductDTO> product_list  = null; //베스트상품
		ProductService pservice = new ProductService();
       if (request.getParameter("c_id")== null ||"".equals(request.getParameter("c_id"))) {
    	   
			
    	   product_list= pservice.bestProductList();  //베스트 상품 가져오기(이미지,productDTO)
			
			
		}else {
			product_list= pservice.productList(Integer.parseInt(request.getParameter("c_id")));  //베스트 상품 가져오기(이미지,productDTO)
		}
   		
        request.setAttribute("product_list", product_list);
	
		RequestDispatcher dis = request.getRequestDispatcher("categoryProduct.jsp");
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
