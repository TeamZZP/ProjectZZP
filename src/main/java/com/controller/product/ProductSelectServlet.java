package com.controller.product;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.AddressDTO;
import com.dto.CategoryDTO;
import com.dto.CategoryProductDTO;
import com.dto.MemberDTO;
import com.dto.ProductDTO;
import com.service.AddressService;
import com.service.CategoryService;
import com.service.MemberService;
import com.service.ProductService;

/**
 * Servlet implementation class SelectProductServlet
 */
@WebServlet("/ProductSelectServlet")
public class ProductSelectServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("상품 출력 서블릿 실행");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		HttpSession session=request.getSession();
//		MemberDTO dto=(MemberDTO) session.getAttribute("login");
		
		int p_id=Integer.parseInt(request.getParameter("p_id"));
		ProductService service=new ProductService();
		ProductDTO p=service.productRetrieve(p_id);
		System.out.println(p);
		
/*		CategoryService category_service = new CategoryService(); // 카테고리 목록 조회
		ProductService  product_service  = new ProductService(); //베스트 상품 조회
		
		List<CategoryDTO> category_list = category_service.allCategory();
		List<CategoryProductDTO> product_list = product_service.bestProductList();
		System.out.println(product_list);
		
		request.setAttribute("category_list", category_list);		    
		request.setAttribute("product_list", product_list);	*/
		
//		RequestDispatcher dis=request.getRequestDispatcher("product/product.jsp");
//		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
