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
		String nextPage = "";
		if (dto!=null) {
			MemberDTO logindto = service.checkPasswd(map);
			System.out.println("checkPasswd>>"+logindto);
			if (logindto!=null) {
				//login 인증정보 저장
				session.setAttribute("login", logindto); 
				nextPage = "MainServlet";
			} else {
				session.setAttribute("mesg", "비밀번호가 틀렸습니다:(");
				nextPage = "LoginUIServlet";
			}
		} else {
			//DB정보 없을 시 mesg 출력
			session.setAttribute("mesg", "일치하는 회원이 없습니다:(");
			nextPage = "LoginUIServlet";
		}
		session.setMaxInactiveInterval(60*60);
		response.sendRedirect(nextPage);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
