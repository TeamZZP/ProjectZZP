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
import com.service.AddressService;
import com.service.MemberService;

@WebServlet("/ChangePwServlet")
public class ChangePwServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String userid = (String)request.getAttribute("userid");
		String changedPasswd = (String)request.getAttribute("changedPasswd");
		System.out.println(userid+" "+changedPasswd);
		
		MemberService service = new MemberService();
		HashMap<String, String> changedPwMap = new HashMap<String, String>();
		changedPwMap.put("userid", userid);
		changedPwMap.put("changedPasswd", changedPasswd);
		
		//update
		int num = service.changePw(changedPwMap);
		System.out.println("회원 비밀번호 수정 : "+num);
		
		response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
		out.println("<script language='javascript'>");
        out.println("alert('비밀번호가 변경되었습니다:)')");
        out.println("location.href='LoginUIServlet';");
        out.println("</script>");
        out.flush();
        response.sendRedirect("LoginUIServlet");
        return;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
