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

@WebServlet("/AdminCouponOneSelect")
public class AdminCouponOneSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminCouponOneSelect() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String coupon_id = request.getParameter("coupon_id");
		System.out.println("수정할 쿠폰 번호 확인 " + coupon_id);
		
		HttpSession session = request.getSession();
		MemberDTO mDTO = (MemberDTO) session.getAttribute("login");
		if (mDTO.getRole() == 1) {
			CouponService service = new CouponService();
			CouponDTO cDTO = service.selectOneCoupon(coupon_id);
			System.out.println(cDTO);
			
			if (cDTO != null) {
				session.setAttribute("cDTO", cDTO);
				response.sendRedirect("adminCouponUpdate.jsp");
			} else {
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
