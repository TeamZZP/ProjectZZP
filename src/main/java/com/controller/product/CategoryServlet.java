package com.controller.product;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.CategoryDTO;
import com.dto.CategoryProductDTO;
import com.dto.MemberDTO;
import com.service.CategoryService;
import com.service.ProductService;

/**
 * Servlet implementation class CategoryServlet
 */
@WebServlet("/CategoryServlet")
public class CategoryServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO) session.getAttribute("login");
		
		String userid = "";
		
		
		if(member != null) {
			userid = member.getUserid();
		}	
		
		int c_id = Integer.parseInt( request.getParameter("c_id"));
		String p_id = request.getParameter("p_id");
		
		CategoryService service = new CategoryService();
		
		List<CategoryProductDTO> product_list  = null; //베스트상품
		
		ProductService pservice = new ProductService();
		
       if (request.getParameter("c_id")== null ||"".equals(request.getParameter("c_id"))) {
    	   
			
    	   product_list= pservice.bestProductList();  //베스트 상품 가져오기(이미지,productDTO)
			
			
		}else {
			product_list= pservice.productList(Integer.parseInt(request.getParameter("c_id"))); 
		}
   		
       
		/*
		 * HashMap<String,String> map = new HashMap<String, String>(); map.put("p_id",
		 * p_id); map.put("userid", userid); int likecheck = service.likeCheck(map);
		 * 
		 * request.setAttribute("c_likecheck", likecheck);
		 */
		
        request.setAttribute("product_list", product_list);
        System.out.println("카테고리서블릿========="+product_list);
		
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
