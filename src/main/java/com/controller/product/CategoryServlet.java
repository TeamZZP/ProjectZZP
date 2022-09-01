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

@WebServlet("/CategoryServlet")
public class CategoryServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("카테고리서블릿======");
		
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO) session.getAttribute("login");
		ProductService  product_service  = new ProductService(); 
				
		String userid = "";
		
	
		String p_id = request.getParameter("p_id");

		CategoryService service = new CategoryService();
		
		List<CategoryProductDTO> product_list  = null; //베스트상품
		
		ProductService pservice = new ProductService();
       if (request.getParameter("c_id") == null ||"".equals(request.getParameter("c_id"))) {
    	   System.out.println("카테고리 아이디 확인 : "+request.getParameter("c_id"));
    	   product_list= pservice.bestProductList();  //베스트 상품 가져오기(이미지,productDTO)
			
		}else {
			product_list= pservice.productList(Integer.parseInt(request.getParameter("c_id"))); 
		}
   		
      
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
		HashMap<String, String> p_map = new HashMap<String, String>();
		
		p_map.put("c_id", request.getParameter("c_id"));
		p_map.put("sortBy", sortBy);
		
		System.out.println("카테고리서블릿!!!!!!"+p_map);
		
		PageDTO pDTO2 = product_service.selectC_Product(p_map,Integer.parseInt(curPage));
		
		System.out.println("카테고리서블릿!!!!!!"+pDTO2);
		
		
		 
		/*
		 * HashMap<String,String> map = new HashMap<String, String>(); map.put("p_id",
		 * p_id); map.put("userid", userid); int likecheck = service.likeCheck(map);
		 * 
		 * request.setAttribute("c_likecheck", likecheck);
		 */
       
		
			if(member != null) {
			userid = member.getUserid();
			HashMap<String,String> map = new HashMap<String, String>();
			
			//int [] likecheck = null ; 
			
			List<Integer> likecheck = new ArrayList<Integer>();
			
			for (int i = 0; i < product_list.size(); i++) {

				map.put("p_id",  Integer.toString(product_list.get(i).getP_id()));
				map.put("userid", userid);
				likecheck.add(product_service.likeCheck(map));
				
			}
			

			System.out.println("찜 갯수 확인"+likecheck);
			
			request.setAttribute("likecheck", likecheck);
			
		}
		
		
       	request.setAttribute("pDTO", pDTO2);
		request.setAttribute("sortBy", sortBy);
        request.setAttribute("product_list", product_list);

        System.out.println("상품 출력=============="+product_list);

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
