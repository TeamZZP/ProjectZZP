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
		
		
		//addMember+Address+profile
		HashMap<String, String> map = new HashMap<String, String>();
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
		int num = 0;
		try {
			num = service.addMember(map);
			if (num != 0) {
				int couponNum = service.memberAddCoupon(userid);
				System.out.println("회원가입 축하 쿠폰 " + couponNum);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			System.out.println("MemberAddServlet>>>"+num);
			HttpSession session = request.getSession();
			String nextPage = "";
			if (num>0) {
				session.setAttribute("mesg", userid+"님 회원가입 회원가입을 축하합니다 :)");
				nextPage = "LoginUIServlet";
				session.setMaxInactiveInterval(60*30);
				
			} else if (num==0) {
				session.setAttribute("mesg", "다시 시도해 주시기 바랍니다.");
				nextPage = "MemberUIServlet";
			}
			session.setMaxInactiveInterval(60*30);
			response.sendRedirect(nextPage);
		 }	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
