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
import com.dto.PageDTO;
import com.service.CategoryService;
import com.service.ProductService;

@WebServlet("/ProductListServlet")
public class ProductListServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("프로덕트리스트서블릿=====");
		
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO) session.getAttribute("login");
		ProductService service = new ProductService();
		
		//페이징
		String curPage=request.getParameter("curPage");//현재 페이지
		if (curPage == null) {curPage="1";}//1페이지 시작
		
		//검색 기준, 검색어
		String searchName=request.getParameter("searchName");
		String searchValue=request.getParameter("searchValue");
		String sortBy=request.getParameter("sortBy");
		if (sortBy == null) {sortBy="created_at";}//최초 정렬 기준
		System.out.println(curPage+"\t"+searchName+"\t"+searchValue+"\t"+sortBy);
		
		//위 데이터를 map에 저장
		HashMap<String, String> p_map = new HashMap<String, String>();
		p_map.put("searchName", searchName);
		p_map.put("searchValue", searchValue);
		p_map.put("sortBy", sortBy);
		
		PageDTO pDTO = service.selectAllProduct(p_map,Integer.parseInt(curPage));
		System.out.println("프로덕트리스트!!!!!!"+pDTO);
		
		
		
		String userid = "";
		if(member != null) {
			userid = member.getUserid();
		}	
		  
		int c_id = Integer.parseInt( request.getParameter("c_id"));
		String p_id = request.getParameter("p_id");
		
		CategoryService caservice = new CategoryService();
		
		List<CategoryDTO> ca_list  = caservice.allCategory(); //카테고리 전체 데이터
		
		request.setAttribute("categoryList", ca_list);
		
		
		
		List<CategoryProductDTO> list  = null;
		
		 
		if (request.getParameter("c_id")== null ||"".equals(request.getParameter("c_id"))) {
			
			list= service.bestProductList();  //베스트 상품 가져오기(이미지,productDTO)
			
			
		}else {
			
			int c_id2 = Integer.parseInt( request.getParameter("c_id"));
			list= service.productList(c_id2);  //카테고리상품 가져오기(이미지,productDTO)
			
		}		
			System.out.println("ProductListServlet에서 productList==="+list);
		
			List<CategoryProductDTO> plist  = null; //베스트상품
			plist = new ArrayList<CategoryProductDTO>();
			
			HashMap<String,String> map = new HashMap<String, String>();
			map.put("p_id", p_id);
			map.put("userid", userid);
			
			int likecheck = service.likeCheck(map);
			
			request.setAttribute("likecheck", likecheck);
	        request.setAttribute("best", plist);		    
			request.setAttribute("productList", list);
			
			
			
			
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
