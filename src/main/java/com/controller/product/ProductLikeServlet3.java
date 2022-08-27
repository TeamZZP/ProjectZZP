package com.controller.product;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.ProductService;

/**
 * Servlet implementation class ProductLikeServlet
 */
@WebServlet("/ProductLikeServlet3")
public class ProductLikeServlet3 extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ProductLikeServlet 실행됨"+ request.getParameter("p_id"));
		
		String p_id = request.getParameter("p_id");
		System.out.println(p_id);
		String userid = request.getParameter("userid");
		System.out.println(userid);
		
		HashMap<String,String> map = new HashMap<String, String>();
		map.put("p_id", p_id);
		map.put("userid", userid);
		
		ProductService service = new ProductService();
		
		int likecheck = service.likeCheck(map);
		
		if(likecheck== 0) {
			int n = service.addLike(map);
		  }
		
		
		
		
		
		}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

