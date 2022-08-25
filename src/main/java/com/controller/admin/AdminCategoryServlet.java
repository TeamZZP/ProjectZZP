package com.controller.admin;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.AddressDTO;
import com.dto.CategoryProductDTO;
import com.dto.ChallengeDTO;
import com.dto.MemberDTO;
import com.dto.PageDTO;
import com.service.AddressService;
import com.service.ChallengeService;
import com.service.MemberService;
import com.service.ProductService;

@WebServlet("/AdminCategoryServlet")
public class AdminCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String category = request.getParameter("category");
		System.out.println("AdminCategoryServlet========" +category);
		
		HttpSession session=request.getSession();
		MemberDTO dto=(MemberDTO) session.getAttribute("login");
		
		if (category.equals("member")) {
			MemberService m_service=new MemberService();
			AddressService a_service=new AddressService();
//			HashMap<String, List<AddressDTO>> addressMap=new HashMap<String, List<AddressDTO>>();
			HashMap<String, AddressDTO> addMap=new HashMap<String, AddressDTO>();
			//전체 회원 목록
			List<MemberDTO> memberList=m_service.selectAllMember();
			
			String userid=null;
			
			//전체 회원 주소 목록--회원별 주소
			for (int i = 0; i < memberList.size(); i++) {
				userid=memberList.get(i).getUserid();
				AddressDTO address=a_service.selectDefaultAddress(userid);
				addMap.put(userid, address);//userid의 기본 주소 출력
			}
			for (MemberDTO memberDTO : memberList) {
				String id=memberDTO.getUserid();
				System.out.println(id+"의 주소지 : "+addMap.get(id));
			}
			System.out.println(addMap);
			request.setAttribute("memberList", memberList);
			request.setAttribute("addMap", addMap);//userid의 address 리스트
			RequestDispatcher dis = request.getRequestDispatcher("adminMember.jsp");
			dis.forward(request, response);
			
		} else if(category.equals("product")) {
			//전체 상품 목록
			String curPage = request.getParameter("curPage");//현재페이지
			if (curPage==null) { curPage = "1"; }//시작 시 1페이지로 시작
			
			//검색기준, 검색어
			String searchName = request.getParameter("searchName");
			String searchValue = request.getParameter("searchValue");
			String sortBy = request.getParameter("sortBy");
			if (sortBy==null) { sortBy = "p_id"; }
			System.out.println(curPage+" "+searchName+" "+searchValue+" "+sortBy);
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("searchName", searchName);
			map.put("searchValue", searchValue);
			map.put("sortBy", sortBy);
			
			ProductService  product_service  = new ProductService();
			PageDTO pDTO = product_service.selectProduct(map, Integer.parseInt(curPage));
			
			request.setAttribute("pDTO", pDTO);
			request.setAttribute("searchName", searchName);
			request.setAttribute("searchValue", searchValue);
			request.setAttribute("sortBy", sortBy);
			
			RequestDispatcher dis = request.getRequestDispatcher("adminProduct.jsp");
			dis.forward(request, response);
			
		} else if(category.equals("challenge")) {
			//관리자가 작성한 챌린지 목록
			ChallengeService challService = new ChallengeService();
			List<ChallengeDTO> challList = challService.selectChallengeByUserid("admin1");
			
			request.setAttribute("challList", challList);
			RequestDispatcher dis = request.getRequestDispatcher("adminChallenge.jsp");
			dis.forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}