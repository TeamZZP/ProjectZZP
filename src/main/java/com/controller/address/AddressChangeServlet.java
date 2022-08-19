package com.controller.address;

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
import com.service.AddressService;

/**
 * Servlet implementation class AddressChangeServlet
 */
@WebServlet("/AddressChangeServlet")
public class AddressChangeServlet extends HttpServlet {
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("배송지 수정 서블릿 실행");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		HttpSession session=request.getSession();
		
		MemberDTO dto=(MemberDTO) session.getAttribute("login");

		//회원 전용
		if (dto != null) {
			String userid=dto.getUserid();
			AddressService a_service=new AddressService();
			HashMap<String, String> changedAddMap=new HashMap<String, String>();
			
			//데이터 파싱
			String address_id=request.getParameter("address_id");
			String address_name=request.getParameter("address_name");
			String receiver_name=request.getParameter("receiver_name");
			String receiver_phone=request.getParameter("receiver_phone");
			String post_num=request.getParameter("post");
			String addr1=request.getParameter("addr1");
			String addr2=request.getParameter("addr2");
			System.out.println(address_id);
			System.out.println(address_name);
			System.out.println(receiver_name);
			System.out.println(receiver_phone);
			System.out.println(post_num);
			System.out.println(addr1);
			System.out.println(addr2);
			
			//주소 map
			changedAddMap.put("address_id", address_id);
			changedAddMap.put("userid", userid);
			changedAddMap.put("address_name", address_name);
			changedAddMap.put("receiver_name", receiver_name);
			changedAddMap.put("receiver_phone", receiver_phone);
			changedAddMap.put("post_num", post_num);
			changedAddMap.put("addr1", addr1);
			changedAddMap.put("addr2", addr2);
			if (request.getParameter("default_chk") == null) {
				System.out.println("기본 배송지 아님");
				changedAddMap.put("default_chk", "0");
			} else {
				System.out.println("기본 배송지 체크");
				changedAddMap.put("default_chk", "1");
			}
			
			int a_num=a_service.changeAddress(changedAddMap);
			System.out.println(changedAddMap);
			System.out.println("회원 주소 수정 갯수 : "+a_num);
			
			String mesg="배송지가 수정되었습니다.";
			session.setAttribute("mesg", mesg);
			response.sendRedirect("AddressListServlet");
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
