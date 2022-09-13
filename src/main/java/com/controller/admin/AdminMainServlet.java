package com.controller.admin;

import java.io.IOException;
import java.text.DecimalFormat;
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
import com.dto.PageDTO;
import com.service.AddressService;
import com.service.ChallengeService;
import com.service.MemberService;

@WebServlet("/AdminMainServlet")
public class AdminMainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("관리자 페이지 - Main");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		HttpSession session=request.getSession();
		
		MemberDTO dto=(MemberDTO) session.getAttribute("login");
		
		//관리자 전용
//		if (dto != null && dto.getRole() == 1) {
			//총 판매액
			ChallengeService service = new ChallengeService();
			double sales = service.getTotalSales();
			DecimalFormat df = new DecimalFormat("\u00A4 #,###");
			//판매액 증가율
			double origin = sales - service.getTodaySales();
			double increase = (sales-origin)/origin*100;
			String salesIncrease 
				= ( (increase >= 0)? "+" : "-" ) + String.format("%.2f%%", increase);
			
			//회원수
			int member = service.getTotalMember();
			//회원 증가율
			double originM = member - service.getTodayMember();
			double increaseM = (member-originM)/originM*100;
			String memberIncrease
				= ( (increaseM >= 0)? "+" : "-" ) + String.format("%.2f%%", increaseM);
			
			request.setAttribute("sales", df.format(sales));
			request.setAttribute("salesIncrease", salesIncrease);
			
			request.setAttribute("member", member+" 명");
			request.setAttribute("memberIncrease", memberIncrease);
			
			RequestDispatcher dis = request.getRequestDispatcher("adminMain.jsp");
			dis.forward(request, response);
			
//		} else {
//			//alert로 로그인 후 이용하세요 출력
//			String mesg="로그인이 필요합니다.";
//			session.setAttribute("mesg", mesg);
//			session.setMaxInactiveInterval(60*30);
//			
//			response.sendRedirect("LoginUIServlet");
//		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
