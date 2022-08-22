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
import com.service.AddressService;
import com.service.ChallengeService;
import com.service.MemberService;
import com.service.ProductService;

@WebServlet("/AdminCategoryServlet")
public class AdminCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String category = request.getParameter("category");
		
		HttpSession session=request.getSession();
		MemberDTO dto=(MemberDTO) session.getAttribute("login");
		
		System.out.println(category);
		if (category.equals("member")) {
			MemberService m_service=new MemberService();
			AddressService a_service=new AddressService();
			HashMap<String, List<AddressDTO>> addressMap=new HashMap<String, List<AddressDTO>>();
			//전체 회원 목록
			List<MemberDTO> memberList=m_service.selectAllMember();
			
			String userid=null;
			
			//전체 회원 주소 목록--회원별 주소
			for (int i = 0; i < memberList.size(); i++) {
				userid=memberList.get(i).getUserid();
				List<AddressDTO> addressList=a_service.selectAllAddress(userid);
				addressMap.put(userid, addressList);//userid로 해당 주소 리스트 출력
			}
			System.out.println("memberList"+memberList);
			System.out.println("addressMap"+addressMap);
			request.setAttribute("memberList", memberList);
			request.setAttribute("addressMap", addressMap);//userid의 address 리스트
			RequestDispatcher dis = request.getRequestDispatcher("adminMember.jsp");
			dis.forward(request, response);
		} else if(category.equals("product")) {
			//전체 상품 목록
			ProductService  product_service  = new ProductService();
			List<CategoryProductDTO> product_list = product_service.ProductList();

			request.setAttribute("product_list", product_list);
			RequestDispatcher dis = request.getRequestDispatcher("adminProduct.jsp");
			dis.forward(request, response);
		} else if(category.equals("challenge")) {
			//관리자가 작성한 챌린지 목록
			ChallengeService challService = new ChallengeService();
			List<ChallengeDTO> challList = challService.selectChallengeByUserid("admin1");
			
			request.setAttribute("challList", challList);
			RequestDispatcher dis = request.getRequestDispatcher("admin/adminChallenge.jsp");
			dis.forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}