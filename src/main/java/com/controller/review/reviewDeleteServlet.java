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
import com.service.ReviewService;

@WebServlet("/reviewDeleteServlet")
public class reviewDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public reviewDeleteServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String REVIEW_ID = request.getParameter("REVIEW_ID");
		String USERID = request.getParameter("USERID");
		System.out.println(REVIEW_ID + "\t" + USERID);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("REVIEW_ID", REVIEW_ID);
		map.put("USERID", USERID);
		
		HttpSession session = request.getSession();
		MemberDTO mDTO = (MemberDTO) session.getAttribute("login");
		if (mDTO != null) {
			ReviewService service = new ReviewService();
			int reviewDel = service.reviewDelete(map);
			System.out.println("리뷰 삭제 갯수 " + reviewDel);
			
			if (reviewDel != 0) {
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.print("삭제성공");
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
