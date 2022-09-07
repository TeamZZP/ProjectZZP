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
		request.setCharacterEncoding("utf-8");
		String category = request.getParameter("category");
		System.out.println("AdminCategoryServlet========" +category);
		
		HttpSession session=request.getSession();
		MemberDTO dto=(MemberDTO) session.getAttribute("login");
		
		//관리자 전용
		if (dto != null && dto.getRole() == 1) {
		
		//페이징 처리
		String curPage = request.getParameter("curPage"); //현재페이지
		if (curPage == null) { curPage = "1"; } //시작 시 1페이지로 시작
		
		//검색기준, 검색어
		String searchName = request.getParameter("searchName");
		String searchValue = request.getParameter("searchValue");
		String sortBy = request.getParameter("sortBy");
		System.out.println(curPage+" "+searchName+" "+searchValue+" "+sortBy);
		
		//위 데이터를 map에 저장
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("searchName", searchName);
		map.put("searchValue", searchValue);
		map.put("sortBy", sortBy);
		
		PageDTO pDTO = null;
		String url = null;
		
		//전체 회원 목록
		if (category.equals("member")) {
			if (sortBy == null) {sortBy="created_at";}//최초 정렬 기준
			System.out.println(curPage+"\t"+searchName+"\t"+searchValue+"\t"+sortBy);
			
			map.put("sortBy", sortBy);
			
			MemberService m_service=new MemberService();
			
			//전체 회원 목록 --->> 검색 기준, 검색어, 정렬 기준, 현재 페이지를 매개변수로 받음
			pDTO=m_service.selectAllMember(map, Integer.parseInt(curPage));
			System.out.println(pDTO);
			
			url = "adminMember.jsp";
			
		//전체 상품 목록
		} else if(category.equals("product")) {
			System.out.println(curPage+" "+searchName+" "+searchValue+" "+sortBy);
			
			map.put("sortBy", sortBy);
			
			ProductService  product_service  = new ProductService();
			pDTO = product_service.selectProduct(map, Integer.parseInt(curPage));
			
			url = "adminProduct.jsp";
			
			
		//관리자가 작성한 챌린지 목록
		} else if(category.equals("challenge")) {
			map.put("userid", "admin1");
			
			ChallengeService challService = new ChallengeService();
			pDTO = challService.selectChallengeByUserid(map, Integer.parseInt(curPage), 10);
			System.out.println(pDTO);
			
			url = "adminChallenge.jsp";
			
			
		//전체 신고 목록
		} else if (category.equals("report")) {
			String status = request.getParameter("status");
			System.out.println(curPage+" "+searchName+" "+searchValue+" "+sortBy+" "+status);
			
			map.put("status", status);
			
			ChallengeService service = new ChallengeService(); 
			pDTO = service.selectAllReport(map, Integer.parseInt(curPage));
			
			request.setAttribute("status", status);
			
			url = "adminReport.jsp";
			
		//쿠폰 목록
		} else if (category.equals("coupon")) {
			
			
			pDTO = service.selectAllReport(map, Integer.parseInt(curPage));
			
			request.setAttribute("status", status);
			
			url = "adminReport.jsp";
		}
		
		request.setAttribute("pDTO", pDTO);
		request.setAttribute("searchName", searchName);
		request.setAttribute("searchValue", searchValue);
		request.setAttribute("sortBy", sortBy);
		
		RequestDispatcher dis = request.getRequestDispatcher(url);
		dis.forward(request, response);
		
		} else {
			//로그인 후 이용하세요 출력
			String mesg="로그인이 필요합니다.";
			session.setAttribute("mesg", mesg);
			session.setMaxInactiveInterval(60*30);
			
			response.sendRedirect("LoginUIServlet");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}