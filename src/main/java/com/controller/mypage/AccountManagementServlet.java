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
			MemberService m_service=new MemberService();
			AddressService a_service=new AddressService();

			if (dto.getRole() == 1) {
				System.out.println("관리자가 회원 계정 접근");
				//회원 id 파싱
				String id=request.getParameter("memberId");
				System.out.println("회원 아이디======="+id);
				
				MemberDTO member=m_service.selectMember(id);
//				AddressDTO address=a_service.selectDefaultAddress(id);//회원의 기본 배송지
				List<AddressDTO> addressList=a_service.selectAllAddress(id);//회원의 전체 address

				request.setAttribute("member",member);
//				request.setAttribute("address", address);
				request.setAttribute("addressList", addressList);
//				System.out.println("회원 : "+member);
//				System.out.println("주소 : "+address);
//				System.out.println("주소 목록 : "+addressList);
				RequestDispatcher dis=request.getRequestDispatcher("adminMemberDetail.jsp");
				dis.forward(request, response);
			} else {
				System.out.println("회원이 계정 접근");
				MemberDTO member=m_service.selectMember(userid);
				
				//userid-default_chk=1
				AddressDTO address=a_service.selectDefaultAddress(userid);//userid의 기본 배송지
				System.out.println(address);
				
				request.setAttribute("login", member);
				request.setAttribute("address", address);
				RequestDispatcher dis=request.getRequestDispatcher("accountForm.jsp");//로그인 된 계정 정보 session 저장-마이페이지 오픈
				dis.forward(request, response);
			}
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
