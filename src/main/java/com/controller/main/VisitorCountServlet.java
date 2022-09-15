package com.controller.main;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.UtilService;

/**
 * Servlet implementation class VisitorCountServlet
 */
@WebServlet("/VisitorCountServlet")
public class VisitorCountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VisitorCountServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UtilService service = new UtilService();
		int n = service.countVisitToday(); //오늘 방문자수 구하기
		
		if (n == 0) { //해당 날짜의 첫 방문인 경우 counter 테이블에 insert
			int result = service.addVisit();
			System.out.println(result+"개의 counter 레코드 추가");
		} else { //해당 날짜의 방문이 이미 있는 경우 counter 테이블에 update
			int result = service.updateVisit();
			System.out.println(result+"개의 counter 레코드 업데이트");
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
