package com.controller.review;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.MemberDTO;
import com.dto.ReviewDTO;
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
			String ORDER_ID = request.getParameter("ORDER_ID");
			String P_ID = request.getParameter("P_ID");
			System.out.println("orderId확인 " + ORDER_ID + "\t" + P_ID);
			
			Map<String, String> map = new HashMap<String, String>();
			map.put("ORDER_ID", ORDER_ID);
			map.put("P_ID", P_ID);
			
			ReviewService service = new ReviewService();
			ReviewDTO dto = service.orderIDreivewCheck(map);
			System.out.println("리뷰 " + dto);
			
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			if (dto != null) {
				out.print(dto.getReview_id());
			} else {
				out.print(0);
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
