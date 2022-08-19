package com.controller.address;

import java.io.IOException;
import java.io.PrintWriter;
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
		HttpSession session=request.getSession();
		
		MemberDTO dto=(MemberDTO) session.getAttribute("login");
		int address_id=Integer.parseInt(request.getParameter("address_id"));
		System.out.println(address_id);
		
		//회원 전용
		if (dto != null) {
			String userid=dto.getUserid();
			System.out.println(userid);
			AddressService a_service=new AddressService();
			HashMap<String, List<AddressDTO>> addressMap=new HashMap<String, List<AddressDTO>>();
			
			//회원의 주소 목록 가져오기
			List<AddressDTO> addressList=a_service.selectAllAddress(userid);
			System.out.println(addressList.size());
			if (addressList.size() == 1) {//회원의 주소가 1개 남았을 때는 삭제 불가--jsp에서 조건 검사하고 넘어도록 수정
				String mesg="배송지는 최소 1개 이상이어야 합니다.";
			} else {
				//address_id로 해당 dto 삭제
				int num=a_service.deleteAddress(address_id);
				System.out.println("삭제 배송지 갯수 : "+num);
			}
			
			//삭제 후 회원 주소 목록 출력
			addressList=a_service.selectAllAddress(userid);
			addressMap.put(userid, addressList);
			System.out.println("addressDelete서블릿 안의 addressmap "+addressMap);
			
			session.setAttribute("addressMap", addressMap);
			response.sendRedirect("mypage/addressList.jsp");//=data
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
