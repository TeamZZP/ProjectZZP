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
		HttpSession session = request.getSession();
		
		String type = request.getParameter("type");
		String username = request.getParameter("username");
		String phone = request.getParameter("phone");
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		System.out.println(type);
		
		if (type.equals("phone")) {
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("username", username);
			map.put("phone", phone);
			System.out.println(map);
			MemberService service = new MemberService();
			MemberDTO dto = service.findId(map);
			if (dto!=null) {
				session.setAttribute("findId", dto);
				response.sendRedirect("findIresult.jsp");
			} else {
				 response.setContentType("text/html; charset=UTF-8");
		         PrintWriter out = response.getWriter();
				 out.println("<script language='javascript'>");
		         out.println("alert('해당 회원 정보가 없습니다:(')");
		         out.println("location.href='IdFindUIServlet';");
		         out.println("</script>");
		         out.flush();
		         response.sendRedirect("IdFindUIServlet");
		         return;
			}
		} 
		//이메일로 찾기
		else {
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("username", username);
			map.put("email1", email1);
			map.put("email2", email2);
			System.out.println(map);
			MemberService service = new MemberService();
			MemberDTO dto = service.findIdforemail(map);
			System.out.println(dto);
			if (dto!=null) {
				session.setAttribute("findId", dto);
				response.sendRedirect("findIresult.jsp");
			} else {
				 response.setContentType("text/html; charset=UTF-8");
		         PrintWriter out = response.getWriter();
				 out.println("<script language='javascript'>");
		         out.println("alert('해당 회원 정보가 없습니다:(')");
		         out.println("location.href='IdFindUIServlet';");
		         out.println("</script>");
		         out.flush();
		         response.sendRedirect("IdFindUIServlet");
		         return;
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
