package com.controller.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.MemberDTO;
import com.service.MemberService;

@WebServlet("/MemberAddServlet")
public class MemberAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid = request.getParameter("userid");
		String passwd = request.getParameter("passwd");
		String username = request.getParameter("username");
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		String phone = request.getParameter("phone");
		
		
		String post = request.getParameter("post");
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		
		MemberDTO dto = new MemberDTO(userid, passwd, username, phone, email1, email2, null);
		MemberService service = new MemberService();
		int num = service.addMember(dto);
		System.out.println(num);
		
		HttpSession session = request.getSession();
		session.setAttribute("memberAdd", userid+"님 회원가입 회원가입을 축하합니다 :)");
		session.setMaxInactiveInterval(60*30);
		
		response.sendRedirect("main.jsp");
		
	}
	
	  

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
