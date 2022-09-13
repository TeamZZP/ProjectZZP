package com.controller.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.CouponDTO;
import com.dto.MemberDTO;
import com.service.CouponService;

@WebServlet("/AdminCouponInsert")
public class AdminCouponInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminCouponInsert() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		MemberDTO mDTO = (MemberDTO) session.getAttribute("login");
		if (mDTO.getRole() == 1) {
			String coupon_name = request.getParameter("coupon_name");
			int coupon_discount = Integer.parseInt(request.getParameter("coupon_discount"));
			String coupon_created = request.getParameter("coupon_created");
			String coupon_validity = request.getParameter("coupon_validity");
			
			CouponDTO cDTO = new CouponDTO(); 
			cDTO.setCoupon_name(coupon_name);
			cDTO.setCoupon_discount(coupon_discount);
			cDTO.setCoupon_created(coupon_created);
			cDTO.setCoupon_validity(coupon_validity);
			System.out.println("cDTO " + cDTO);

			CouponService service = new CouponService();
			int num = service.couponInsert(cDTO);
			System.out.println(num + "개 쿠폰 인서트");
			
			if (num == 1) {
				session.setAttribute("mesg", "쿠폰이 추가되었습니다");
				response.sendRedirect("AdminCategoryServlet?category=coupon");
			} else {
				session.setAttribute("mesg", "쿠폰이 추가되지 않았습니다. 다시 시도해주세요");
				response.sendRedirect("AdminCategoryServlet?category=coupon");
			}
			
		} /*else {
			session.setAttribute("mesg", "권한이 없습니다");
			response.sendRedirect("MainServlet");
		}*/
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
