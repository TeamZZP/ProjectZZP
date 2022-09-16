package com.controller.admin;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.MemberDTO;
import com.service.AdminService;

/**
 * Servlet implementation class AdminOrderServlet
 */
@WebServlet("/AdminOrderServlet")
public class AdminOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminOrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		//관리자전용처리
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO) session.getAttribute("login");
						
		if (member!=null && "admin1".equals(member.getUserid())) {
			String statusChange = request.getParameter("statusChange");
			String statusChangeId = request.getParameter("statusChangeId");
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("order_state", statusChange);
			map.put("id", statusChangeId);
			System.out.println(map);
					
			AdminService service = new AdminService();
					
			//주문 상태 변경
			int n = service.updateOrder(map);
			System.out.println(n+"개의 주문 레코드 상태 변경");

			String curPage = request.getParameter("curPage");
			String searchName = request.getParameter("searchName");
			String searchValue = request.getParameter("searchValue");
			String sortBy = request.getParameter("sortBy");
			String status = request.getParameter("status");
							
			System.out.println(curPage+" "+searchName+" "+searchValue+" "+sortBy+" "+status);
							
			response.sendRedirect("AdminCategoryServlet?curPage="+curPage
					+"&searchName="+searchName+"&searchValue="+searchValue
					+"&sortBy="+sortBy+"&status="+status+"&category=order");
							
		} else {
			session.setAttribute("mesg", "잘못된 접근입니다.");
			response.sendRedirect("main");
		}
				
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
