package com.controller.mypage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.MemberDTO;
import com.service.MemberService;

/**
 * Servlet implementation class ChangePasswdServlet
 */
@WebServlet("/PasswdCheckServlet")
public class PasswdCheckServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("비밀번호 확인 서블릿 실행");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		HttpSession session=request.getSession();
		MemberDTO dto=(MemberDTO) session.getAttribute("login");
		String mesg="";
		//회원 전용
		if (dto != null) {
			//데이터 파싱
			String userid=request.getParameter("userid");
			String passwd=request.getParameter("passwd");
			System.out.println(userid);
			System.out.println(passwd);
			
			//1. 비밀번호 check--userid 데이터도 필요함--현재 changePasswd.jsp에는 userid 값이 없음->hidden으로 설정
			//mapper에 있는 selectMember로 회원 정보 가져와서 비밀번호 데이터와 비교
			MemberService service=new MemberService();
			MemberDTO member=service.selectMember(userid);
			String pw=member.getPasswd();
			
			mesg="비밀번호 불일치";
			if (pw.equals(passwd)) {
				System.out.println("비밀번호 일치");
				mesg="비밀번호 일치";
			}
			PrintWriter out = response.getWriter();
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
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
