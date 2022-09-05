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

@WebServlet("/NaverLoginServlet")
public class NaverLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String email = request.getParameter("email");
		String username = request.getParameter("username");
		System.out.println(email+" "+username);
		
		//이메일 나누기
		int emailSplit = email.indexOf("@");
		String email1 = email.substring(0, emailSplit);
		String email2 = email.substring(emailSplit+1,email.length());
		System.out.println(email1+" "+email2);
		
		//네이버 데이터로 기존 회원 여부 확인
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("username", username);
		MemberService mService = new MemberService();
		MemberDTO dto = mService.selectMemberBySocial(map);
		System.out.println(dto);
		
		//회원아닌 경우 회원가입
		HttpSession session = request.getSession();
		if (dto==null) {
			//회원가입
			HashMap<String, String> memberMap = new HashMap<String, String>();
			map.put("userid", email);
			map.put("passwd", "1");
			map.put("username", username);
			map.put("email1", email1);
			map.put("email2", email2);
			map.put("phone", "01000000000");
			map.put("post_num", "우편");
			map.put("addr1", "도로명주소");
			map.put("addr2", "지번주소");
			MemberService service = new MemberService();
			int num = 0;
			try {
				num = service.addMember(map);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				System.out.println(num);
				//로그인
				HashMap<String, String> Loginmap = new HashMap<String, String>();
				Loginmap.put("userid", email);
				Loginmap.put("passwd", "1");
				MemberDTO loginedto = service.loginMember(Loginmap);
				System.out.println(loginedto);
				session.setAttribute("login", loginedto); 
			}
		} 
		//회원인 경우 로그인 처리
		else {
			session.setAttribute("login", dto);
		}
		session.setMaxInactiveInterval(60*60);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}