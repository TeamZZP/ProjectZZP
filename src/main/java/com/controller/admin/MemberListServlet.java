package com.controller.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.AddressDTO;
import com.dto.MemberDTO;
import com.service.AddressService;
import com.service.MemberService;

/**
 * Servlet implementation class MemberListServlet
 */
@WebServlet("/MemberListServlet")
public class MemberListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("관리자 페이지 - 회원 목록 출력 서블릿 실행");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		HttpSession session=request.getSession();
		
		MemberDTO dto=(MemberDTO) session.getAttribute("login");
		
		//관리자 전용
		if (dto != null) {
			String userid=dto.getUserid();
			System.out.println(userid);
			//회원 정보
//			MemberService m_service=new MemberService();
//			MemberDTO member=m_service.selectMember(userid);
//			//주소 정보
//			AddressService a_service=new AddressService();
//			AddressDTO address=a_service.selectAddress(userid);
			
//			session.setAttribute("login", member);
//			session.setAttribute("address", address);
			response.sendRedirect("memberList.jsp");//로그인 된 계정 정보 session 저장-마이페이지 오픈
		} else {
			//alert로 로그인 후 이용하세요 출력
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
