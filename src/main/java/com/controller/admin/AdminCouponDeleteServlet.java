package com.controller.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.MemberDTO;
import com.service.CouponService;

@WebServlet("/AdminCouponDeleteServlet")
public class AdminCouponDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminCouponDeleteServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String coupon_id = request.getParameter("coupon_id");
		System.out.println("삭제할 쿠폰 번호 확인 " + coupon_id);
		
		HttpSession session = request.getSession();
		MemberDTO mDTO = (MemberDTO) session.getAttribute("login");
		if (mDTO.getRole() == 1) {
			CouponService service = new CouponService();
			int num = service.couponDelete(coupon_id); 
			System.out.println("쿠폰 삭제 갯수 " + num);
			
			if (num == 1) {
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
