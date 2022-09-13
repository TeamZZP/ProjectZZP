package com.controller.product;

import java.io.IOException;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.MemberDTO;
import com.dto.ProductDTO;
import com.service.ProductService;

@WebServlet("/ProductDeleteServlet")
public class ProductDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  request.setCharacterEncoding("UTF-8");
		  
		  //관리자 처리
		  HttpSession session = request.getSession();
		  MemberDTO dto = (MemberDTO) session.getAttribute("login");
		  if (dto.getRole()==1 && dto!=null) {
			  
			  String [] p_ids = request.getParameterValues("p_id");
			  List<String> ids = Arrays.asList(p_ids);
		      
			  ProductService service = new ProductService();
			  int num = service.deleteProduct(ids);
			  System.out.println("ProductDelete 갯수>>"+num);
			  
			  String curPage = request.getParameter("curPage");
			  String searchName = request.getParameter("searchName");
			  String searchValue = request.getParameter("searchValue");
			  String sortBy = request.getParameter("sortBy");
			  String category = request.getParameter("category");
			  
			  if (num==1) {
				response.sendRedirect("AdminCategoryServlet?curPage="+curPage
							+"&searchName="+searchName+"&searchValue="+searchValue
							+"&sortBy="+sortBy+"&category=product");
			  } else {
				  response.sendRedirect("AdminCategoryServlet?curPage="+curPage
							+"&searchName="+searchName+"&searchValue="+searchValue
							+"&sortBy="+sortBy+"&category=product");
			  }
		  
		} else {
			session.setAttribute("mesg", "잘못된 접근입니다.");
			response.sendRedirect("MainServlet");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}