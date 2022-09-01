package com.controller.review;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.MemberDTO;
import com.service.ReviewService;

@WebServlet("/orderIdCheckServlet")
public class orderIdCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public orderIdCheckServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		MemberDTO mDTO = (MemberDTO) session.getAttribute("login");
		if (mDTO != null) {
			int ORDER_ID = Integer.parseInt(request.getParameter("ORDER_ID"));
			System.out.println("orderId확인 " + ORDER_ID);
			
			ReviewService service = new ReviewService();
			int num = service.orderIDreivewCheck(ORDER_ID);
			System.out.println("리뷰 갯수" + num);
			
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			if (num != 1) {
				
			}
			
		} else {
			session.setAttribute("mesg", "로그인이 필요합니다");
			response.sendRedirect("LoginUIServlet");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
