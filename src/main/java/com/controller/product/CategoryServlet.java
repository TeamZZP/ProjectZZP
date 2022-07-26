package com.controller.product;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
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

		CategoryService service = new CategoryService();
		ProductService pservice = new ProductService();
		
		HashMap<String, String> p_map = new HashMap<String, String>();
		List<CategoryProductDTO> product_list  = new ArrayList<CategoryProductDTO>(); 
	   
	    
		
		String sortBy=request.getParameter("sortBy");
		String c_id=request.getParameter("c_id");
		
	    
			if (c_id == null ||"".equals(c_id)) {
				
				System.out.println(">>카테고리베스트 "+c_id+"베스트");
				request.setAttribute("c_id", 0);
				//최초 정렬 기준 = 주문 순
				 if (sortBy == null) {
					p_map.put("sortBy","p_order");	
				
					}else{ 
					//정렬 선택 시 선택한 기준으로 정렬
					 p_map.put("sortBy", sortBy);	
					System.out.println("sortBy : "+ sortBy);
					}
			       
				 product_list = pservice.bestProductListSortBy(p_map);
			       
			}else {
				//베스트 외 다른 카테고리
		       System.out.println("카테고리 아이디 확인 : "+c_id);
		       request.setAttribute("c_id", c_id);
			  /* product_list= pservice.productList(Integer.parseInt(request.getParameter("c_id"))); 
			   pDTO.setList(product_list);*/
		       if (sortBy== null) {
		    	 //최초 정렬 기준 = 상품 id 순
					p_map.put("sortBy", "p_id");	
					p_map.put("c_id", c_id);
					}else{
					//정렬 선택 시 선택한 기준으로 정렬
					p_map.put("sortBy",sortBy);	
					p_map.put("c_id", c_id);	
					}
		       
		       product_list = pservice.selectC_Product(p_map);
			}
				
			/*	if (sortBy == null) {
					p_map.put("sortBy", "p_order");	
					}else{//최초 정렬 기준//주문 순=베스트
					p_map.put("sortBy", sortBy);	
					p_map.put("c_id", request.getParameter("c_id"));	
					}
				
				System.out.println(curPage+"\t"+searchName+"\t"+searchValue+"\t"+sortBy);
					
				System.out.println("카테고리서블릿 c_id : "+request.getParameter("c_id"));
				System.out.println("카테고리서블릿 sortBy : "+p_map.get("sortBy"));
				//에러 ㄱ
				pDTO = pservice.selectC_Product(p_map,Integer.parseInt(curPage));
				
				System.out.println("카테고리서블릿!!!!!!"+pDTO);*/

		/*
		 * HashMap<String,String> map = new HashMap<String, String>(); map.put("p_id",
		 * p_id); map.put("userid", userid); int likecheck = service.likeCheck(map);
		 * 
		 * request.setAttribute("c_likecheck", likecheck);
		 */
       
         String userid = "";
			if(member != null) {
			userid = member.getUserid();
			HashMap<String,String> map = new HashMap<String, String>();
			
			//int [] likecheck = null ; 
			
			List<Integer> likecheck = new ArrayList<Integer>();
			
			List<CategoryProductDTO> c_productList=product_list;
			for (int i = 0; i < c_productList.size(); i++) {

				map.put("p_id",  Integer.toString(c_productList.get(i).getP_id()));
				map.put("userid", userid);
				likecheck.add(pservice.likeCheck(map));
				
			}

			System.out.println("찜 갯수 확인"+likecheck);
			
			request.setAttribute("likecheck", likecheck);
			
		}
		
		
       	request.setAttribute("product_list", product_list);
		request.setAttribute("sortBy", sortBy);
		
	
		
        //request.setAttribute("product_list", product_list);
      

		RequestDispatcher dis = request.getRequestDispatcher("categoryProduct.jsp");
		dis.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
