package com.controller.mypage;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.MemberDTO;
import com.dto.PageDTO;
import com.service.OrderService;

@WebServlet("/MyOrderServlet")
public class MyOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MyOrderServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberDTO mDTO = (MemberDTO) session.getAttribute("login");
		if (mDTO != null) {
			PageDTO pDTO = new PageDTO();
			String curPage = request.getParameter("curPage"); //현재 페이지
			if (curPage == null) {
				curPage = "1";
			}
			String userid = mDTO.getUserid();
			
			String search = request.getParameter("search");
			String searchCategory = request.getParameter("searchCategory");
			System.out.println("검색어 " + search + "\t" + searchCategory);
			
			Map<String, String> map = new HashMap<String, String>();
			map.put("search", search); 
			map.put("searchCategory", searchCategory);
			map.put("userid", userid);
			if (search != null) {
				OrderService service = new OrderService();
				pDTO = service.MyOrderSearchList(Integer.parseInt(curPage), map);
				System.out.println("pDTO " + pDTO); 
				
				request.setAttribute("search", search);
				request.setAttribute("searchCategory", searchCategory);
				session.setAttribute("myOrderList", pDTO);	
				
				RequestDispatcher dis = request.getRequestDispatcher("myOrder.jsp");
				dis.forward(request, response);
			} else {
				OrderService service = new OrderService();
				pDTO = service.MyOrderList(Integer.parseInt(curPage), userid);
				System.out.println("pDTO " + pDTO);
				
				session.setAttribute("myOrderList", pDTO);	
				
				response.sendRedirect("myOrder.jsp");
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
