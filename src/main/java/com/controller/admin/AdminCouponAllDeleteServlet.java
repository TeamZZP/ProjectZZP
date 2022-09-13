package com.controller.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.MemberDTO;
import com.service.CouponService;

@WebServlet("/AdminCouponAllDeleteServlet")
public class AdminCouponAllDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminCouponAllDeleteServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String coupon_id = request.getParameter("coupon_id");
		String[] couponId = coupon_id.split(",");
		List<String> couponList = Arrays.asList(couponId);
		System.out.println(couponList);
		
		HttpSession session = request.getSession();
		MemberDTO mDTO = (MemberDTO) session.getAttribute("login");
		if (mDTO.getRole() == 1) {
			CouponService service = new CouponService();
			int num = service.couponAllDel(couponList);
			System.out.println(num);
			
			if (num != 0) {
				session.setAttribute("mesg", "쿠폰이 삭제되었습니다");
				response.sendRedirect("AdminCategoryServlet?category=coupon");
			} else {
				session.setAttribute("mesg", "쿠폰이 삭제되지 않았습니다. 다시 시도해주세요");
				response.sendRedirect("AdminCategoryServlet?category=coupon");
			}
			
		}/*else {
		session.setAttribute("mesg", "권한이 없습니다");
		response.sendRedirect("MainServlet");
		}*/
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
