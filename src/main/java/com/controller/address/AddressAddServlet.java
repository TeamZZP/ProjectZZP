package com.controller.address;

import java.io.IOException;
import java.util.HashMap;
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
 * Servlet implementation class AddressAddServlet222
 */
@WebServlet("/AddressAddServlet")
public class AddressAddServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("회원 배송지 추가 서블릿 실행");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		HttpSession session=request.getSession();
		
		MemberDTO dto=(MemberDTO) session.getAttribute("login");

		//회원 전용
		if (dto != null) {
			String userid=dto.getUserid();
			System.out.println(userid);
			AddressService a_service=new AddressService();
			
			//데이터 파싱
			String address_name=request.getParameter("address_name");
			String receiver_name=request.getParameter("receiver_name");
			String receiver_phone=request.getParameter("receiver_phone");
			String post_num=request.getParameter("post_num");
			String addr1=request.getParameter("addr1");
			String addr2=request.getParameter("addr2");
			int default_chk=Integer.parseInt(request.getParameter("address_name"));
			System.out.println(address_name);
			System.out.println(receiver_name);
			System.out.println(receiver_phone);
			System.out.println(post_num);
			System.out.println(addr1);
			System.out.println(addr2);
			System.out.println(default_chk);

//			session.setAttribute("addressMap", addressMap);//userid의 address 리스트
//			response.sendRedirect("addressList.jsp");
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
