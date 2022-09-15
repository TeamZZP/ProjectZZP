package com.controller.mypage;

import java.io.IOException;
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
@WebServlet("/MypageServlet")
public class MypageServlet extends HttpServlet {
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//데이터 베이스에서 회원 정보 가져옴
		System.out.println("마이페이지 서블릿 실행");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		HttpSession session=request.getSession();
		
		MemberDTO dto=(MemberDTO) session.getAttribute("login");
		
		//회원 전용
		if (dto != null) {
			String userid=dto.getUserid();
			//회원 정보
			MemberService m_service=new MemberService();
			MemberDTO member=m_service.selectMember(userid);

			ProfileDTO m_profile=m_service.selectProfile(userid);
			System.out.println("회원 프로필 : "+m_profile);
			String Profile_txt=m_profile.getProfile_txt();
			if (Profile_txt == null || Profile_txt.equals(" ")) {
				System.out.println("프로필 메세지 내용 없음");
				m_profile.setProfile_txt("프로필 메세지를 입력하세요.");
				System.out.println("수정======"+m_profile);
			}
			//review, member_coupon, member_stamp, challenge
			int myReview=m_service.countReview(userid);
			int myCoupon=m_service.countCoupon(userid);
			int myStamp=m_service.countStamp(userid);
			int myChallenge=m_service.countChallenge(userid);
			System.out.println("리뷰:"+myReview+" 쿠폰:"+myCoupon+" 스탬프:"+myStamp+" 챌린지:"+myChallenge);
			
			request.setAttribute("login", member);
			request.setAttribute("m_profile", m_profile);
			request.setAttribute("myReview", myReview);
			request.setAttribute("myCoupon", myCoupon);
			request.setAttribute("myStamp", myStamp);
			request.setAttribute("myChallenge", myChallenge);
			RequestDispatcher dis=request.getRequestDispatcher("mypage.jsp");//로그인 된 계정 정보 session 저장-마이페이지 오픈
			dis.forward(request, response);
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
