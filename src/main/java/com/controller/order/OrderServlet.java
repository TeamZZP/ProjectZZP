package com.controller.order;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.AddressDTO;
import com.dto.CategoryProductDTO;
import com.dto.MemberDTO;
import com.service.AddressService;
import com.service.OrderService;

/**
 * Servlet implementation class OrderServlet
 */
@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("OrderServlet실행됨");
		HttpSession session = request.getSession();
		MemberDTO mdto = (MemberDTO)session.getAttribute("login");
		String mesg = "";
		int p_amount = 0;
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		
		//int p_id= 0;
		
		
		
		
		

		
			if(mdto != null) {
				String[] pIdListString = request.getParameterValues("p_id");  //String []로 데이터 파싱해옴
				List<Integer> pIdList = new ArrayList<Integer>();
				
				for (int i = 0; i < pIdListString.length; i++) {             //int[] 형태로 형변환
					 System.out.println("String"+ pIdListString[i]);
					 pIdList.add(Integer.parseInt(pIdListString[i]));
					 System.out.println("Int"+pIdList.get(i));
					
					 
			    }
					OrderService service = new OrderService();
					List<CategoryProductDTO> list = new ArrayList<CategoryProductDTO>();
				
					list = service.getProductList(pIdList); //p_id List로 상품List<상품DTO> 저장
					
					
				for (int i = 0; i < pIdList.size(); i++) {
					System.out.println(list.get(i));
				}
			
			if(Integer.parseInt((String)request.getParameter("p_amount"))==0||(String)request.getParameter("p_amount")==null) { //p_amount 저장
				
				 map.put("p_id",Integer.parseInt((String)request.getParameter("p_id")));
				 map.put("p_amount",1);
				 
			}else {
				
				 map.put("p_id",Integer.parseInt((String)request.getParameter("p_id")));
				 map.put("p_amount",Integer.parseInt((String)request.getParameter("p_amount")));
				
				 }
			//배송지
			AddressService add_service = new AddressService();
			List<AddressDTO> add_list = add_service.selectAllAddress(mdto.getUserid());
			
			
		
			
			request.setAttribute("list", list);
			request.setAttribute("map", map);
			request.setAttribute("add_list", add_list);
			
		
			
			RequestDispatcher dis = request.getRequestDispatcher("order.jsp");
			dis.forward(request, response);
			
			
			
			
		}else {
			mesg="회원전용 서비스입니다, 로그인이 필요합니다.";
			session.setAttribute("mesg", mesg);
			session.setMaxInactiveInterval(60*30);
			response.sendRedirect("LoginUIServlet");
		}
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
