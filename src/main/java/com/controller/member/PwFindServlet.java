package com.controller.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.MemberDTO;
import com.service.MemberService;

@WebServlet("/PwFindServlet")
public class PwFindServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		String type = request.getParameter("type");
		String userid = request.getParameter("userid");
		String username = request.getParameter("username");
		String phone = request.getParameter("phone");
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		
		if (type.equals("phone")) {
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("userid", userid);
			map.put("username", username);
			map.put("phone", phone);
			map.put("type", type);
			MemberService service = new MemberService();
			MemberDTO dto = service.findPw(map);
			if (dto!=null) {
				session.setAttribute("findPw", dto);
				response.sendRedirect("findPwResult.jsp");
			} else {
				 request.setAttribute("mesg", "해당 회원 정보가 없습니다:(");
				 RequestDispatcher dis = request.getRequestDispatcher("PwFindUIServlet");		
				 dis.forward(request, response);
			}
		} 
		//이메일로 찾기
		else {
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("userid", userid);
			map.put("username", username);
			map.put("email1", email1);
			map.put("email2", email2);
			map.put("type", type);
			MemberService service = new MemberService();
			MemberDTO dto = service.findPw(map);
			if (dto!=null) {
				session.setAttribute("findPw", dto);
				response.sendRedirect("findPwResult.jsp");
			} else {
				 request.setAttribute("mesg", "해당 회원 정보가 없습니다:(");
				 RequestDispatcher dis = request.getRequestDispatcher("PwFindUIServlet");		
				 dis.forward(request, response);
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
