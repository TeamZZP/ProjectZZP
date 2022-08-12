package com.controller.member;

import java.io.IOException;
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

@WebServlet("/PwCheckServlet")
public class PwCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String userid = request.getParameter("userid");
		String changedPasswd = request.getParameter("changedPasswd");
		
		if (userid!=null && changedPasswd!=null) {
			MemberService service = new MemberService();
			MemberDTO dto = service.checkPw(userid);
			System.out.println(dto);
			String passwd = dto.getPasswd();
			if (passwd.equals(changedPasswd)) {
				session.setAttribute("mesg", "기존 비밀번호와 동일합니다. 다시 입력해주세요.");
				response.sendRedirect("findPwResult.jsp");
			} else {
				request.setAttribute("userid", userid);
				request.setAttribute("changedPasswd", changedPasswd);
				RequestDispatcher dis = request.getRequestDispatcher("ChangePwServlet");
				dis.forward(request, response);
			}
		} else {
			session.setAttribute("mesg", "잘못된 접근입니다.");
			response.sendRedirect("PwFindUIServlet");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
