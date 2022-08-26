package com.controller.main;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.CategoryProductDTO;
import com.dto.ChallengeDTO;
import com.service.ChallengeService;
import com.service.ProductService;

@WebServlet("/MainServlet")
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		//배너-이달의 챌린지
		ChallengeService cservice = new ChallengeService(); 
		ChallengeDTO challThisMonth = cservice.selectChallThisMonth();
		request.setAttribute("challThisMonth", challThisMonth);
		
		//베스트 상품
		ProductService  product_service  = new ProductService(); 
		List<CategoryProductDTO> product_list = product_service.bestProductList();
		request.setAttribute("bestprod", product_list);
		
		//챌린지 리스트
		ChallengeService service = new ChallengeService();
		List<ChallengeDTO> callenge_list = service.selectNewChallenge();
		System.out.println(callenge_list);
		request.setAttribute("newchall", callenge_list);
		
		RequestDispatcher dis = request.getRequestDispatcher("main.jsp");		
		dis.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
		
}
