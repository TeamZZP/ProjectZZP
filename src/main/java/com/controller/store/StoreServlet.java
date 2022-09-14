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
import com.dto.ProductDTO;
import com.service.CategoryService;
import com.service.ProductService;

@WebServlet("/StoreServlet")
public class StoreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("storeServlet=======");

		HttpSession session = request.getSession();
		MemberDTO mdto = (MemberDTO) session.getAttribute("login");

		CategoryService category_service = new CategoryService(); // 카테고리 목록 조회
		ProductService pservice = new ProductService(); // 베스트 상품 조회
		HashMap<String, String> p_map = new HashMap<String, String>();

		String sortBy = request.getParameter("sortBy");
		String c_id = request.getParameter("c_id");
		
		List<CategoryProductDTO> product_list = new ArrayList<CategoryProductDTO>();

		// 스토어 메인
		if (c_id == null || "".equals(c_id)) {
			// 최초 정렬 기준//주문 순=베스트
			if (sortBy == null) {
				p_map.put("sortBy", "p_order");
			} else {
				p_map.put("sortBy", sortBy);
			}

			product_list = pservice.bestProductListSortBy(p_map);

		}
		/*
		 * else { System.out.println("카테고리 아이디 확인 : "+c_id); product_list=
		 * pservice.productList(Integer.parseInt(request.getParameter("c_id")));
		 * pDTO.setList(product_list); System.out.println("카테고리>>>"+c_id+" "+sortBy);
		 * //최초 정렬 기준//주문 순=베스트 if (sortBy== null) { p_map.put("sortBy", "p_id");
		 * p_map.put("c_id", request.getParameter("c_id"));
		 * System.out.println("정렬기준x>>>"+c_id+" "+sortBy); }else{
		 * p_map.put("sortBy",sortBy); p_map.put("c_id", request.getParameter("c_id"));
		 * System.out.println("정렬기준O>>>"+c_id+" "+sortBy); }
		 * 
		 * product_list = pservice.selectC_Product(p_map); }
		 */
		
		List<CategoryDTO> category_list = category_service.allCategory();
		
		String userid = "";
		if (mdto != null) {
			userid = mdto.getUserid();
			HashMap<String, String> map = new HashMap<String, String>();

			// int [] likecheck = null ;

			List<Integer> likecheck = new ArrayList<Integer>();

			List<CategoryProductDTO> c_productList = product_list;
			for (int i = 0; i < c_productList.size(); i++) {

				map.put("p_id", Integer.toString(c_productList.get(i).getP_id()));
				map.put("userid", userid);
				likecheck.add(pservice.likeCheck(map));

			}

			System.out.println("찜 갯수 확인" + likecheck);

			request.setAttribute("likecheck", likecheck);

		}

		request.setAttribute("product_list", product_list);

		request.setAttribute("sortBy", sortBy);
		request.setAttribute("category_list", category_list);
		// request.setAttribute("product_list", product_list);

		RequestDispatcher dis = request.getRequestDispatcher("store.jsp");
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
