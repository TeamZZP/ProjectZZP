package com.controller.admin;

import java.io.IOException;
import java.text.DecimalFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.ChallengeService;

/**
 * Servlet implementation class AdminMainServlet2
 */
@WebServlet("/AdminMainServlet2")
public class AdminMainServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminMainServlet2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//총 판매액
		ChallengeService service = new ChallengeService();
		double sales = service.getTotalSales();
		DecimalFormat df = new DecimalFormat("\u00A4 #,###");
		//판매액 증가율
		double origin = sales - service.getTodaySales();
		double increase = (sales-origin)/origin*100;
		String salesIncrease 
			= ( (increase >= 0)? "+" : "-" ) + String.format("%.2f%%", increase);
		
		//회원수
		int member = service.getTotalMember();
		//회원 증가율
		double originM = member - service.getTodayMember();
		double increaseM = (member-originM)/originM*100;
		String memberIncrease
			= ( (increaseM >= 0)? "+" : "-" ) + String.format("%.2f%%", increaseM);
		
		request.setAttribute("sales", df.format(sales));
		request.setAttribute("salesIncrease", salesIncrease);
		
		request.setAttribute("member", member+" 명");
		request.setAttribute("memberIncrease", memberIncrease);
		
		RequestDispatcher dis = request.getRequestDispatcher("adminMain.jsp");
		dis.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
