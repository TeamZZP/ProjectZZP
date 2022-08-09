package com.controller.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.dto.MemberDTO;
import com.service.MemberService;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid = request.getParameter("userid");
		String passwd = request.getParameter("passwd");
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("userid", userid);
		map.put("passwd", passwd);
		
		MemberService service = new MemberService();
		MemberDTO dto = service.loginMember(map);
		System.out.println(dto);
		
		HttpSession session = request.getSession();
		if (dto!=null) {
			//login 인증정보 저장
			session.setAttribute("login", dto); 
			session.setMaxInactiveInterval(60*60);
			response.sendRedirect("MainServlet");
		} else {
			//DB정보 없을 시 mesg 출력
			session.setAttribute("mesg", "로그인 정보가 올바르지 않습니다:("); 
			session.setMaxInactiveInterval(60*30);
			response.sendRedirect("LoginUIServlet");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
