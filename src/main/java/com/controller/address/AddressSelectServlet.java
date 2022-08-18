package com.controller.address;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.AddressDTO;
import com.dto.MemberDTO;
import com.service.AddressService;

/**
 * Servlet implementation class AddressAddServlet
 */
@WebServlet("/AddressSelectServlet")
public class AddressSelectServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("배송지 select 서블릿 실행");
		HttpSession session = request.getSession();
		
		MemberDTO dto=(MemberDTO) session.getAttribute("login");
		
		//회원 전용
		if (dto != null) {
			String userid=dto.getUserid();
			System.out.println(userid);
			AddressService a_service=new AddressService();
			
			if (request.getParameter("address_id") != null) {//address_id가 입력되었을 때 해당 데이터로 address select
				//데이터 파싱
				String address_id=request.getParameter("address_id");
				System.out.println(address_id);
				AddressDTO addressidAddress=a_service.selectAddressId(address_id);
				System.out.println(addressidAddress);
				
				session.setAttribute("addressidAddress", addressidAddress);
				response.sendRedirect("changeAddress.jsp");
			} else {
				AddressDTO useridAddress=a_service.selectAddress(userid);//selectOne이어서 배송지 여러 개인 경우 err--사용하는 경우 수정 필요
				System.out.println(userid+"의 배송지 : "+useridAddress);
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
		doGet(request, response);
	}

}
