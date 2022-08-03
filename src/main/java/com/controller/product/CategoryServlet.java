package com.controller.product;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.CategoryService;

/**
 * Servlet implementation class CategoryServlet
 */
@WebServlet("/CategoryServlet")
public class CategoryServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		CategoryService service = new CategoryService();
		
		int count = service.getCount();
		System.out.println(count);
		HashMap<Integer, String> map = new HashMap<Integer, String>();
		
		for (int i = 0; i < count; i++) {
			
			 String c_name = service.categoryName(i); 
		     map.put(i, c_name); 
			 System.out.println(c_name);
			 System.out.println(i);
		}
		
		for (int key : map.keySet()) {
			String cName = map.get(key);
			System.out.println(cName);
		}
		
		request.setAttribute("category_nameMap", map);
		RequestDispatcher dis = request.getRequestDispatcher("category.jsp");
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
