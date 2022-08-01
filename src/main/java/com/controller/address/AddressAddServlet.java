package com.controller.address;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.AddressDTO;
import com.dto.MemberDTO;
import com.service.AddressService;

/**
 * Servlet implementation class AddressAddServlet
 */
@WebServlet("/AddressAddServlet")
public class AddressAddServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		MemberDTO dto = new MemberDTO();
		dto = (MemberDTO)session.getAttribute("login");
		String userid = dto.getUserid();
		AddressDTO dtoAdd = new AddressDTO();
		
		AddressService service = new AddressService(); 
		dtoAdd =  service.selectAddress(userid);
		
		
		
		System.out.println(userid+"의 배송지"+dtoAdd);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
