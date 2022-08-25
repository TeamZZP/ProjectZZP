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
import com.service.MemberService;

/**
 * Servlet implementation class AccountDeleteServlet
 */
@WebServlet("/AccountDeleteServlet")
public class AccountDeleteServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("계정 정보 삭제 서블릿 실행");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		HttpSession session=request.getSession();
		MemberDTO dto=(MemberDTO) session.getAttribute("login");
		//자식창에서 넘어온 데이터 파싱
		String userid=request.getParameter("userid");
		String passwd=request.getParameter("passwd");
		
		System.out.println(userid);
		System.out.println(passwd);
		
		String mesg="";
		//회원 전용
		if (dto != null) {
			//delete
			MemberService service=new MemberService();
			
			int num=service.deleteMember(userid);
			System.out.println("삭제 갯수 : "+num);
			
			mesg="회원 탈퇴가 완료되었습니다.";
			
			/*
			 * if (dto.getRole() == 1) {//관리자가 회원 삭제한 경우 mesg="해당 회원이 삭제되었습니다."; }
			 */
			
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
		doGet(request, response);
	}

}
