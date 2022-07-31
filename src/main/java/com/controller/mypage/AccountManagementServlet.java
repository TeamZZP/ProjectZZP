package com.controller.mypage;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.AddressDTO;
import com.dto.MemberDTO;
import com.dto.OrderDTO;
import com.service.AddressService;
import com.service.MemberService;
import com.service.OrderService;

/**
 * Servlet implementation class AccountManagementServlet
 */
@WebServlet("/AccountManagementServlet")
public class AccountManagementServlet extends HttpServlet {
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//데이터 베이스에서 회원 정보 가져옴
		System.out.println("마이페이지 서블릿 실행");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		HttpSession session=request.getSession();
		
		MemberDTO dto=(MemberDTO) session.getAttribute("login");
		//회원 전용
		if (dto != null) {
			String userid=dto.getUserid();
			System.out.println(userid);
			
			MemberService m_service=new MemberService();
			MemberDTO member=m_service.mypage(userid);
			System.out.println(member);
			
			AddressService a_service=new AddressService();
			AddressDTO address=a_service.address(userid);
			System.out.println(address);
			
			OrderService o_service=new OrderService();
			OrderDTO orders=o_service.orders(userid);
			System.out.println(orders);
			
			HashMap<String, String> profilemap=new HashMap<String, String>();
			//profilemap.put("userid", userid);
			
			session.setAttribute("login", member);
			session.setAttribute("address", address);
			session.setAttribute("orders", orders);
			response.sendRedirect("accountForm.jsp");//로그인 된 계정 정보 session 저장-마이페이지 오픈//mypage로 이름 바꿀까?
		} else {
			//alert로 로그인 후 이용하세요 출력
			String mesg="로그인이 필요합니다.";
			session.setAttribute("mesg", mesg);
			session.setMaxInactiveInterval(60*30);
			
			response.sendRedirect("LoginUIServlet");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
