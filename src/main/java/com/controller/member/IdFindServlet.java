package com.controller.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.MemberDTO;
import com.service.MemberService;

@WebServlet("/IdFindServlet")
public class IdFindServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String username = request.getParameter("username");
		String phone = request.getParameter("phone");
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		System.out.println(username);
		System.out.println(phone);
		System.out.println(email1);
		System.out.println(email2);
		HttpSession session = request.getSession();
		//전화번호로 찾기
		if (phone!=""&&phone!=null) {
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("username", username);
			map.put("phone", phone);
			System.out.println(map);
			MemberService service = new MemberService();
			MemberDTO dto = service.findId(map);
			if (dto!=null) {
				session.setAttribute("findId", dto);
				response.sendRedirect("member/findIresult.jsp");
			} else {
				 response.setContentType("text/html; charset=UTF-8");
		         PrintWriter out = response.getWriter();
				 out.println("<script language='javascript'>");
		         out.println("alert('해당 회원 정보가 없습니다:(')");
		         out.println("location.href='IdFindUIServlet';");
		         out.println("</script>");
		         out.flush();
		         response.sendRedirect("IdFindUIServlet");
			}
		} 
		//이메일로 찾기
		if (email1!=""&&email1!=null) {
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
