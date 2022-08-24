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
import javax.servlet.http.HttpSession;

import com.dto.CategoryProductDTO;
import com.dto.MemberDTO;
import com.dto.ProductDTO;
import com.service.ProductService;

/**
 * Servlet implementation class ProductLikeListServlet
 */
@WebServlet("/ProductLikeListServlet")
public class ProductLikeListServlet extends HttpServlet {
	
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberDTO mdto = new MemberDTO();
		mdto = (MemberDTO) session.getAttribute("login");
		
		if(mdto != null) {

			String userid = mdto.getUserid();
			
			ProductService service  = new ProductService();
			List<Integer> liked_pId_List = new ArrayList<Integer>();
			liked_pId_List=	service.selectLikeProduct(userid); //찜한 상품 p_id List
			List<CategoryProductDTO> productList = new ArrayList<CategoryProductDTO>();
			
			for (int i = 0; i <liked_pId_List.size() ; i++) {
				productList = (List<CategoryProductDTO>) service.productList(liked_pId_List.get(i));
			}
			
			request.setAttribute("productList", productList);
			RequestDispatcher dis = request.getRequestDispatcher("likeList.jsp");
			
		}else {
			request.setAttribute("mesg", "로그인이 필요합니다.");
			response.sendRedirect("LoginUIServlet");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
