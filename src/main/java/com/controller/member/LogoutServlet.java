package com.controller.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.MemberDTO;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  request.setCharacterEncoding("UTF-8");
      HttpSession session = request.getSession();
      MemberDTO dto = (MemberDTO) session.getAttribute("login");
      if (dto!=null) {
         session.invalidate();
         
         response.setContentType("text/html; charset=UTF-8");
         PrintWriter out = response.getWriter();

         out.println("<script language='javascript'>");
         out.println("alert('다음에 또 만나요:)')");
         out.println("location.href='MainServlet';");
         out.println("</script>");
         out.flush();
         response.sendRedirect("MainServlet");
      }else {
         response.sendRedirect("LoginUIServlet");
      }
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doGet(request, response);
   }

}