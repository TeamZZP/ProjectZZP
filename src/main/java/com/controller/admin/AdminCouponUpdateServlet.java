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

@WebServlet("/AdminCouponUpdateServlet")
public class AdminCouponUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminCouponUpdateServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int coupon_id = Integer.parseInt(request.getParameter("coupon_id"));
		String coupon_name = request.getParameter("coupon_name");
		int coupon_discount = Integer.parseInt(request.getParameter("coupon_discount"));
		String coupon_created = request.getParameter("coupon_created");
		String coupon_validity = request.getParameter("coupon_validity");
		CouponDTO dto = new CouponDTO(coupon_id, null, coupon_name, coupon_discount, coupon_created, coupon_validity);
		System.out.println("쿠폰 업데이트 내용 " + dto);
		
		HttpSession session = request.getSession();
		MemberDTO mDTO = (MemberDTO) session.getAttribute("login");
		if (mDTO.getRole() == 1) {
			CouponService service = new CouponService();
			int num = service.couponUpdate(dto);
			System.out.println(num);
			
			if (num != 0) {
				session.setAttribute("mesg", "쿠폰이 수정되었습니다");
				response.sendRedirect("AdminCategoryServlet?category=coupon");
			} else {
				session.setAttribute("mesg", "쿠폰이 수정되지 않았습니다. 다시 시도해주세요");
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
