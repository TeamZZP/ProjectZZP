package com.controller.review;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.MemberDTO;
import com.dto.ProductOrderReviewDTO;
import com.dto.ReviewDTO;
import com.dto.ReviewProductDTO;
import com.service.ReviewService;

@WebServlet("/reviewOneSelect")
public class reviewOneSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public reviewOneSelect() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String REVIEW_ID = request.getParameter("REVIEW_ID");
		String P_ID = request.getParameter("P_ID");
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("REVIEW_ID", REVIEW_ID);
		map.put("P_ID", P_ID);
		System.out.println("map 확인 " + map);
		
		HttpSession session = request.getSession();
		MemberDTO mDTO = (MemberDTO) session.getAttribute("login");
		if (mDTO != null) {
			ReviewService service = new ReviewService();
			ProductOrderReviewDTO rDTO = service.selectOneReview(map);
			System.out.println(rDTO);
			 
			session.setAttribute("selectOneReview", rDTO);
			response.sendRedirect("reviewUpdate.jsp");
			
		} else {
			session.setAttribute("mesg", "로그인이 필요합니다");
			response.sendRedirect("LoginUIServlet");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
