package com.controller.store;

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

@WebServlet("/StoreServlet")
public class StoreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("storeServlet=======");
		
		HttpSession session = request.getSession();
		MemberDTO mdto = (MemberDTO)session.getAttribute("login");
		
		CategoryService category_service = new CategoryService(); // 카테고리 목록 조회
		ProductService  product_service  = new ProductService(); //베스트 상품 조회
		
		//페이징
				String curPage=request.getParameter("curPage");//현재 페이지
				if (curPage == null) {curPage="1";}//1페이지 시작
				
				//검색 기준, 검색어
				String searchName=request.getParameter("searchName");
				String searchValue=request.getParameter("searchValue");
				String sortBy=request.getParameter("sortBy");
				
				if (sortBy == null) {sortBy="p_id";}//최초 정렬 기준
				
				System.out.println(curPage+"\t"+searchName+"\t"+searchValue+"\t"+sortBy);
				
				//위 데이터를 map에 저장
				HashMap<String, Object> p_map = new HashMap<String, Object>();
				p_map.put("searchName", searchName);
				p_map.put("searchValue", searchValue);
				p_map.put("sortBy", sortBy);
				
				PageDTO pDTO = product_service.selectAllProduct(p_map,Integer.parseInt(curPage));
				System.out.println("스토어리스트!!!!!!"+pDTO);
				
		
		
		
		List<CategoryDTO> category_list = category_service.allCategory();//
		List<CategoryProductDTO> product_list = product_service.bestProductList();
		System.out.println(product_list);
		
		if(mdto != null) {
			
			HashMap<String,String> map = new HashMap<String, String>();
			ProductService service = new ProductService();
			
			//int [] likecheck = null ; 
			
			List<Integer> likecheck = new ArrayList<Integer>();
			
			for (int i = 0; i < product_list.size(); i++) {

				map.put("p_id",  Integer.toString(product_list.get(i).getP_id()));
				map.put("userid", mdto.getUserid());
				likecheck.add(service.likeCheck(map));
				
			}
			

			System.out.println("찜 갯수 확인"+likecheck);
			
			request.setAttribute("likecheck", likecheck);
			
		}
		
		
		
		request.setAttribute("pDTO", pDTO);
		request.setAttribute("searchName", searchName);
		request.setAttribute("searchValue", searchValue);
		request.setAttribute("sortBy", sortBy);
		request.setAttribute("category_list", category_list);		    
		request.setAttribute("product_list", product_list);
		
			
		
		
		RequestDispatcher dis = request.getRequestDispatcher("store.jsp");
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
