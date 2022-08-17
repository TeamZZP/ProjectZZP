package com.controller.admin;

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
import com.service.MemberService;

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
			MemberService m_service=new MemberService();
			AddressService a_service=new AddressService();
			HashMap<String, List<AddressDTO>> addressMap=new HashMap<String, List<AddressDTO>>();
			//전체 회원 목록
			List<MemberDTO> memberList=m_service.selectAllMember();
			
			String userid=null;
			
			//전체 회원 주소 목록--회원별 주소
			for (int i = 0; i < memberList.size(); i++) {
				userid=memberList.get(i).getUserid();
				List<AddressDTO> addressList=a_service.selectAllAddress(userid);//회원별 주소--userid로 select
				//System.out.println(userid+"님의 주소 : "+addressList);
				addressMap.put(userid, addressList);//userid로 해당 주소 리스트 출력
			}
//			System.out.println(addressMap);
//			for (int i = 0; i < addressMap.size(); i++) {
//				List<AddressDTO> addressList=addressMap.get("aaa1");
//				//System.out.println(addressList);
//			}
			session.setAttribute("memberList", memberList);
			session.setAttribute("addressMap", addressMap);//userid의 address 리스트
			response.sendRedirect("adminpage.jsp");
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
