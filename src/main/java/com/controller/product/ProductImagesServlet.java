package com.controller.product;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.CategoryDTO;
import com.dto.ImagesDTO;
import com.dto.ProductDTO;
import com.service.ImagesService;

/**
 * Servlet implementation class ImagesServlet
 */
@WebServlet("/ProductImagesServlet")
public class ProductImagesServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<ProductDTO> productList = (List<ProductDTO>)request.getAttribute("productList"); 
		
		System.out.println("ProductImagesServlet에서 getAttribute한 Productlist "+ productList);
		System.out.println("ProductImagesServlet에서 p_id== "+ productList.get(0).getP_id());
		
		int p_id = productList.get(0).getP_id();
		
		ImagesService service= new ImagesService();
		List<ImagesDTO> list =  service.selectImages(p_id); 
		System.out.println("ProductImagesServlet에서 select한 ImagesDTO list "+list);
		
		
		request.setAttribute("ImagesList", list);
		request.setAttribute("productList", productList);
		
		  RequestDispatcher dis = request.getRequestDispatcher("product.jsp");
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
