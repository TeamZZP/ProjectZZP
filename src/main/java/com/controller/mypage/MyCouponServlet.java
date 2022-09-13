package com.controller.mypage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.MemberDTO;
import com.dto.PageDTO;
import com.service.CouponService;
import com.service.QuestionService;

@WebServlet("/MyCouponServlet")
public class MyCouponServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MyCouponServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberDTO mDTO = (MemberDTO) session.getAttribute("login");
		if(mDTO != null) {
			PageDTO pDTO = new PageDTO();
			String curPage = request.getParameter("curPage"); //현재 페이지
			if (curPage == null) {
				curPage = "1";
			}
			
			String userid = mDTO.getUserid();
			
			CouponService service = new CouponService();
			pDTO = service.myCouponList(Integer.parseInt(curPage), userid);
			System.out.println(pDTO);
			
			session.setAttribute("myCouponList", pDTO);
			response.sendRedirect("myCoupon.jsp");
			
		} else {
			session.setAttribute("mesg", "로그인이 필요합니다");
			response.sendRedirect("LoginUIServlet");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
