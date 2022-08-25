package com.controller.mypage;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
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
 * Servlet implementation class AccountManagementServlet
 */
@WebServlet("/AccountManagementServlet")
public class AccountManagementServlet extends HttpServlet {
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//데이터 베이스에서 회원 정보 가져옴
		System.out.println("계정관리 서블릿 실행");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		HttpSession session=request.getSession();
		
		MemberDTO dto=(MemberDTO) session.getAttribute("login");
		
		//회원 전용
		if (dto != null) {
			String userid=dto.getUserid();
			System.out.println(userid);
//			if (request.getParameter("admin").equals("true")) {
//				System.out.println("관리자가 회원 계정 접근");
//				RequestDispatcher dis=request.getRequestDispatcher("admin/adminMemberDetail.jsp");
//				dis.forward(request, response);
//			} else {
				MemberService m_service=new MemberService();
				MemberDTO member=m_service.selectMember(userid);
				
				AddressService a_service=new AddressService();
//				List<AddressDTO> addressList=a_service.selectAllAddress(userid);//userid의 전체 address
				//userid-default_chk=1
				AddressDTO address=a_service.selectDefaultAddress(userid);//userid의 기본 배송지
				System.out.println(address);
				
				session.setAttribute("login", member);
//				session.setAttribute("addressList", addressList);
				session.setAttribute("address", address);
				response.sendRedirect("accountForm.jsp");//로그인 된 계정 정보 session 저장-마이페이지 오픈
//			}
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
