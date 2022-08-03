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
import com.service.AccountService;
import com.service.MemberService;

/**
 * Servlet implementation class ChangePasswdServlet
 */
@WebServlet("/PasswdChangeServlet")
public class PasswdChangeServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("비밀번호 수정 서블릿 실행");
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
			String changedPasswd=request.getParameter("changedPasswd");
			System.out.println(userid);
			System.out.println(passwd);
			System.out.println(changedPasswd);
			
			//비밀번호 update
			HashMap<String, String> passwdMap=new HashMap<String, String>();
			passwdMap.put("userid", userid);
			passwdMap.put("changedPasswd", changedPasswd);
			System.out.println(passwdMap);
			AccountService service=new AccountService();
			int num=service.changePasswd(passwdMap);
			System.out.println("수정된 비밀번호 갯수 : "+num);//--비밀번호 수정 완료
			
			mesg="비밀번호가 변경되었습니다.";
			
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
