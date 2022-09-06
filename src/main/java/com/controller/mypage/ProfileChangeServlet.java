package com.controller.mypage;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.AddressDTO;
import com.dto.MemberDTO;
import com.dto.ProfileDTO;
import com.service.AddressService;
import com.service.MemberService;

/**
 * Servlet implementation class MypageServlet
 */
@WebServlet("/ProfileChangeServlet")
public class ProfileChangeServlet extends HttpServlet {
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//데이터 베이스에서 회원 정보 가져옴
		System.out.println("프로필 수정 서블릿 실행");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		HttpSession session=request.getSession();
		PrintWriter out=response.getWriter();
		
		MemberDTO dto=(MemberDTO) session.getAttribute("login");
		
		//회원 전용
		if (dto != null) {
			String userid=dto.getUserid();
			//회원 프로필
			MemberService service=new MemberService();
			HashMap<String, String> map=new HashMap<String, String>();
			
			String profile_img=request.getParameter("profile_img");
			String profile_txt=request.getParameter("profile_txt");
			map.put("userid", userid);
			map.put("profile_img", profile_img);
			map.put("profile_txt", profile_txt);
			System.out.println("파싱 데이터 map 저장-----"+map);
			
			int num=service.changeProfile(map);
			System.out.println("프로필 수정 개수 : "+num);
			
			ProfileDTO profile=service.selectProfile(userid);
			profile_img=profile.getProfile_img();
			profile_txt=profile.getProfile_txt();
			
			out.print(profile_txt);
			
			
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
