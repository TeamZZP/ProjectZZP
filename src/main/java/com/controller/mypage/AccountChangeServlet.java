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
			//1. 비밀번호 update--userid 데이터도 필요함--현재 changePasswd.jsp에는 userid 값이 없음->hidden으로 설정
			String chagnePasswd=request.getParameter("chagnePasswd");
			String userid=request.getParameter("userid");
			System.out.println(chagnePasswd);
			System.out.println(userid);
			HashMap<String, String> map=new HashMap<String, String>();
			map.put("userid", userid);
			map.put("chagnePasswd", chagnePasswd);
			System.out.println(map);
			AccountService service=new AccountService();
			int num=service.changePasswd(map);
			System.out.println("수정된 비밀번호 갯수 : "+num);//--비밀번호 수정 완료
			
			//2. 이메일 update
			String email1=request.getParameter("email1");
			String email2=request.getParameter("email2");
			System.out.println(email1);
			System.out.println(email2);
			
			//기존에 보던 수정 페이지로
			response.sendRedirect("mypage/changePasswd.jsp");
		} else {
			//alert로 로그인 후 이용하세요 출력
			String mesg="로그인 후 이용하세요.";
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
