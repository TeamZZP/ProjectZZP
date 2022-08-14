package com.controller.address;

import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet("/AddressDeleteServlet")
public class AddressDeleteServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("회원 배송지 삭제 서블릿 실행");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		HttpSession session=request.getSession();
		
		MemberDTO dto=(MemberDTO) session.getAttribute("login");
		int address_id=Integer.parseInt(request.getParameter("address_id"));
		System.out.println(address_id);
		
		String mesg="";
		//회원 전용
		if (dto != null) {
			String userid=dto.getUserid();
			System.out.println(userid);
			AddressService a_service=new AddressService();
			
			//회원의 주소 목록 가져오기
			List<AddressDTO> addressList=a_service.selectAllAddress(userid);
			System.out.println(addressList.size());
			if (addressList.size() == 1) {//회원의 주소가 1개 남았을 때는 삭제 불가
				mesg="배송지는 최소 1개 이상이어야 합니다.";
			} else {
				//address_id로 해당 dto 삭제
				String result="";
				int num=a_service.deleteAddress(address_id);
				System.out.println("삭제 배송지 갯수 : "+num);

				mesg="";
			}
			out.print(mesg);
			//ajax--redirectX
		} else {
			//alert로 로그인 후 이용하세요 출력
			mesg="로그인이 필요합니다.";
			session.setAttribute("mesg", mesg);
			session.setMaxInactiveInterval(60*30);
			
			response.sendRedirect("LoginUIServlet");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
