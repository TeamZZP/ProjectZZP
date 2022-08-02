package com.controller.member;

import java.io.IOException;
import java.util.HashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.service.MemberService;

@WebServlet("/MemberAddServlet")
public class MemberAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String userid = request.getParameter("userid");
		String passwd = request.getParameter("passwd");
		String username = request.getParameter("username");
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		String phone = request.getParameter("phone");
		String post_num = request.getParameter("post_num");
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		System.out.println(userid+" "+passwd+" "+username);
		
		//영문(대소문자 구분), 숫자, 특수문자 조합, 9~12자리
//		Pattern pattern = Pattern.compile("^(?=.*\\\\\\\\d)(?=.*[~`!@#$%\\\\\\\\^&*()-])(?=.*[a-z])(?=.*[A-Z]).{9,12}$"); 
//		Matcher matcher = pattern.matcher(passwd);
//		System.out.println(matcher.find());
		
		//이름 : 한글
//		boolean username_check = Pattern.matches("^[가-힣a-zA-Z]*$", username);
//		 // "^[a-zA-Z]*$"
//		System.out.println("이름 : " + username_check);
//		//비밀번호 : 영문(대소문자 구분), 숫자, 특수문자 조합, 9~12자리
//		boolean passwd_check = 
//				Pattern.matches("^(?=.*\\\\\\\\\\\\\\\\d)(?=.*[~`!@#$%\\\\\\\\\\\\\\\\^&*()-])(?=.*[a-z])(?=.*[A-Z]).{9,12}$", passwd);
//		System.out.println("비밀번호 : " + passwd_check);
		
		
		
		//addMember+Address+profile
		HashMap<String, String> map = new HashMap<String, String>();
	//	if (username_check==true) {
			//map.put("username",username);
	//	} else {
	//		HttpSession session = request.getSession();
	//		session.setAttribute("mesg", "이름확인");
	//		session.setMaxInactiveInterval(60*60);
	//		response.sendRedirect("MemberUIServlet");
	//	}
		map.put("userid", userid);
		map.put("passwd", passwd);
		map.put("username", username);
		map.put("email1", email1);
		map.put("email2", email2);
		map.put("phone", phone);
		map.put("post_num", post_num);
		map.put("addr1", addr1);
		map.put("addr2", addr2);
	
		MemberService service = new MemberService();
		int num = service.addMember(map);
		System.out.println(num);
		
		if (num>0) {
			HttpSession session = request.getSession();
			session.setAttribute("mesg", userid+"님 회원가입 회원가입을 축하합니다 :)");
			session.setMaxInactiveInterval(60*30);
			
			response.sendRedirect("LoginUIServlet");
		} else {
			response.sendRedirect("MemberUIServlet");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
