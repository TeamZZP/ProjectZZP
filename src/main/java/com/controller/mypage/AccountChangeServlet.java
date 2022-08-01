package com.controller.mypage;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.MemberDTO;
import com.service.AccountService;

/**
 * Servlet implementation class AccountChangeServlet
 */
@WebServlet("/AccountChangeServlet")
public class AccountChangeServlet extends HttpServlet {
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("마이페이지 수정 서블릿 실행");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		HttpSession session=request.getSession();
		
		MemberDTO dto=(MemberDTO) session.getAttribute("login");
		//회원 전용
		if (dto != null) {
			//자식창에서 넘어온 데이터 파싱
			String chagnePasswd=request.getParameter("chagnePasswd");
			String userid=request.getParameter("userid");
			System.out.println(chagnePasswd);
			System.out.println(userid);
			
			String email1=request.getParameter("email1");
			String email2=request.getParameter("email2");
			System.out.println(email1);
			System.out.println(email2);
			
			if (chagnePasswd != null) {
				//1. 비밀번호 update--userid 데이터도 필요함--현재 changePasswd.jsp에는 userid 값이 없음->hidden으로 설정
				HashMap<String, String> passwdMap=new HashMap<String, String>();
				passwdMap.put("userid", userid);
				passwdMap.put("chagnePasswd", chagnePasswd);
				System.out.println(passwdMap);
				AccountService service=new AccountService();
				int num=service.changePasswd(passwdMap);
				System.out.println("수정된 비밀번호 갯수 : "+num);//--비밀번호 수정 완료
				//기존에 보던 수정 페이지로
				response.sendRedirect("mypage/changePasswd.jsp");
			} else if (email1 != null && email2 != null ) {
				//2. 이메일 update
				HashMap<String, String> emailMap=new HashMap<String, String>();
				emailMap.put("userid", userid);
				emailMap.put("email1", email1);
				emailMap.put("email2", email2);
				System.out.println(emailMap);
				AccountService service=new AccountService();
				int num=service.changeEmail(emailMap);
				System.out.println("수정된 이메일 갯수 : "+num);//--이메일 수정 완료
				//기존에 보던 수정 페이지로
				response.sendRedirect("mypage/changeEmail.jsp");
			} else {
				System.out.println("수정 추가");
			}
		} else {
			//alert로 로그인 후 이용하세요 출력
			String mesg="로그인이 필요합니다.";
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
