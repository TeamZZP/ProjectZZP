package com.controller.mypage;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.MemberDTO;
import com.service.AddressService;
import com.service.MemberService;

/**
 * Servlet implementation class AccountChangeServlet
 */

@WebServlet("/AccountChangeServlet")
public class AccountChangeServlet extends HttpServlet {
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("계정 정보 수정 서블릿 실행");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		HttpSession session=request.getSession();
		MemberDTO dto=(MemberDTO) session.getAttribute("login");
		
		//데이터 파싱
		String userid=request.getParameter("userid");
		String passwd=request.getParameter("passwd");
		String changedPasswd=request.getParameter("changedPasswd");
		String email1=request.getParameter("email1");
		String email2=request.getParameter("email2");
		String address_id=request.getParameter("address_id");
		String address_name=request.getParameter("address_name");
		String receiver_name=request.getParameter("receiver_name");
		String receiver_phone=request.getParameter("receiver_phone");
		String post_num=request.getParameter("post");
		String addr1=request.getParameter("addr1");
		String addr2=request.getParameter("addr2");
		String default_chk=request.getParameter("default_chk");
		
		System.out.println(userid);
		System.out.println(passwd);
		System.out.println(changedPasswd);
		System.out.println(email1);
		System.out.println(email2);
		System.out.println(address_id);
		System.out.println(address_name);
		System.out.println(receiver_name);
		System.out.println(receiver_phone);
		System.out.println(post_num);
		System.out.println(addr1);
		System.out.println(addr2);
		System.out.println(default_chk);
		
		MemberService m_service=new MemberService();
		AddressService a_service=new AddressService();
		HashMap<String, String> changedPwMap=new HashMap<String, String>();
		HashMap<String, String> changedEmailMap=new HashMap<String, String>();
		HashMap<String, String> changedAddMap=new HashMap<String, String>();
		
		String mesg="";
		//회원 전용
		if (dto != null) {
			//이메일 map
			changedEmailMap.put("userid", userid);
			changedEmailMap.put("email1", email1);
			changedEmailMap.put("email2", email2);
			//주소 map
			changedAddMap.put("address_id", address_id);
			changedAddMap.put("userid", userid);
			changedAddMap.put("address_name", address_name);
			changedAddMap.put("receiver_name", receiver_name);
			changedAddMap.put("receiver_phone", receiver_phone);
			changedAddMap.put("post_num", post_num);
			changedAddMap.put("addr1", addr1);
			changedAddMap.put("addr2", addr2);
			changedAddMap.put("default_chk", default_chk);
			
			//update
			int e_num=m_service.changeEmail(changedEmailMap);
			System.out.println("회원 이메일 수정 갯수 : "+e_num);				
			int a_num=a_service.changeAddress(changedAddMap);
			System.out.println("회원 주소 수정 갯수 : "+a_num);
			
			if (changedPasswd != null) {
				//비밀번호 map
				changedPwMap.put("userid", userid);
				changedPwMap.put("changedPasswd", changedPasswd);
				//update
				int p_num=m_service.changePw(changedPwMap);
				System.out.println("회원 비밀번호 수정 갯수 : "+p_num);
			}
			
			mesg="계정 정보가 변경되었습니다.";
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
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
