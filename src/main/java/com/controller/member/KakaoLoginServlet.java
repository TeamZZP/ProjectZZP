package com.controller.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.dto.MemberDTO;
import com.service.MemberService;

@WebServlet("/KakaoLoginServlet")
public class KakaoLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String email = request.getParameter("email");
		String nickname = request.getParameter("nickname");
		String accessToken = request.getParameter("accessToken");
		System.out.println(accessToken);
		
		//카카오 데이터로 기존 회원 여부 확인
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("username", nickname);
		map.put("accessToken", accessToken);
		MemberService mService = new MemberService();
		MemberDTO dto = mService.selectMemberBykakao(map);
		System.out.println(dto);
		
		//회원아닌 경우 회원가입
		HttpSession session = request.getSession();
		if (dto==null) {
			session.setAttribute("kakaoInfo", map);
			response.sendRedirect("MemberUIServlet");
		} 
		//회원인 경우 로그인 처리
		else {
			session.setAttribute("login", dto);
			session.setAttribute("kakaoInfo", map);
			session.setMaxInactiveInterval(60*60);
			response.sendRedirect("MainServlet");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}