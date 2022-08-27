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
			HashMap<String, String> map=new HashMap<String, String>();
			map.put("searchName", searchName);
			map.put("searchValue", searchValue);
			map.put("sortBy", sortBy);
			
			MemberService m_service=new MemberService();
			AddressService a_service=new AddressService();
			HashMap<String, AddressDTO> addMap=new HashMap<String, AddressDTO>();
			
			//전체 회원 목록 --->> 검색 기준, 검색어, 정렬 기준, 현재 페이지를 매개변수로 받음
			List<MemberDTO> memberList=m_service.selectAllMember();
			//PageDTO pDTO=m_service.selectAllMember2(map, Integer.parseInt(curPage));
			
			String userid=null;
			//전체 회원 주소 목록--회원별 주소
			for (int i = 0; i < memberList.size(); i++) {
				userid=memberList.get(i).getUserid();
				AddressDTO address=a_service.selectDefaultAddress(userid);
				addMap.put(userid, address);//userid의 기본 주소 출력
			}
			
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
		} else if (category.equals("report")) {
			
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}