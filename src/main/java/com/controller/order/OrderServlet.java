package com.controller.order;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.MemberDTO;
import com.dto.ToOrderDTO;

/**
 * Servlet implementation class OrderServlet
 */
@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("OrderServlet실행됨");
		HttpSession session = request.getSession();
		MemberDTO dto = (MemberDTO)session.getAttribute("login");
		String mesg = "";
		
		if(dto != null) {
			int p_id = Integer.parseInt((String)request.getAttribute("p_id"));
			int p_amount = Integer.parseInt((String)request.getAttribute("p_amount")) ;
			
			if(p_amount==0) {
				p_amount = 1;
			}
			
			System.out.println(p_id+" "+p_amount);
			
			
		}else {
			mesg="회원전용 서비스입니다, 로그인이 필요합니다.";
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
